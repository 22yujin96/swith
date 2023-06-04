package com.kh.swithme.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.swithme.member.model.service.MemberService;
import com.kh.swithme.member.model.vo.Member;

@Controller
public class MemberControllerL {
	
	
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
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
	@RequestMapping("searchIdForm.me")
	public String searchIdForm() {
		return "member/searchIdForm";
	}
	
	//비밀번호 찾기 폼으로 이동
	@RequestMapping("searchPwdForm.me")
	public String searchPwdForm() {
		return "member/searchPwdForm";
	}
	
	//마이페이지 알람으로 가기
	@RequestMapping("alarm.me")
	public String myPageAlarm() {
		return "member/myPageAlarm";
	}
	//메일 작성폼으로 이동
	@RequestMapping("mail.me")
	public String myPageMail() {
		return "member/myPageMail";
	}
	//마이페이지 프로필로 이동
	@RequestMapping("profil.me")
	public String profilMember() {
		return "member/myPageProfil";
	}
	
	
	
	
	
	
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		return memberService.idCheck(checkId) > 0 ? "N" : "Y";

	}
	//닉네임 중복체크
	@ResponseBody
	@RequestMapping("nickCheck.me")
	public String nickCheck(String checkNick) {
		return memberService.nickCheck(checkNick) > 0 ? "N" : "Y";
	}
	
	//이메일 중복체크
	@ResponseBody
	@RequestMapping("emailCheck.me")
	public String emailCheck(String checkEmail) {
		return memberService.emailCheck(checkEmail) > 0 ? "N" : "Y";
	}
	
	//회원가입하기 + 500p
	
	@RequestMapping("join.mem")
	public String joinMember(Member m) {
		
		
		//암호화
		String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd()); //암호화
		//System.out.println("암호문 : " + encPwd);
		m.setMemberPwd(encPwd);
		
		String message = "";
			if(memberService.joinMember(m) > 0) { //회원가입 성공
					memberService.joinPoint(m);
					
					message = "<script>alert('회원가입을 축하합니다 ! 500p가 지급되었습니다 !');</script>";
					
							return "redirect:/";
							
				}else {
					return "member/memberEnrollForm";
		
					}
	
	
	}
	
	
	
	
}
