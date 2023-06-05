package com.kh.swithme.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.swithme.common.model.vo.PageInfo;
import com.kh.swithme.common.template.Pagination;
import com.kh.swithme.member.model.service.MemberServiceImpl;
import com.kh.swithme.member.model.vo.Member;
import com.kh.swithme.member.model.vo.QNA;

@Controller
public class MemberControllerY {

	@Autowired
	private MemberServiceImpl memberService;
	
	// 마이페이지 메인으로 이동
//		@RequestMapping("mypage.me")
//		public String myPageMain() {
//			return "member/myPageMain";
//		}
		
	// 임시로그인 (user03 고정) 
	@RequestMapping("mypage.me")
	public String myPageMain(Model model) {
		Member loginUser = memberService.selectMemberY();
		System.out.println(loginUser);
		model.addAttribute("loginUser", loginUser);
		return "member/myPageMain";
	}
	
	
	@RequestMapping("item.me")
	public String myItemListView() {
		return "member/myItem";
	}
	
	@RequestMapping("point.me")
	public String myPointListView() {
		return "member/myPoint";
	}
	
	@RequestMapping("chat.me")
	public String chatting() {
		return "member/chatting";
	}
	
	@RequestMapping("history.me")
	public String myHistoryListView() {
		return "member/myHistory";
	}
	
	@RequestMapping("qna.me")
	public String myQnaListView(@RequestParam(value="cPage", defaultValue="1") int currentPage, 
								HttpSession session,
								Model model) {
		
//		Member loginUser = new Member();
//		loginUser.setMemberId(id);

		
		//String encPwd = ((Member)session.getAttribute("loginUser")).getUserPwd();
		String memberId = "user03";
		
		PageInfo pi = Pagination.getPageInfo(memberService.selecQnaListCount(memberId), currentPage, 5, 5);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", memberService.selectQnaList(pi, memberId));
		
		return "member/memberQNA";
	}
	
	@RequestMapping("qnaEnroll.me")
	public String qnaEnrollForm() {
		return "member/qnaEnrollForm";
	}
	
	@RequestMapping(value="insertQna.me", produces="text/html; charset=UTF-8")
	public String insertQna(QNA q) {
		
		System.out.println(q);
		
		
		
		return "member/qnaDetailView";
	}
	
	//---------------------------------------------
	
	// 총 포인트 가져오기
	@ResponseBody
	@RequestMapping("miniPoint")
	public int selectTotalPoint(String memberId) {
		return memberService.selectTotalPoint(memberId);
	}
	
	// 마이페이지 메인 - 포인트 내역(최신 3개)
	@ResponseBody
	@RequestMapping(value="miniPointList", produces="application/json; charset=UTF-8")
	public String selectPointList3(String memberId) {
		return new Gson().toJson(memberService.selectPointList3(memberId));
	}
	
	// 마이페이지 메인 - 알림 내역(최신 5개)
	@ResponseBody
	@RequestMapping(value="miniAlarmList", produces="application/json; charset=UTF-8")
	public String selectAlarmList5(String memberId) {
		return new Gson().toJson(memberService.selectAlarmList5(memberId));
	}
	
	
}
