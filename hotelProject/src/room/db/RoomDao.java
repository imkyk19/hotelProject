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
	
	//���̺� Room �� �ִ� ��� �� ����Ʈ�� ���. ������� �� ��� ������� �� ���
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
	
	//���̺� Room �̶� Reservation�� ���� ���ؼ� ����ִ� (���డ����)��, �� Reservation�� ��������� ���� �� ����Ʈ�� ���. 
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
