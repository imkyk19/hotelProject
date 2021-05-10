package review.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import guest.db.GuestDto;
import oracle.db.DbConnect;
import question.db.QuestionDto;

public class reviewDao {
	DbConnect db=new DbConnect();
	
	//id�� �ش��ϴ� guest ������ ��ȯ
	public guest.db.GuestDto getId(String id){
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
				dto.setG_num(rs.getString("g_num"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getString("birth"));
				dto.setEmail(rs.getString("email"));
				dto.setHp(rs.getString("hp"));
				dto.setAddr(rs.getString("addr"));
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbColse(rs, pstmt, conn);
		}return dto;
	}
	
	
	//insert
	public void insertReview(reveiwDto dto){

		Connection conn=null;
		PreparedStatement pstmt=null;

		//sql�� ����
		String sql="insert into review values (seq_Q.nextval,?,?,?,?,?,0,0,sysdate)";

		conn=db.getCommonConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, dto.getType());
			pstmt.setString(2, dto.getG_num());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());			
			pstmt.setString(5, dto.getImage());
			//����
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbColse(pstmt, conn);
		}
	}
	
	//����¡ó���� �ʿ��� ����Ʈ�� ������
	public List<reveiwDto> getList(int start, int end) {
		
		List<reveiwDto> list=new Vector<reveiwDto>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getCommonConnection();
		String sql="select a.* from (select ROWNUM as RNUM,b.* from "
				+ "(select * from review order by h_num desc)b)a where a.RNUM>=? and a.RNUM<=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			//����
			rs=pstmt.executeQuery();
			//������ �ֱ�
			while(rs.next()) {
				reveiwDto dto=new reveiwDto();
				
				dto.setH_num(rs.getString("h_num"));
				dto.setType(rs.getString("type"));
				dto.setG_num(rs.getString("g_num"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setImage(rs.getString("image"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setLikes(rs.getInt("likes"));
				dto.setWriteday(rs.getTimestamp("writeday"));
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
	
	
	//���� ��ü���� ���ϴ� �޼���
	public int getTotalCount() {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getCommonConnection();
		String sql="select count(*) from review";
		int n=0;
		
		try {
			pstmt=conn.prepareStatement(sql);
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
	
	//�����޼���
	public void updateContent(String num, String type, String subject, String content, String image){
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn = db.getCommonConnection();
		String sql = "update review set type=?,subject=?,content=?,image=? where num=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, type);
			pstmt.setString(2, subject);
			pstmt.setString(3, content);
			pstmt.setString(4, image);
			pstmt.setString(5, num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbColse(pstmt, conn);
		}
	}
	
	//�����޼���
	public void deleteContent(String h_num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn = db.getCommonConnection();
		String sql = "delete from review where h_num=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, h_num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbColse(pstmt, conn);
		}
	}
	
	//num�� �ش��ϴ� readcount 1 ����
	public void updateReadCount(String h_num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getCommonConnection();
		String sql="update review set readcount=readcount+1 where h_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, h_num);
			//����
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbColse(pstmt, conn);
		}
	}	
	
	
	//num�� �ش��ϴ� dto������ ��ȯ
	public reveiwDto getData(String h_num) {
		reveiwDto dto = new reveiwDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = db.getCommonConnection();
		String sql = "select * from review where h_num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, h_num);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setH_num(rs.getString("h_num"));
				dto.setType(rs.getString("type"));
				dto.setG_num(rs.getString("g_num"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setImage(rs.getString("image"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setLikes(rs.getInt("likes"));
				dto.setWriteday(rs.getTimestamp("writeday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbColse(rs, pstmt, conn);
		}
		return dto;
	}
	
	
	//���̵� �ش��ϴ� �̹��� ��� ���� �޼���
	public String getPhoto(String h_num) {
	
		//��������
		String photo="";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		//sql�� ����
		String sql="select image from review where h_num=?";
		
		//db����
		conn=db.getCommonConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, h_num);
			//����
			rs=pstmt.executeQuery();
			
			//�ش� �̸��� ������ name ���
			if(rs.next()) //�ش� �̸��� ������ false���ǹǷ� ���� ��������� ""�� ���ڰ� �ȴ�.
				photo=rs.getString("image");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbColse(rs, pstmt, conn);
		}
		return photo;
	}
	
	//h_num���ش��ϴ� likes ���� �޼���
	public int updatdLikes(String h_num){
		//��������
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		//sql��
		String sql="update review set likes=likes+1 where h_num=?";

		//db����
		conn=db.getCommonConnection();
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, h_num);
				return pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbColse(pstmt, conn);
			}
			return -1;

	}
	
	//h_num���ش��ϴ� likes ���� �޼���
	public int deleteLikes(String h_num){
		//��������
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		//sql��
		String sql="update review set likes=likes-1 where h_num=?";

		//db����
		conn=db.getCommonConnection();
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, h_num);
				return pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbColse(pstmt, conn);
			}
			return -1;

	}
	
	
	//��õ���� ���ϴ� �޼���
	public int getTotalLikes(String h_num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getCommonConnection();
		String sql="select likes from review where h_num=?";
		int n=0;
		
		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, h_num);
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
