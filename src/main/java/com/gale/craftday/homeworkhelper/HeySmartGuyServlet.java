package com.gale.craftday.homeworkhelper;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class HeySmartGuyServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String SEARCH_REQUEST = "/search?";
    private static final Pattern SEARCH_URL_PATTERN = Pattern.compile(SEARCH_REQUEST);

    private static final String DISPLAY_GROUPS_PARAMETER = "displayGroups";
    private static final String CONTENT_SETS_PARAMETER = "contentSets";
    private static final String QUERY_PARAMETER = "query";

    private static final String URL_ENCODING = "UTF-8";
    private static final String SEARCH_AND_GET_RESULTS_URL = "http://think.eqa.gghybrid.com/craftday/service/searchAndGetResults";
    private static final int SEARCH_TIMEOUT_MS = 10000;
    private static final String SEARCH_RESULT_CHARSET = "ISO8859_1";

    private static final Logger LOGGER = Logger.getLogger(HeySmartGuyServlet.class);

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {

        String actionRequest = request.getPathInfo();

//        if (isSearchRequest(actionRequest)) {
            try {
				searchAndGetResults(request, response);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//        }
    }

    private boolean isSearchRequest(String actionRequest) {
        Matcher matcher = SEARCH_URL_PATTERN.matcher(actionRequest);
        return matcher.find();
    }

    private void searchAndGetResults(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String query = request.getParameter(QUERY_PARAMETER);
        System.out.println("query parameter is: " + query);
        String galaxyVideos = PlayListFetcher.fetchGalaxyVideos(query);
//        String contentSets = request.getParameter(CONTENT_SETS_PARAMETER);
//        String displayGroups = request.getParameter(DISPLAY_GROUPS_PARAMETER);

//        String searchRequestURL = constructSearchRequestURL(query, contentSets, displayGroups);

//        String searchResults = makeSearchRequest(searchRequestURL);

        writeResultsToResponse(galaxyVideos, response);
    }

    private void writeResultsToResponse(String results, HttpServletResponse response) {
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        
        try {
            PrintWriter out = response.getWriter();
            out.println(results);
            out.close();
        } catch (IOException e) {
            LOGGER.error("Unable to write results to response: " + results, e);
        }
    }

    private String makeSearchRequest(String searchRequestURL) {
        String searchResponse = "";

        try {
            searchResponse = new CrossDomainServiceCaller().retrieveContent(searchRequestURL, SEARCH_TIMEOUT_MS,
                    SEARCH_RESULT_CHARSET);
        } catch (IOException e) {
            LOGGER.error("Exception received calling search request: " + searchRequestURL, e);
        }

        return searchResponse;
    }

    private String constructSearchRequestURL(String query, String contentSets, String displayGroups) {
        return String.format("%s/%s/displayGroups=%s&startPos=1&pageSize=5", SEARCH_AND_GET_RESULTS_URL,
                encodeParameter(query), encodeParameter(displayGroups));
    }

    private String encodeParameter(String parameter) {
        String encodedParameter = "";

        if (parameter != null) {
            try {
                encodedParameter = URLEncoder.encode(parameter, URL_ENCODING);
            } catch (UnsupportedEncodingException e) {
                LOGGER.error("Unable to encode the following parameter; skipping parameter: " + parameter, e);
            }
        }
        return encodedParameter;
    }
}
