package com.kh.swithme.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.swithme.member.model.service.MemberServiceImpl;

@Controller
public class MemberControllerY {

	private MemberServiceImpl memberService;
	
	@RequestMapping("mypage.me")
	public String myPage() {
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
	
	
}
