package com.kh.swithme.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.swithme.common.model.vo.PageInfo;
import com.kh.swithme.member.model.dao.MemberDao;
import com.kh.swithme.member.model.vo.Alarm;
import com.kh.swithme.member.model.vo.Member;
import com.kh.swithme.member.model.vo.Point;
import com.kh.swithme.member.model.vo.QNA;

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
/**
 * @author user1
 *
 */
@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/**
	 *아이디 중복체크
	 */
	@Override
	public int idCheck(String checkId) {
		return memberDao.idCheck(sqlSession, checkId);
	}
	/**
	 *닉네임 중복체크
	 */
	@Override
	public int nickCheck(String checkNick) {
		return memberDao.nickCheck(sqlSession, checkNick);
	}
	/**
	 *이메일 중복체크
	 */
	@Override
	public int emailCheck(String checkEmail) {
		return memberDao.emailCheck(sqlSession,checkEmail);
	}
	/**
	 *회원가입
	 */
	@Override
	public int joinMember(Member m) {
		return memberDao.joinMember(sqlSession, m);
	}
	
	/**
	 *회원가입시 포인트 insert
	 */
	@Override
	public int joinPoint(Member m) {
		return memberDao.joinPoint(sqlSession, m);
	}
	
	/**
	 *로그인 select
	 */
	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}
	
	
	/**
	 *로그인 시 pointSelect	
	 */
	@Override
	public int loginPointChk(Member m) {
		return memberDao.loginPointChk(sqlSession,m);
	}
	
	/**
	 *로그인 시 포인트 지급
	 */
	@Override
	public int loginPointInsert(Member m) {
		return memberDao.loginPointInsert(sqlSession, m);
	}
	
	/**
	 *아이디 찾기
	 */
	@Override
	public Member memberSerchId(Member m) {
		return memberDao.memberSerchId(sqlSession, m);
	}
	
	
	
	
	//유진 -----------------------------------------------------------------------------------
	
	// 임시 로그인
	public Member selectMemberY() {
		System.out.println("ㅇ나런이ㅏㅓ리ㅏㄴ어ㅣㄹ");
		return memberDao.selectMemberY(sqlSession);
	}
	
	// 총 포인트 가져오기
	@Override
	public int selectTotalPoint(String memberId) {
		return memberDao.selectTotalPoint(sqlSession, memberId);
	}

	// 마이페이지 메인 - 포인트 내역(최신 3개)
	@Override
	public ArrayList<Point> selectPointList3(String memberId) {
		return memberDao.selectPointList3(sqlSession, memberId);
	}

	@Override
	public ArrayList<Point> selectPointList(String memberId) {
		return null;
	}

	// 마이페이지 메인 - 알림 내역(최신 5개)
	@Override
	public ArrayList<Alarm> selectAlarmList5(String memberId) {
		return memberDao.selectAlarmList5(sqlSession, memberId);
	}
	
	
	@Override
	public ArrayList<Alarm> selectAlarmList(String memberId) {
		return null;
	}

	// 문의글 수 가져오기
	@Override
	public int selecQnaListCount(String memberId) {
		return memberDao.selecQnaListCount(sqlSession, memberId);
	}

	// 문의글 목록 가져오기
	@Override
	public ArrayList<QNA> selectQnaList(PageInfo pi, String memberId) {
		return memberDao.selectQnaList(sqlSession, pi, memberId);
	}
	

}
