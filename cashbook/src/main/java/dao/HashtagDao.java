package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class HashtagDao {
	
	// 해시태그별 랭킹리스트 출력하기 위한 메서드
	public List<Map<String, Object>> selectTagRankList(String sessionMemberId) {
		List<Map<String, Object>> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://13.124.231.44/cashbook","root","mariadb1234");
			String sql = "SELECT kind, t.tag, t.cnt, RANK() over(ORDER BY t.cnt DESC) rank"
					+ "		FROM"
					+ "		(SELECT c.kind kind, tag, COUNT(*) cnt, member_id"
					+ " 	FROM hashtag t INNER JOIN cashbook c"
					+ " 	ON t.cashbook_no = c.cashbook_no"
					+ " 	GROUP BY t.tag) t"
					+ "		WHERE member_id=?";
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, sessionMemberId);
			
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("kind", rs.getString("kind"));
				map.put("tag", rs.getString("tag"));
				map.put("cnt", rs.getString("t.cnt"));
				map.put("rank", rs.getString("rank"));
				list.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	//수입, 지출, 날짜 검색 시 리스트 출력하기 위한 메서드
	public List<Map<String, Object>> selectKindDateByList(String kind, String beginDate, String lastDate, String sessionMemberId) {
		List<Map<String, Object>> list = new ArrayList<>();
		
		// 드라이버 자원 준비
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT RANK() over(ORDER BY t.cnt DESC) rank, t.kind, t.tag, t.cnt, t.cashDate"
				+ "	FROM"
				+ "		(SELECT c.kind kind, tag, COUNT(*) cnt, member_id, c.cash_date cashDate"
				+ "		FROM hashtag h"
				+ "		INNER JOIN cashbook c"
				+ "			ON h.cashbook_no = c.cashbook_no";	
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://13.124.231.44/cashbook","root","mariadb1234");
			if("".equals(kind)) {
				 
				sql += "	WHERE c.cash_date BETWEEN ? AND ?"
					+"		GROUP BY h.tag) t"
					+"	WHERE t.member_id= ?";
				 
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, beginDate);
				stmt.setString(2, lastDate);
				stmt.setString(3, sessionMemberId);
				
			} else { // 수입 or 지출 검색했을때
				
				sql += "		WHERE c.kind = ? AND c.cash_date BETWEEN ? AND ?"
					+ "		GROUP BY h.tag) t"
					+ "	WHERE t.member_id= ?";

				stmt = conn.prepareStatement(sql);
				stmt.setString(1, kind);
				stmt.setString(2, beginDate);
				stmt.setString(3, lastDate);
				stmt.setString(4, sessionMemberId);
			}
 			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("kind", rs.getString("kind"));
				map.put("tag", rs.getString("tag"));
				map.put("cnt", rs.getString("cnt"));
				map.put("rank", rs.getString("rank"));
				list.add(map);
			}
		} catch (Exception e) { // 예외 처리
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	// 날짜별 검색 메서드 구현
	public List<Map<String, Object>> selectDateByList(String beginDate, String lastDate, String sessionMemberId) {
		List<Map<String, Object>> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://13.124.231.44/cashbook","root","mariadb1234");
			String sql = "SELECT"
					+ "	 		c.cash_date"
					+ "			,c.cashbook_no"
					+ "			,c.kind"
					+ "			,h.tag"
					+ "			,c.cash"
					+ "	FROM hashtag h"
					+ "	INNER JOIN cashbook c"
					+ "	   ON c.cashbook_no = h.cashbook_no"
					+ "	WHERE c.member_id=? AND c.cash_date BETWEEN ? AND ?"
					+ "	ORDER BY c.cash_date DESC";
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, sessionMemberId);
			stmt.setString(2, beginDate);
			stmt.setString(3, lastDate);
			
			rs = stmt.executeQuery();
			
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("cashDate", rs.getString("cash_date"));
				map.put("cashbookNo", rs.getString("cashbook_no"));
				map.put("kind", rs.getString("kind"));
				map.put("tag", rs.getString("tag"));
				map.put("cash", rs.getString("cash"));
				list.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	// 태그 상세보기
	public List<Map<String, Object>> selectTagByList(String tag) {
		List<Map<String, Object>> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://13.124.231.44/cashbook","root","mariadb1234");
			String sql = "SELECT"
					+ " 	h.tag"
					+ " 	,c.cash_date"
					+ " 	,c.kind"
					+ " 	,c.cash"
					+ " 	,c.memo"
					+ " FROM hashtag h"
					+ " INNER JOIN cashbook c"
					+ " 	ON h.cashbook_no = c.cashbook_no"
					+ " WHERE h.tag = ?";
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, tag);
			
			rs = stmt.executeQuery();
			
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("tag", rs.getString("tag"));
				map.put("cashDate", rs.getString("cash_date"));
				map.put("kind", rs.getString("kind"));
				map.put("cash", rs.getString("cash"));
				map.put("memo", rs.getString("memo"));
				list.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
}