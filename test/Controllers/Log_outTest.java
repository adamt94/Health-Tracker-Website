/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

/**
 *
 * @author Stuart
 */
public class Log_outTest {
    
    Log_out instance;
    HttpServletRequest mockRequest;
    HttpServletResponse mockResponse;
    HttpSession mockSession;
    
    public Log_outTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        mockRequest = mock(HttpServletRequest.class);
        mockResponse = mock(HttpServletResponse.class);
        mockSession = mock(HttpSession.class);
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of processRequest method, of class Log_out.
     */
    @Test
    public void testLogOut() throws Exception {
        System.out.println("testLogOut");
        instance = new Log_out();
        
        given(mockRequest.getSession()).willReturn(mockSession);
        
        instance.processRequest(mockRequest, mockResponse);
        
        //Expect redirect to index page
         verify(mockResponse).sendRedirect("index.jsp");
    }
    
}
