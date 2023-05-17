package com.test6.controller;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.test6.repository.MemberRepository;

class MemberControllerTest {
	
	@Autowired
	MemberController memberController;
	@Autowired
	MemberRepository memberRepository;
	
	@Test
	void joinTest() {
		
		String nickname = "김김김";
		
	}

}
