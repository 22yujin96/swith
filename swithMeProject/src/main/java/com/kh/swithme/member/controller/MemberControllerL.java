package com.kh.swithme.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.swithme.member.model.service.MemberService;
import com.kh.swithme.member.model.vo.Member;


 
/**
 * @author user1
 *
 */
/**
 * @author user1
 *
 */
/**
 * @author user1
 *
 */
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
	
	
	
	
	
	
	
	
	/**아이디 중복체크
	 * @param checkId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		return memberService.idCheck(checkId) > 0 ? "N" : "Y";

	}
	
	/**닉네임 중복체크
	 * @param checkNick
	 * @return
	 */
	@ResponseBody
	@RequestMapping("nickCheck.me")
	public String nickCheck(String checkNick) {
		return memberService.nickCheck(checkNick) > 0 ? "N" : "Y";
	}
	
	/**이메일 중복체크
	 * @param checkEmail
	 * @return
	 */
	@ResponseBody
	@RequestMapping("emailCheck.me")
	public String emailCheck(String checkEmail) {
		return memberService.emailCheck(checkEmail) > 0 ? "N" : "Y";
	}
	
	
	/**회원가입하기 + 500p
	 * @param m
	 * @return
	 */
	
	@RequestMapping("join.mem")
	public ModelAndView joinMember(Member m, ModelAndView model, HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd()); //암호화
		//System.out.println("암호문 : " + encPwd);
		m.setMemberPwd(encPwd);
		
		
			if(memberService.joinMember(m) > 0) { //회원가입 성공
				memberService.joinPoint(m);
					session.setAttribute("alertMsg", "환영합니다 ! 500p가 지급되었습니다 !");
					model.setViewName("member/loginForm");
				}else {
					//message = "<script>alert('회원가입을 다시 시도해주세요.');location.href='memberEnrollForm.me';</script>";
					session.setAttribute("alertMsg", "회원가입을 다시 시도해주세요.");
					model.setViewName("member/memberEnrollForm");
				}
			return model;
		}
	
	
	/**로그인하기
	 * @param m
	 * @return
	 */
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, ModelAndView model, HttpSession session) {
		
		Member loginMember = memberService.loginMember(m); // DB에 저장되어있는 회원정보 가져오기
		
		//복화
		if(loginMember != null && bcryptPasswordEncoder.matches(m.getMemberPwd(), loginMember.getMemberPwd())) {
				
				if(memberService.loginPointChk(m) == 0) {
					memberService.loginPointInsert(m);
					session.setAttribute("alertMsg", "환영합니다 ! 30p가 지급되었습니다."); //알럿 최초 로그인 한번만 뜸. 
				}
				
				session.setAttribute("loginMember", loginMember);
				model.setViewName("redirect:/");
		}else {
				session.setAttribute("alertMsg", "로그인에 실패하였습니다.");									
				model.setViewName("member/loginForm");
		}
			return model;
	}
	
	
	/**로그아웃
	 * @param m
	 * @return
	 */
	@RequestMapping("logout.me")
	public String logoutMember(Member m, HttpSession session) {
		session.invalidate();
		return "redirect:/";
		
	}
	
 }
