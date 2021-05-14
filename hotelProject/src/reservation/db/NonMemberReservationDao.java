package reservation.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import guest.db.GuestDto;
import oracle.db.DbConnect;
import review.db.reveiwDto;

public class NonMemberReservationDao {
	DbConnect db = new DbConnect();
	
	 public boolean isReserveCheck(String guest_name) {
         boolean t=false;     
         Connection conn=null;
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         
         String sql="select * from reservation2 where guest_name=?";
         conn=db.getCommonConnection();
         try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, guest_name);
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
	 
	 
	   public NonMemberReservationDto getData(String guest_name)

	      {
		   NonMemberReservationDto dto=new NonMemberReservationDto();
	         Connection conn=null;

	         PreparedStatement pstmt=null;

	         ResultSet rs=null;

	         String sql="select * from reservation2 where guest_name=?";

	         conn=db.getCommonConnection();

	   

	         try {

	            pstmt=conn.prepareStatement(sql);
	            pstmt.setString(1, guest_name);
	            rs=pstmt.executeQuery();
	            if(rs.next())

	            {
	            	dto.setNum(rs.getString("num"));
					dto.setGuest_name(rs.getString("guest_name"));
					dto.setHp(rs.getString("hp"));
					dto.setAddr(rs.getString("addr"));
					dto.setGuest_qty(rs.getInt("guest_qty"));
					dto.setBooking_qty(rs.getInt("booking_qty"));
					dto.setTotal_price(rs.getInt("total_price"));
					dto.setRoom_num(rs.getInt("room_num"));
					dto.setCheckin_date(rs.getString("checkin_date"));
					dto.setCheckout_date(rs.getString("checkout_date"));
	            }

	         } catch (SQLException e) {

	            // TODO Auto-generated catch block

	            e.printStackTrace();

	         }finally {

	            db.dbColse(rs, pstmt, conn);

	         }return dto;
	      }
	      
	
	
	 //�����ߴ��� üũ
    public boolean isReserveCheck(String guest_name,String hp) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getCommonConnection();  
		String sql="select count(*) from reservation2 where guest_name=? and hp=?";
		
		int r=0;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,guest_name);
			pstmt.setString(2,hp);
			rs=pstmt.executeQuery();
			if(rs.next())
				r=rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbColse(rs,pstmt,conn);
		}
		return r==1?true:false;
	}
    
	//�������
	public List<NonMemberReservationDto> getReservationList(String num)
	{
		List<NonMemberReservationDto> list=new Vector<NonMemberReservationDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from reservation2 where num=? order by num desc";
		conn=db.getCommonConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				
				NonMemberReservationDto dto=new NonMemberReservationDto();
				
				dto.setNum(rs.getString("num"));
				dto.setGuest_name(rs.getString("guest_name"));
				dto.setHp(rs.getString("hp"));
				dto.setAddr(rs.getString("addr"));
				dto.setGuest_qty(rs.getInt("guest_qty"));
				dto.setBooking_qty(rs.getInt("booking_qty"));
				dto.setTotal_price(rs.getInt("total_price"));
				dto.setRoom_num(rs.getInt("room_num"));
				dto.setCheckin_date(rs.getString("checkin_date"));
				dto.setCheckout_date(rs.getString("checkout_date"));
				
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
	//���ళ�� ���ϱ�
	public int getTotalCount(String num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getCommonConnection();
		String sql="select count(*) from reservation2 where num=?";
		int n=0;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			if(rs.next())
				n=rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbColse(rs, pstmt, conn);
		}
		return n;
	}

	
	public void insertReservation2(NonMemberReservationDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into reservation2 values (seq_q.nextval,?,?,?,?,?,?,?,?,?)";
		
		conn = db.getCommonConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getGuest_name());
			pstmt.setString(2, dto.getHp());
			pstmt.setString(3, dto.getAddr());
			pstmt.setInt(4, dto.getGuest_qty());
			pstmt.setInt(5, dto.getBooking_qty());
			pstmt.setInt(6, dto.getTotal_price());
			pstmt.setInt(7, dto.getRoom_num());
			pstmt.setString(8, dto.getCheckin_date());
			pstmt.setString(9, dto.getCheckout_date());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbColse(pstmt, conn);
		}
		
	}
	//�˻� ���� ����Ʈ
			public List<NonMemberReservationDto> getSearchList(String num) {
				
				List<NonMemberReservationDto> list=new Vector<NonMemberReservationDto>();
				
				Connection conn=null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				
				conn=db.getCommonConnection();
				String sql="select * from reservation2 where num=? order by num desc";
				
				try {
					pstmt=conn.prepareStatement(sql);
					//���ε�
					pstmt.setString(1, num);
					//����
					rs=pstmt.executeQuery();
					//������ �ֱ�
					while(rs.next()) {
						NonMemberReservationDto dto=new NonMemberReservationDto();
						
						dto.setNum(rs.getString("num"));
						dto.setGuest_name(rs.getString("guest_name"));
						dto.setHp(rs.getString("hp"));
						dto.setAddr(rs.getString("addr"));
						dto.setGuest_qty(rs.getInt("guest_qty"));
						dto.setBooking_qty(rs.getInt("booking_qty"));
						dto.setTotal_price(rs.getInt("total_price"));
						dto.setRoom_num(rs.getInt("room_num"));
						dto.setCheckin_date(rs.getString("checkin_date"));
						dto.setCheckout_date(rs.getString("checkout_date"));
						//list�� �߰�
						list.add(dto);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					db.dbColse(rs, pstmt, conn);
				}
				return list;
			}
			
			
			//�������
			public void deleteReservation(String num) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				conn = db.getCommonConnection();
				String sql = "delete from reservation2 where num=?";
				try {
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, num);
					pstmt.execute();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					db.dbColse(pstmt, conn);
				}
			}
			
	}

	


