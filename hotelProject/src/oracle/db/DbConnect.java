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
			Class.forName(oracleDriver);// ������Ʈ�ȿ� �ڷ������� ���ų� ��Ű���̸��� Ʋ�� ��� ������ ��//Ŭ������ ������ִ� �޼���//����̹� Ŭ���� ����
			// System.out.println("����Ŭ ����̹� �˻� ����");
		} catch (ClassNotFoundException e) {
			System.out.println("����Ŭ ����̹� �˻� ����:" + e.getMessage());
		}
	}
	
	// db server �����ϴ� �޼���
	public Connection getConnection() {// static�޼���
		// Connection�� java.sql�� �����ؾ���,������������ connection�� ����� ��
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(oracleUrl, "hotel", "a1234");
			// conn = �������� url,id,password

			// System.out.println("����Ŭ ���� ���� ����");
		} catch (SQLException e) {
			System.out.println("����Ŭ ���� ���� ����:" + e.getMessage());
			// ����Ŭ ���� ���� ����:ORA-01017: invalid username/password; logon denied->id��
			// password�� �߸����� �� ����
		}

		return conn;
	}
	
	// db ���� server �����ϴ� �޼���
	public Connection getCommonConnection() {// static�޼���
		// Connection�� java.sql�� �����ؾ���,������������ connection�� ����� ��
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(susuUrl, "angel", "a1234");
			// conn = �������� url,id,password

			// System.out.println("����Ŭ ���� ���� ����");
		} catch (SQLException e) {
			System.out.println("����pc����Ŭ ���� ���� ����:" + e.getMessage());
			// ����Ŭ ���� ���� ����:ORA-01017: invalid username/password; logon denied->id��
			// password�� �߸����� �� ����
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
