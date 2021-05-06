package guest.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.db.DbConnect;

public class GuestDao {
DbConnect db=new DbConnect();
	//���̵� �ִ��� üũ
		public boolean isIdCheck(String id) {
			boolean t=false;     
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
		
		//���̵� �´� ��� ���
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
		
		//ȸ������ insert
				public void insertGuest(GuestDto dto) {
					Connection conn=null;
					PreparedStatement pstmt=null;
					
					String sql="insert into guest values (seq_q.nextval,?,TO_DATE(?,'yyyy-MM-dd'),?,?,?,?,?,0)";
					conn=db.getCommonConnection();
					try {
						pstmt=conn.prepareStatement(sql);
						pstmt.setString(1, dto.getName());
						pstmt.setString(2, dto.getBirth());
						pstmt.setString(3, dto.getEmail());
						pstmt.setString(4, dto.getHp());
						pstmt.setString(5, dto.getAddr());
						pstmt.setString(6, dto.getId());
						pstmt.setString(7, dto.getPass());
						
						pstmt.execute();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						db.dbColse(pstmt, conn);
					}
					
				}
		
}
