/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.mockito.BDDMockito.given;
import org.mockito.Mock;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

/**
 *
 * @author Stuart
 */
public class Register_MealTest {

    @Mock
    Database mockDatabase;
    Log_in instance;
    HttpServletRequest mockRequest;
    HttpServletResponse mockResponse;

    public Register_MealTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
        //Create mock versions of request/response using Mockito
        mockRequest = mock(HttpServletRequest.class);
        mockResponse = mock(HttpServletResponse.class);

        //Set up expected variables
        given(mockRequest.getParameter("userName")).willReturn("test1");
        given(mockRequest.getParameter("password")).willReturn("test1");
        given(mockRequest.getSession(true)).willReturn(mock(HttpSession.class));

        //Create instance of log in servlet
        instance = new Log_in();

        //Create a mock database for use with instance
        mockDatabase = mock(Database.class);

        when(mockDatabase.validateUser("test1", "test1")).thenReturn(true);

        instance.setDatabase(mockDatabase);
    }

    @After
    public void tearDown() {
    }

    //When the user makes a valid login attempt, it's expected that they will
    //be sent to the View_Profile controller
    @Test
    public void testValidLogIn() throws Exception {
        System.out.println("testing Valid Login...");
        //
        //Test that the log_in servlet redirects to View_Profile when given correct details
        //

        //When instance attempts to validate user return true
        when(instance.database.validateUser("test1", "test1")).thenReturn(true);
        //When instance attempst to get user return a User object
        User testUser = new User();
        when(instance.database.getUser("test1")).thenReturn(testUser);

        instance.processRequest(mockRequest, mockResponse);

        //Verify there was a redirect to View_Profile servlet as expected
        verify(mockResponse).sendRedirect("View_Profile");

    }

}
