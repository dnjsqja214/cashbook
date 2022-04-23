package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.*;

public class MemberDao {
	// 회원가입
	public void insertMember(Member member) {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/cashbook","root","java1234");
			conn.setAutoCommit(false); // 자동커밋을 해제
			
			String sql = "INSERT INTO member (member_id,member_pw,member_gender,member_name,create_date) values (?,?,?,?,now())";
			
			stmt = conn.prepareStatement(sql); 
			stmt.setString(1, member.getMemberId());
			stmt.setString(2, member.getMemberPw());
			stmt.setString(3, member.getMemberGender());
			stmt.setString(4, member.getMemberName());
			stmt.executeUpdate(); // insert
			int row = stmt.executeUpdate(); 
			if(row == 1) {
				System.out.println("입력성공");
			} else {
				System.out.println("입력실패");
			}
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	// 회원수정
	// 회원탈퇴
	
	// 회원정보
	public Member selectMemberOne(String memberId) {
		Member member = new Member();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs= null;
		// 쿼리
		String sql = "SELECT member_id memberId, member_pw memberPw, member_gender memberGender, member_name memberName, create_date createDate FROM member WHERE member_id=?";
		// db값 넣어주기
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/cashbook","root","java1234");
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, memberId);
			rs = stmt.executeQuery();
			if(rs.next()) {
				member.setMemberId(rs.getString("memberId"));
				member.setMemberPw(rs.getString("memberPw"));
				member.setMemberGender(rs.getString("memberGender"));
				member.setMemberName(rs.getString("memberName"));
				member.setCreateDate(rs.getString("createDate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return member;
	}
	
	// 로그인
	public String selectMemberByIdPW(Member member) {
		String memberId = null;
		String memberPw = null;
		Cashbook c = new Cashbook();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs= null;
		// 쿼리
		String sql = "SELECT member_id memberId FROM member WHERE member_id=? and member_pw=password(?)";
		// db값 넣어주기
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/cashbook","root","java1234");
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, member.getMemberId());
			stmt.setString(2, member.getMemberPw());
			rs = stmt.executeQuery();
			if(rs.next()) {
				memberId = rs.getString("memberId");
				memberPw = rs.getString("memberPw");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
		
		return memberId;
	}
}
