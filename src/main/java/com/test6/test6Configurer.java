package com.test6;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.test6.interceptor.NeedLoginInterceptor;
import com.test6.interceptor.NeedLogoutInterceptor;


@Configuration
public class test6Configurer implements WebMvcConfigurer {
	
	@Autowired
	NeedLoginInterceptor needLoginInterceptor;
	@Autowired
	NeedLogoutInterceptor needLogoutInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		InterceptorRegistration ir;

		ir = registry.addInterceptor(needLoginInterceptor);
		ir.addPathPatterns("/logout");
		
		ir = registry.addInterceptor(needLogoutInterceptor);
		ir.addPathPatterns("/login");
	}
}
