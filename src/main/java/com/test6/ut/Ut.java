package com.test6.ut;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

public class Ut {
	
	public static String f(String format, Object... args) {
		
		return String.format(format, args);
	}

	
	public static String historyBack(String msg) {
		
		if (msg == null) {
			msg = "";
		}
		
		return Ut.f("<script> const msg = '%s'.trim(); if (msg.length > 0) {alert(msg);}history.back();</script>", msg);
	}
	
	public static String replace(String msg, String uri) {
		if (msg == null) {
			msg = "";
		}
		if (uri == null) {
			uri = "/";
		}
		
		return Ut.f("<script>const msg = '%s'.trim();if (msg.length > 0) {alert(msg);}location.replace('%s')</script>", msg, uri);
	}
	
	public static void setContentTypeAndReplace(String msg, String uri, HttpServletResponse response) {
		
		response.setContentType("text/html; charset=UTF-8");
		
		print(replace(msg, uri), response);
	}
	
	public static void print(String str, HttpServletResponse response) {
		try {
			response.getWriter().append(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
