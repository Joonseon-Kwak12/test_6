package com.test6.interceptor;

import java.io.Writer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.test6.ut.Ut;
import com.test6.vo.Member;

@Component
public class NeedLogoutInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		Member loginedMember = (Member)session.getAttribute("loginedMember");
		
		if (loginedMember != null) {
			
			response.setContentType("text/html;charset=UTF-8");
			Writer printWriter = response.getWriter();
			String replaceString = Ut.replace("로그인 중에는 불가능합니다.", "/main");
			printWriter.write(replaceString);
			printWriter.flush(); //https://okky.kr/questions/361279 - flush, close 꼭 써야하는지?
			printWriter.close();
			
			return false;
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}
