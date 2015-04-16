/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.Goal;
import Models.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.junit.After;
import org.junit.AfterClass;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
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
public class Create_GoalTest {

    @Mock
    Database mockDatabase;
    Create_Goal instance;
    HttpServletRequest mockRequest;
    HttpServletResponse mockResponse;
    HttpSession mockSession;

    public Create_GoalTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
        //Create mock versions of request/response/session using Mockito
        mockRequest = mock(HttpServletRequest.class);
        mockResponse = mock(HttpServletResponse.class);
        mockSession = mock(HttpSession.class);

        //Create instance of log in servlet
        instance = new Create_Goal();

        instance.setDatabase(mockDatabase);
    }

    @After
    public void tearDown() {
    }

    //Tests whether or not a goal is set to GAIN given a goal with a target weight
    //larger than the user's current weight
    @Test
    public void testGainGoal() throws Exception {

        //Mock user with weight of 70kg (less than 80kg target) and mock other values
        User mockUser = new User("test1", "testFirst", "testLast", "testEmail", 70, 1.6);

        //Add this mock user to the mock session
        mockSession.setAttribute("loggedInUser", mockUser);
        given(mockSession.getAttribute("loggedInUser")).willReturn(mockUser);
        given(mockRequest.getSession()).willReturn(mockSession);

        //Set up expected variables
        //Target weight of 80kg
        given(mockRequest.getParameter("targetWeight")).willReturn("80");
        //Empty responses as they are not relevant to the scope of this test
        given(mockRequest.getParameter("groupName")).willReturn(" ");
        given(mockRequest.getParameter("targetDate")).willReturn(" ");
        given(mockRequest.getParameter("description")).willReturn(" ");

        //Run instance
        //We are expecting exceptions to be thrown
        try {
            instance.processRequest(mockRequest, mockResponse);
        } catch (Exception ex) {}
        //Ensure that the goal type is GAIN
        assertTrue(instance.getGoal().getType() == Goal.Type.GAIN);
    }

    //Tests whether or not a goal is set to LOSS given a goal with a target weight
    //smaller than the user's current weight
    @Test
    public void testLossGoal() throws Exception {
        //Mock user with weight of 70kg (more than 60kg target) and mock other values
        User mockUser = new User("test1", "testFirst", "testLast", "testEmail", 70, 1.6);

        //Add this mock user to the mock session
        mockSession.setAttribute("loggedInUser", mockUser);
        given(mockSession.getAttribute("loggedInUser")).willReturn(mockUser);
        given(mockRequest.getSession()).willReturn(mockSession);

        //Set up expected variables
        //Target weight of 60kg
        given(mockRequest.getParameter("targetWeight")).willReturn("60");
        //Empty responses as they are not relevant to the scope of this test
        given(mockRequest.getParameter("groupName")).willReturn(" ");
        given(mockRequest.getParameter("targetDate")).willReturn(" ");
        given(mockRequest.getParameter("description")).willReturn(" ");

        //Run instance
        //We are expecting exceptions to be thrown
        try {
            instance.processRequest(mockRequest, mockResponse);
        } catch (Exception ex) {}
        //Ensure that the goal type is GAIN
        assertTrue(instance.getGoal().getType() == Goal.Type.LOSS);
    }

}
