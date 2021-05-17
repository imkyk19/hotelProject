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
	String suhyeonUrl = "jdbc:oracle:thin:@192.168.0.9:1521:xe";
	public DbConnect() {
		
		try {
			Class.forName(oracleDriver);
		} catch (ClassNotFoundException e) {
			System.out.println("오라클 드라이버 검색 실패:" + e.getMessage());
		}
	}
	

	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(susuUrl, "hotel", "a1234");
			

			
		} catch (SQLException e) {
			System.out.println("오라클 서버 연결 실패:" + e.getMessage());
		
		}

		return conn;
	}
	

	public Connection getCommonConnection() {
		
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(susuUrl, "hotel", "a1234");
			

			
		} catch (SQLException e) {
			System.out.println("susuUrl 연결실패:" + e.getMessage());
			
		}

		return conn;
	}
	

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
