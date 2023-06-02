package com.kh.swithme.member.model.service;

public interface MemberService {
	
	
	//아이디 중복 체크
	int idCheck(String checkId);
	
	//닉네임 중복체크
	int nickCheck(String checkNick);
	
}
