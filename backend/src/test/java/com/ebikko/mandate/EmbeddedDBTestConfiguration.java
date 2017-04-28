package com.ebikko.mandate;

import com.ebikko.SessionAction;
import com.ebikko.SessionService;
import com.ebikko.config.DirectDebitApplication;
import com.ebikko.config.EbikkoAuthenticationManager;
import com.ebikko.mandate.service.EmailService;
import com.ebikko.mandate.service.NodeService;
import com.hazelcast.config.Config;
import com.hazelcast.config.MapConfig;
import com.hazelcast.config.NetworkConfig;
import com.hazelcast.core.Hazelcast;
import com.hazelcast.core.HazelcastInstance;
import com.hazelcast.core.IMap;
import ebikko.*;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.stubbing.Answer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.mail.MailSender;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.io.File;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.sql.Connection;
import java.util.Properties;

import static org.mockito.Matchers.anyInt;
import static org.mockito.Mockito.*;

@Configuration
@EnableTransactionManagement
@Import(DirectDebitApplication.class)
@Profile("embeddeddb")
public class EmbeddedDBTestConfiguration {

    @MockBean
    private EmailService emailService;
    @MockBean
    private MailSender mailSender;
    @MockBean
    private NodeService nodeService;

    @Autowired
    private DataSource dataSource;
    @Autowired
    private TestAuthenticationManager testAuthenticationManager;

    @Bean
    public EbikkoAuthenticationManager ebikkoAuthenticationManager() {
        return testAuthenticationManager;
    }

    @Bean
    public SessionService sessionService() throws Exception {
        File f = new File(this.getClass().getClassLoader().getResource("ebikko.license.properties").toURI());
        System.setProperty("EBIKKO_CONFIG_DIR", f.getPath());

        Config config = new Config();
        config.setProperty("hazelcast.shutdownhook.enabled", "false");
        config.setInstanceName("Test HAZY123");
        config.addMapConfig(new MapConfig("ebikko.configs"));

        NetworkConfig network = config.getNetworkConfig();
        network.getJoin().getTcpIpConfig().setEnabled(false);
        network.getJoin().getMulticastConfig().setEnabled(false);
        HazelcastInstance instance = Hazelcast.init(config);
        IMap<Object, Object> map = instance.getMap("ebikko.configs");

        Properties ebikkoProperties = new Properties();
        ebikkoProperties.put("organization", "Ag-I Solutions Sdn Bhd");
        ebikkoProperties.put("user-licenses", "103");
        ebikkoProperties.put("license-type", "saas");
        ebikkoProperties.put("valid-until", "2017-07-01");
        ebikkoProperties.put("modules", "core;workflow;esign");
        ebikkoProperties.put("license-key", "9ed78eb848c75772f0d53ddd97181758f1485a0e035052adbaab27bbcf464580");

        map.put("ebikko.license.properties", ebikkoProperties);


        Field escapeChar = Filter.class.getField("ESCAPE_CHAR");
        setFinalStatic(escapeChar, "\\");

        SessionService mockSessionService = mock(SessionService.class);
        TestRepository repository = mock(TestRepository.class);
        Connection connection = DataSourceUtils.getConnection(dataSource);
        connection.setAutoCommit(false);
        when(repository.getConnection()).thenReturn(connection);
        when(repository.getDriver()).thenReturn("mysql");

        when(repository.getProperty("web.defaultTimeZone")).thenReturn("Asia/Kuala_Lumpur");
        when(repository.getProperty("repo.maxUserLogins")).thenReturn("1000");

        Constructor<Session> constructor = Session.class.getDeclaredConstructor(Repository.class, String.class);
        constructor.setAccessible(true);
        Session session = constructor.newInstance(repository, "ebikkoservices");

        ebikko.Profile profile = mock(ebikko.Profile.class);
        when(profile.canDo(anyInt())).thenReturn(true);

        Principal principal = mock(Principal.class);
        when(principal.getUserName()).thenReturn("testusername");
        when(principal.getName()).thenReturn("Test User");
        when(principal.getUid()).thenReturn("123235adkl2");
        when(principal.getProfile()).thenReturn(profile);

        final Session spy = spy(session);
        doReturn(true).when(spy).canSee(any(BaseObject.class));
        doReturn(true).when(spy).canChange(any(BaseObject.class));
        doReturn(true).when(spy).canCreate(any(BaseObject.class));
        doReturn(true).when(spy).canGiveAccess(any(BaseObject.class));
        doReturn(principal).when(spy).getLoginDetails();
        doReturn(principal).when(spy).getPrincipalByUserName(anyString());
        doReturn("root").when(spy).getUserName();
        doReturn(false).when(spy).isLocked(any(Node.class));
        doReturn(true).when(spy).isInTransaction();

        when(mockSessionService.loadRepositoryProperty(anyString())).thenCallRealMethod();
        when(mockSessionService.performSessionAction(any(SessionAction.class))).thenAnswer(new Answer<Object>() {
            @Override
            public Object answer(InvocationOnMock invocation) throws Throwable {
                SessionAction sessionAction = (SessionAction) invocation.getArguments()[0];
                return sessionAction.perform(spy);
            }
        });

        return mockSessionService;
    }

    private void setFinalStatic(Field field, Object newValue) throws Exception {
        field.setAccessible(true);

        Field modifiersField = Field.class.getDeclaredField("modifiers");
        modifiersField.setAccessible(true);
        modifiersField.setInt(field, field.getModifiers() & ~Modifier.FINAL);

        field.set(null, newValue);
    }

    class TestRepository extends Repository {

        public TestRepository(Properties props) {
            super(props);
        }

        public String getDriver() {
            return "";
        }
    }
}
