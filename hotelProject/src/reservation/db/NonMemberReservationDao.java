package reservation.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import oracle.db.DbConnect;

public class NonMemberReservationDao {
	DbConnect db = new DbConnect();
	
	 //예약했는지 체크
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
    
	//예약출력
	public List<NonMemberReservationDto> getReservationList(String num)
	{
		List<NonMemberReservationDto> list=new Vector<NonMemberReservationDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from reservation2 where guest_name=? order by num desc";
		conn=db.getCommonConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				
				NonMemberReservationDto dto=new NonMemberReservationDto();
				
				dto.setNum(rs.getInt("num"));
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
	//예약개수 구하기
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


}
