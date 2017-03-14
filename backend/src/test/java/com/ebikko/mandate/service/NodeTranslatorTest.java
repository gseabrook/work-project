package com.ebikko.mandate.service;

import com.ebikko.mandate.model.Bank;
import com.ebikko.mandate.model.CustomerBankAccount;
import ebikko.Node;
import ebikko.NodeType;
import ebikko.Repository;
import ebikko.Session;
import org.hamcrest.core.Is;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.Is.is;
import static org.mockito.BDDMockito.given;
import static org.mockito.Matchers.anyString;
import static org.mockito.Mockito.mock;

@RunWith(MockitoJUnitRunner.class)
public class NodeTranslatorTest {

    @Mock
    private Session session;
    @Mock
    private NodeType nodeType;
    private NodeTranslator nodeTranslator;

    @Before
    public void setUp() throws Exception {
        nodeTranslator = new NodeTranslator();
        given(nodeType.getSession()).willReturn(session);
        given(session.getRepository()).willReturn(mock(Repository.class));
    }

    @Ignore("WIP")
    @Test
    public void translate() throws Exception {
        Bank bank = new Bank("HSBC", "HSBC");
        CustomerBankAccount customerBankAccount = new CustomerBankAccount(bank,"12345678");

        given(session.getNodeTypeByName(anyString())).willReturn(nodeType);

        Node node = nodeTranslator.translate(customerBankAccount, session);

        assertThat(node.getNodeType(), is(nodeType));

        assertThat(node.getValue("bank_name"), Is.<Object>is("HSBC"));
    }

}