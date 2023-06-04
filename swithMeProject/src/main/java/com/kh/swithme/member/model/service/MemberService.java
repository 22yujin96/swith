package com.kh.swithme.member.model.service;

import com.kh.swithme.member.model.vo.Member;

public interface MemberService {
	
	
	//아이디 중복 체크
	int idCheck(String checkId);
	
	//닉네임 중복체크
	int nickCheck(String checkNick);
	
	//이메일 중복체크
	int emailCheck(String checkEmail);
	
	//회원가입
	int joinMember(Member m);
	
	//회원가입시 포인트 insert
	int joinPoint(Member m);

	
}
