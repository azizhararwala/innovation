package com.gale.craftday.homeworkhelper;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class QuizzleyRenderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final Logger LOGGER = Logger.getLogger(QuizzleyRenderServlet.class);

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {
    	String quizzleyUrl = request.getParameter("url");
    	System.err.println("URL IS: " + quizzleyUrl);
    	
    	CrossDomainServiceCaller serviceCaller = new CrossDomainServiceCaller();
    	try {
			String quizzleyPage = serviceCaller.retrieveContent(quizzleyUrl, 50000, "utf-8");
			writeResultsToResponse(quizzleyPage, response);
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    
    private void writeResultsToResponse(String results, HttpServletResponse response) {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        response.addHeader("X-FRAME-OPTIONS", "ALLOW-FROM http://localhost:8080");
        
        try {
            PrintWriter out = response.getWriter();
            out.println(results);
            out.close();
            LOGGER.error("AZZZZ: " + results);
            System.err.println(results);
        } catch (IOException e) {
            LOGGER.error("Unable to write results to response: " + results, e);
        }
    }    

}
