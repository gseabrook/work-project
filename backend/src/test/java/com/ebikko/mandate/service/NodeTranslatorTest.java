package com.ebikko.mandate.service;

import com.ebikko.mandate.model.Bank;
import com.ebikko.mandate.model.BankAccount;
import ebikko.Node;
import ebikko.NodeType;
import ebikko.Repository;
import ebikko.Session;
import org.hamcrest.core.Is;
import org.junit.Before;
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

    @Test
    public void translate() throws Exception {
        Bank bank = new Bank("HSBC", "HSBC");
        BankAccount bankAccount = new BankAccount(bank,"12345678");

        given(session.getNodeTypeByName(anyString())).willReturn(nodeType);

        Node node = nodeTranslator.translate(bankAccount, session);

        assertThat(node.getNodeType(), is(nodeType));

        assertThat(node.getValue("bank_name"), Is.<Object>is("HSBC"));
    }

}