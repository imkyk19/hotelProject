package guest.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
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
		

		//명단출력
				public List<GuestDto> getGuestList()
				{
					List<GuestDto> list=new Vector<GuestDto>();
					Connection conn=null;
					PreparedStatement pstmt=null;
					ResultSet rs=null;
					String sql="select * from guest order by g_num";
					conn=db.getCommonConnection();
					
					try {
						pstmt=conn.prepareStatement(sql);
						rs=pstmt.executeQuery();
						while(rs.next())
						{
							GuestDto dto=new GuestDto();
							dto.setG_num(rs.getInt("g_num"));
							dto.setName(rs.getString("name"));
							dto.setBirth(rs.getTimestamp("birth"));
							dto.setEmail(rs.getString("email"));
							dto.setHp(rs.getString("hp"));
							dto.setAddr(rs.getString("addr"));
							dto.setId(rs.getString("id"));
							dto.setPass(rs.getString("pass"));
							
							
							list.add(dto);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						db.dbColse(rs,pstmt, conn);
					}
					
					return list;
				}
		
			
		public GuestDto getData(String id)

		{
			GuestDto dto=new GuestDto();
			Connection conn=null;

			PreparedStatement pstmt=null;

			ResultSet rs=null;

			String sql="select * from guest where id=?";

			conn=db.getCommonConnection();

	

			try {

				pstmt=conn.prepareStatement(sql);

				pstmt.setString(1, id);

				rs=pstmt.executeQuery();

				if(rs.next())

				{
					
					dto.setG_num(rs.getInt("g_num"));

					dto.setName(rs.getString("name"));

					dto.setBirth(rs.getTimestamp("birth"));

					dto.setEmail(rs.getString("email1")+"@"+rs.getString("email2"));

					dto.setHp(rs.getString("hp1")+"-"+rs.getString("hp2")+"-"+rs.getString("hp3"));

					dto.setAddr(rs.getString("addr1")+rs.getString("addr2"));

					dto.setId(rs.getString("id"));

					dto.setPass(rs.getString("pass"));

				}

			} catch (SQLException e) {

				// TODO Auto-generated catch block

				e.printStackTrace();

			}finally {

				db.dbColse(rs, pstmt, conn);

			}return dto;
		}
		
 

		public void updateGuest(GuestDto dto)

		{
				Connection conn=null;

				PreparedStatement pstmt=null;

				String sql="update member set name=?,birth=?,email=?,hp=?,photo=?,addr=?,"

						+"id=?,pass=?, where g_num=?";
				
				conn=db.getCommonConnection();

				try {

					pstmt=conn.prepareStatement(sql);
					//바인딩
					pstmt.setString(1, dto.getName());
					
					pstmt.setTimestamp(2, dto.getBirth());

					pstmt.setString(3, dto.getEmail());

					pstmt.setString(4, dto.getHp());

					pstmt.setString(5, dto.getAddr());

					pstmt.setString(6, dto.getId());

					pstmt.setString(7, dto.getPass());

					pstmt.setInt(8, dto.getG_num());

					//실행

					pstmt.execute();

				} catch (SQLException e) {

					// TODO Auto-generated catch block

					e.printStackTrace();

				}finally {

					db.dbColse(pstmt, conn);

				}

			}
		
		public void deleteGuest(String g_num) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = "delete from guest where g_num=?";
			conn = db.getConnection();
			try {
				pstmt = conn.prepareStatement(sql);
				//바인딩
				pstmt.setString(1, g_num);
				//실행
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbColse(pstmt, conn);
			}
		}
		
		
		

		

			
			
		}
=======
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
>>>>>>> branch 'master' of https://github.com/imkyk19/hotelProject.git
