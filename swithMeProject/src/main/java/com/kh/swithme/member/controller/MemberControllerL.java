package com.kh.swithme.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberControllerL {
	
	
	@RequestMapping("join.me")
	public String joinMember() {
		
		return "member/memberEnrollForm";
	}

	
	
	
}
