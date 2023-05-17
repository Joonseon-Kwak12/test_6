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
		int id = memberRepository.join("abc11", "11", "김철수", nickname, "01000000123", "abcedd11@test6.com");
		
		Assertions.assertThat(nickname).isEqualTo(memberRepository.getMemberById(id).getNickname());
		
	}

}
