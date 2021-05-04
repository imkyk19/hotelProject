package oracle.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnect {
	String oracleDriver = "oracle.jdbc.driver.OracleDriver";
	String oracleUrl = "jdbc:oracle:thin:@localhost:1521:xe";
	String susuUrl = "jdbc:oracle:thin:@192.168.0.39:1521:xe";
	
	public DbConnect() {
		
		try {
			Class.forName(oracleDriver);// 프로젝트안에 자료파일이 없거나 패키지이름이 틀린 경우 오류가 남//클래스를 만들어주는 메서드//드라이버 클래스 삽입
			// System.out.println("오라클 드라이버 검색 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("오라클 드라이버 검색 실패:" + e.getMessage());
		}
	}
	
	// db server 연결하는 메서드
	public Connection getConnection() {// static메서드
		// Connection은 java.sql것 선택해야함,성공했을때만 connection이 생기는 것
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(oracleUrl, "hotel", "a1234");
			// conn = 데이터의 url,id,password

			// System.out.println("오라클 서버 연결 성공");
		} catch (SQLException e) {
			System.out.println("오라클 서버 연결 실패:" + e.getMessage());
			// 오라클 서버 연결 실패:ORA-01017: invalid username/password; logon denied->id나
			// password가 잘못됐을 때 오류
		}

		return conn;
	}
	
	// db 공동 server 연결하는 메서드
	public Connection getCommonConnection() {// static메서드
		// Connection은 java.sql것 선택해야함,성공했을때만 connection이 생기는 것
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(susuUrl, "angel", "a1234");
			// conn = 데이터의 url,id,password

			// System.out.println("오라클 서버 연결 성공");
		} catch (SQLException e) {
			System.out.println("강사pc오라클 서버 연결 실패:" + e.getMessage());
			// 오라클 서버 연결 실패:ORA-01017: invalid username/password; logon denied->id나
			// password가 잘못됐을 때 오류
		}

		return conn;
	}
	
	//db close
	public void dbColse(Statement stmt,Connection conn) {
		try {
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}catch(SQLException e) {}
	}
	public void dbColse(ResultSet rs,Statement stmt,Connection conn) {
		try {
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}catch(SQLException e) {}
	}
	
	public void dbColse(PreparedStatement pstmt,Connection conn) {
		try {
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}catch(SQLException e) {}
	}
	public void dbColse(ResultSet rs,PreparedStatement pstmt,Connection conn) {
		try {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}catch(SQLException e) {}
	}
	
	public void dbColse(CallableStatement cstmt,Connection conn) {
		try {
			if(cstmt!=null)cstmt.close();
			if(conn!=null)conn.close();
		}catch(SQLException e) {}
	}
	public void dbColse(ResultSet rs,CallableStatement cstmt,Connection conn) {
		try {
			if(rs!=null)rs.close();
			if(cstmt!=null)cstmt.close();
			if(conn!=null)conn.close();
		}catch(SQLException e) {}
	}
	
	

}
