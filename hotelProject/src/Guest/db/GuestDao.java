package Guest.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.db.DbConnect;

public class GuestDao {
DbConnect db=new DbConnect();
	//아이디가 존재하면 true리턴
		public boolean isIdCheck(String id) {
			boolean t=false;//있을 경우에만 true로 변경
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from guest where id=?";
			conn=db.getCommonConnection();
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					t=true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbColse(rs, pstmt, conn);
			}
			return t;
		}
		
		//비번 얻는 메서드
		public String getPass(String id) {
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String pass="없음";
			
			String sql="select pass from guest where id=?";
			conn=db.getCommonConnection();
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					pass=rs.getString(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbColse(rs, pstmt, conn);
			}
			return pass;
		}
		
}
