package reservation.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import guest.db.GuestDto;
import oracle.db.DbConnect;

public class ReservationDao {
	DbConnect db = new DbConnect();
	
	public void insertReservation(ReservationDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into reservation values (seq_q.nextval,?,?,?,?,?,?,?)";
		
		conn = db.getCommonConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setInt(1, dto.getg_num());
			pstmt.setInt(2, dto.getGuestQty());
			pstmt.setInt(3, dto.getBookingQty());
			pstmt.setInt(4, dto.getTotalPrice());
			pstmt.setInt(5, dto.getRoomNum());
			pstmt.setString(6, dto.getCheckInDate());
			pstmt.setString(7, dto.getCheckOutDate());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbColse(pstmt, conn);
		}
		
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
	
	public ReservationDto getIndividualReservation(int g_num) {
		ReservationDto dto = new ReservationDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from reservation where g_num = ?";
		
		conn = db.getCommonConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, g_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setg_num(rs.getInt("g_num"));
				dto.setGuestQty(rs.getInt("guest_qty"));
				dto.setBookingQty(rs.getInt("booking_qty"));
				dto.setTotalPrice(rs.getInt("total_price"));
				dto.setRoomNum(rs.getInt("room_num"));
				dto.setCheckInDate(rs.getString("checkin_date"));
				dto.setCheckOutDate(rs.getString("checkout_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbColse(rs, pstmt, conn);
		}
		
		return dto;
	}
}
