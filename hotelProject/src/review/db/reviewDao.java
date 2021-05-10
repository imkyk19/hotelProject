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
	
	//id에 해당하는 guest 데이터 반환
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

		//sql문 선언
		String sql="insert into review values (seq_Q.nextval,?,?,?,?,?,0,0,sysdate)";

		conn=db.getCommonConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getType());
			pstmt.setString(2, dto.getG_num());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());			
			pstmt.setString(5, dto.getImage());
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbColse(pstmt, conn);
		}
	}
	
	//페이징처리에 필요한 리스트만 보내기
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
			//바인딩
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			//실행
			rs=pstmt.executeQuery();
			//데이터 넣기
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
				//list에 추가
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
	
	
	//글의 전체개수 구하는 메서드
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
	
	//수정메서드
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
	
	//삭제메서드
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
	
	//num에 해당하는 readcount 1 증가
	public void updateReadCount(String h_num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getCommonConnection();
		String sql="update review set readcount=readcount+1 where h_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, h_num);
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbColse(pstmt, conn);
		}
	}	
	
	
	//num에 해당하는 dto데이터 반환
	public reveiwDto getData(String h_num) {
		reveiwDto dto = new reveiwDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = db.getCommonConnection();
		String sql = "select * from review where h_num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			//바인딩
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
	
	
	//아이디에 해당하는 이미지 경로 리턴 메서드
	public String getPhoto(String h_num) {
	
		//변수선언
		String photo="";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		//sql문 선언
		String sql="select image from review where h_num=?";
		
		//db연결
		conn=db.getCommonConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, h_num);
			//실행
			rs=pstmt.executeQuery();
			
			//해당 이름이 있으면 name 얻기
			if(rs.next()) //해당 이름이 없으면 false가되므로 변수 선언과같이 ""빈 문자가 된다.
				photo=rs.getString("image");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbColse(rs, pstmt, conn);
		}
		return photo;
	}
	
	//h_num에해당하는 likes 변경 메서드
	public int updatdLikes(String h_num){
		//변수선언
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		//sql문
		String sql="update review set likes=likes+1 where h_num=?";

		//db연결
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
	
	//h_num에해당하는 likes 변경 메서드
	public int deleteLikes(String h_num){
		//변수선언
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		//sql문
		String sql="update review set likes=likes-1 where h_num=?";

		//db연결
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
	
	
	//추천개수 구하는 메서드
	public int getTotalLikes(String h_num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getCommonConnection();
		String sql="select likes from review where h_num=?";
		int n=0;
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
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
