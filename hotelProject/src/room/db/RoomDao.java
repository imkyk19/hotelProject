package room.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import oracle.db.DbConnect;

public class RoomDao {
	DbConnect db = new DbConnect();
	
	//테이블 Room 에 있는 모든 방 리스트를 출력. 예약됬든 안 됬든 상관없이 다 출력
	public List<RoomDto> getAllRoom(){
		List<RoomDto> list = new Vector<RoomDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from room order by room_num";
		
		conn = db.getCommonConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RoomDto dto = new RoomDto();
				dto.setNum(rs.getInt("num"));
				dto.setRoomNum(rs.getInt("room_num"));
				dto.setStatus(rs.getString("status"));
				dto.setCapacity(rs.getInt("capacity"));
				dto.setPrice(rs.getInt("price"));
				dto.setPhoto(rs.getString("photo"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbColse(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//테이블 Room 이랑 Reservation을 같이 비교해서 비어있는 (예약가능한)방, 즉 Reservation에 담겨져있지 않은 방 리스트를 출력. 
	public List<RoomDto> getVacantRoom(){
		List<RoomDto> list = new Vector<RoomDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from room a, reservation b where status = 'vacant' and b.checkout_date >= ? and b.checkin_date <= ? and a.room_num != b.room_num";
		
		conn = db.getCommonConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RoomDto dto = new RoomDto();
				dto.setNum(rs.getInt("num"));
				dto.setRoomNum(rs.getInt("room_num"));
				dto.setStatus(rs.getString("status"));
				dto.setCapacity(rs.getInt("capacity"));
				dto.setPrice(rs.getInt("price"));
				dto.setPhoto(rs.getString("photo"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbColse(rs, pstmt, conn);
		}
		
		return list;
	}
	
	
}
