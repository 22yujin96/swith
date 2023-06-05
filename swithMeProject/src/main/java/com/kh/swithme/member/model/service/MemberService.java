package com.kh.swithme.member.model.service;

import java.util.ArrayList;

import com.kh.swithme.common.model.vo.PageInfo;
import com.kh.swithme.member.model.vo.Alarm;
import com.kh.swithme.member.model.vo.Member;
import com.kh.swithme.member.model.vo.Point;
import com.kh.swithme.member.model.vo.QNA;

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
	

	//로그인
	Member loginMember(Member m);



	//로그인 포인트 insert
	int loginPoint(Member m);
	
	
	

	//유진 -----------------------------------------------------------------------------------

	// 토탈포인트(사용가능한 포인트)
	int selectTotalPoint(String memberId);
	
	// 마이페이지 메인 - 포인트 내역(최신 3개)
	ArrayList<Point> selectPointList3(String memberId);
	
	// 포인트 전체 내역(select)
	ArrayList<Point> selectPointList(String memberId);
	
	// 마이페이지 메인 - 포인트 내역(최신 3개)
	ArrayList<Alarm> selectAlarmList5(String memberId);
	
	// 알림 전체 내역(selecT)
	ArrayList<Alarm> selectAlarmList(String memberId);
	
	// 문의글 리스트 조회 + 페이징처리
	// 사용자가 작성한 게시글 수 가져오기
	int selecQnaListCount(String memberId);
	// 사용자가 작성한 문의글 리스트 조회
	ArrayList<QNA> selectQnaList(PageInfo pi, String memberId);


	
	
}
