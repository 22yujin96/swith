package com.kh.swithme.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberControllerL {
	
	//회원가입 작성 폼으로 이동
	@RequestMapping("memberEnrollForm.me")
	public String memberEnrollForm() {
		
		return "member/memberEnrollForm";
	}
	
	//로그인 폼으로 이동
	@RequestMapping("loginForm.me")
	public String loginMemberForm() {
		
		return "member/loginForm";
	}

	
	//아이디 찾기 폼으로 이동
	@RequestMapping("searchIdForm.me.me")
	public String searchIdForm() {
		return "member/searchIdForm";
	}
	
	
}
