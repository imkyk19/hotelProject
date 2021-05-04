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
		//checkout_date ������ üũ�� ��¥, checkin_date ������ üũ�ƿ� ��¥�� �־��
		String sql = "SELECT * FROM room r WHERE r.room_num NOT IN (SELECT b.room_num FROM reservation b WHERE NOT (b.CHECKOUT_DATE <= ? OR b.CHECKIN_DATE >= ?))ORDER BY r.ROOM_NUM";		
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
