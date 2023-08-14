package com.care.stay.common;

public class AdminPageService {
	public static String printPage(String url, int currentPage, int totalCount, int pageBlock, String stayType) {
		String result = "";

		if (currentPage <= 1) {
	        result += "<a href='" + url + "1&stayType=" + stayType + "'>[이전] </a>";
	    } else {
	        result += "<a href='" + url + (currentPage - 1) + "&stayType=" + stayType + "'>[이전] </a>";
	    }

	    int totalPage = totalCount / pageBlock;
	    if (totalCount % pageBlock != 0)
	        totalPage++;

	    for (int i = 1; i <= totalPage; i++) {
	        result += "<a href='" + url + i + "&stayType=" + stayType + "'>[" + i + "] </a>";
	    }

	    if (currentPage >= totalPage) {
	        result += "<a href='" + url + totalPage + "&stayType=" + stayType + "'>[다음] </a>";
	    } else {
	        result += "<a href='" + url + (currentPage + 1) + "&stayType=" + stayType + "'>[다음] </a>";
	    }

	    return result;
	}	

}
