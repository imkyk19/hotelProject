package likes.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import oracle.db.DbConnect;

public class LIkesDao {
	DbConnect db= new DbConnect();

	//��õ ���� id ������ �߰�
	public int like(String userid, String subject, String h_num) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;

		//sql�� ����
		String sql="insert into likes select ?,?,? from dual where not EXISTS(select * from likes where userid=? and subject=? and h_num=?)";

		conn=db.getCommonConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, userid);
			pstmt.setString(2, subject);
			pstmt.setString(3, h_num);
			pstmt.setString(4, userid);
			pstmt.setString(5, subject);
			pstmt.setString(6, h_num);
			//����
			int ret=pstmt.executeUpdate();
			System.out.println("LikeDao like���ϰ� : " + ret );
			return ret;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbColse(pstmt, conn);
		}
		return -1;
	}
	
	//��õ�� ������ ��¸޼���
	public int likeData(String userid, String subject, String h_num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getCommonConnection();
		String sql="select count(*) from likes where userid=? and subject=? and h_num=?";
		int n=0;
		
		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, userid);
			pstmt.setString(2, subject);
			pstmt.setString(3, h_num);
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
