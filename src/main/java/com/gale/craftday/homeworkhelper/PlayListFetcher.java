package com.gale.craftday.homeworkhelper;

import java.io.IOException;

public class PlayListFetcher {
    public static String fetchList() throws IOException {
        CrossDomainServiceCaller caller= new CrossDomainServiceCaller();
        return caller.retrieveContent("http://www.khanacademy.org/api/v1/playlists", 1000, "utf-8");
    }
    
    public static String fetchGalaxyVideos(String searchTerm) throws IOException {
        CrossDomainServiceCaller caller= new CrossDomainServiceCaller();
        return caller.retrieveContent("http://delmarhealthcare.com/galaxy-web/webservice/media/search?discipline=&startPosition=0&resultsPerPage=20&searchTerm=" + searchTerm, 1000, "utf-8");
    }
    
    public static String fetchQuizletSearchResults() throws IOException {
    	CrossDomainServiceCaller caller= new CrossDomainServiceCaller();
    	return caller.retrieveContent("https://api.quizlet.com/2.0/search/sets?creator=rohitl&client_id=yZwtUfzcqN", 1000, "utf-8");
    }
    
    public static String fetchQuizletHistorySet() throws IOException {
    	CrossDomainServiceCaller caller = new CrossDomainServiceCaller();
    	return caller.retrieveContent("https://api.quizlet.com/2.0/sets/21408878?client_id=yZwtUfzcqN", 1000, "utf-8");
    }
    
    public static String fetchQuizletPage(String url) throws IOException {
    	CrossDomainServiceCaller caller = new CrossDomainServiceCaller();
    	String contents = caller.retrieveContent(url, 1000, "utf-8");
    	int beginIndex = contents.indexOf("<body>");
    	String endBodyTag = "</body>";
		int endIndex = contents.indexOf(endBodyTag);
		return contents.substring(beginIndex , endIndex + endBodyTag.length() );
    }
    
}
