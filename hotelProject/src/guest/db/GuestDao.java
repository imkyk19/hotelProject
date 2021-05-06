package guest.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.db.DbConnect;

public class GuestDao {
DbConnect db=new DbConnect();
	//���̵� �����ϸ� true����
		public boolean isIdCheck(String id) {
			boolean t=false;//���� ��쿡�� true�� ����         
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
		
		//��� ��� �޼���
		public String getPass(String id) {
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String pass="����";
			
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
