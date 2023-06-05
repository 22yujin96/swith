package com.kh.swithme.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.swithme.common.model.vo.PageInfo;
import com.kh.swithme.member.model.vo.Alarm;
import com.kh.swithme.member.model.vo.Member;
import com.kh.swithme.member.model.vo.Point;
import com.kh.swithme.member.model.vo.QNA;

@Repository
public class MemberDao {

	
	//지현
	
	//아이디 중복체크
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
	//닉네임 중복체크
	public int nickCheck(SqlSessionTemplate sqlSession, String checkNick) {
		return sqlSession.selectOne("memberMapper.nickCheck", checkNick);
	}
	// 이메일 중복체크
	public int emailCheck(SqlSessionTemplate sqlSession, String checkEmail) {
		return sqlSession.selectOne("memberMapper.emailCheck",checkEmail);
	}
	// 회원가입
	public int joinMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.joinMember", m);
	}
	//회원가입 시 포인트
	public int joinPoint(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.joinPoint", m);
	}
	//로그인
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember",m);
	}
	
	
	//로그인 시 출석 포인트 체크
	public int loginPointChk(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginPointChk",m);
	}
	
	//로그인 시 포인트
	public int loginPointInsert(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.loginPointInsert", m);
	}
	
	
	//유진 -----------------------------------------------------------------------------------
	
	// 임시로그인
//	public Member selectMemberY(SqlSessionTemplate sqlSession) {
//		return sqlSession.selectOne("memberMapper.selectMemberY");
//	}
	
	// 총 포인트 가져오기
	public int selectTotalPoint(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.selectTotalPoint", memberId);
	}
	
	// 마이페이지 메인 - 포인트 내역(최신 3개)
	public ArrayList<Point> selectPointList3(SqlSessionTemplate sqlSession, String memberId){
		return (ArrayList)sqlSession.selectList("memberMapper.selectPointList3", memberId);
	}
	
	// 마이페이지 메인 - 알림 내역(최신 5개)
	public ArrayList<Alarm> selectAlarmList5(SqlSessionTemplate sqlSession, String memberId){
		return (ArrayList)sqlSession.selectList("memberMapper.selectAlarmList5", memberId);
	}
	
	// 문의글 수 가져오기
	public int selecQnaListCount(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.selectQnaListCount", memberId);
	}
	
	// 문의글 목록 가져오기
	public ArrayList<QNA> selectQnaList(SqlSessionTemplate sqlSession, PageInfo pi, String memberId){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectQnaList", memberId, rowBounds);
	}
	
	
	
	

}
