package com.ebikko.mandate;

import com.ebikko.SessionAction;
import com.ebikko.SessionService;
import com.ebikko.config.DirectDebitApplication;
import ebikko.*;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.stubbing.Answer;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;
import org.springframework.mail.MailSender;

import javax.sql.DataSource;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Properties;

import static org.mockito.Mockito.*;

@Configuration
@Import(DirectDebitApplication.class)
@Profile("embeddeddb")
public class EmbeddedDBTestConfiguration {

    @MockBean
    private MailSender mailSender;

    @Bean
    public DataSource dataSource() {
        EmbeddedDatabaseBuilder builder = new EmbeddedDatabaseBuilder();
        return builder
                .setType(EmbeddedDatabaseType.HSQL)
                .addScript("db/create-db.sql")
                .addScript("db/insert-data.sql")
                .build();
    }

    @Bean
    public SessionService sessionService() throws Exception {
        Field escapeChar = Filter.class.getField("ESCAPE_CHAR");
        setFinalStatic(escapeChar, "\\");

        SessionService mockSessionService = mock(SessionService.class);
        TestRepository repository = mock(TestRepository.class);

        when(repository.getConnection()).thenReturn(dataSource().getConnection());
        when(repository.getDriver()).thenReturn("mysql");

        when(repository.getProperty("web.defaultTimeZone")).thenReturn("Asia/Kuala_Lumpur");

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
