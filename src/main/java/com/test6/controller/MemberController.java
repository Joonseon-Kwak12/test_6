package com.test6.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test6.repository.MemberRepository;
import com.test6.ut.Ut;
import com.test6.vo.Member;

@Controller
public class MemberController {
	
	MemberRepository memberRepository;
	
	public MemberController(MemberRepository memberRepository) {

		this.memberRepository = memberRepository;
	}

	@GetMapping({"", "/main", "/home/main"})
	public String showMain(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession(false);
		if (session == null) {
			model.addAttribute("loginedMember", null);
			return "/main";
		}
		
		Member loginedMember = (Member)session.getAttribute("loginedMember");
		model.addAttribute("loginedMember", loginedMember);
		
		return "/main";
	}

	@GetMapping("/login")
	public String showLoginForm() {
		return "/member/login";
	}
	
	@PostMapping("/login")
	@ResponseBody
	public String login(@RequestParam String loginId, @RequestParam String loginPw, HttpServletRequest request) {
		
		Member foundMember = memberRepository.getMemberByLoginId(loginId);
		if (foundMember == null) {
			return Ut.historyBack("일치하는 회원 정보가 존재하지 않습니다.");
		}
		
		if (!foundMember.getLoginPw().equals(loginPw) ) {
			return Ut.historyBack("비밀번호가 일치하지 않습니다.");
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("loginedMember", foundMember);
		
		return Ut.replace("로그인 성공!", "/main");
	}
	
	@GetMapping("/logout")
	@ResponseBody
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		
		return Ut.replace("로그아웃 성공!", "/main");
	}
	
	@GetMapping("/join")
	public String showJoin() {
		
		return "/member/join";
	}
	
	@PostMapping("/join")
	@ResponseBody
	public String doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email, HttpServletResponse response) {
		
		if (memberRepository.getMemberByLoginId(loginId) != null) {
			return Ut.historyBack("이미 사용 중인 아이디입니다.");
		}
		
		if (memberRepository.getMemberByLoginId(loginId) != null) {
			return Ut.historyBack("이미 사용 중인 메일 주소입니다.");
		}
		
		memberRepository.join(loginId, loginPw, name, nickname, cellphoneNum, email);
		
		//return "redirect:/login";
		return Ut.replace("회원가입 성공", "/login");
	}
	
	@GetMapping("/checkDupLoginId")
	@ResponseBody
	public String checkDupId(String loginId) {
		
		if (memberRepository.getMemberByLoginId(loginId) == null) {
			return "Y";
		}
		return "N";
	}
	
	@GetMapping("/checkDupEmail")
	@ResponseBody
	public String checkDupEmail(String email) {
		
		if (memberRepository.getMemberByEmail(email) == null) {
			return "Y";
		}
		return "N";
	}
}
