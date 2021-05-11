package answer.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import oracle.db.DbConnect;

public class AnswerDao {
	DbConnect db=new DbConnect();
	
	//insert메서드
	public void insertAnswer (AnswerDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;

		//sql문 선언
		String sql="insert into answer values (seq_Q.nextval,?,?,sysdate)";

		conn=db.getCommonConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getContent());
			pstmt.setInt(2, dto.getNum());
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbColse(pstmt, conn);
		}
	}
	
	//데이터 출력 메서드
	public List<AnswerDto> getAnswerList(String num){
		//반환타입 list 선언
		List<AnswerDto> list=new Vector<AnswerDto>();
		//변수선언
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//sql문
		String sql="select * from answer where num=? order by idx desc";
		//db연결
		conn=db.getCommonConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, num);
			//실행
			rs=pstmt.executeQuery();
			//dto에 데이터 넣기
			while(rs.next()) {
				//dto선언(반드시 while문 안에서 선언해야함)
				AnswerDto dto=new AnswerDto();
				
				dto.setIdx(rs.getString("idx"));
				dto.setContent(rs.getString("content"));
				dto.setNum(rs.getInt("num"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				//list에 넣기
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
	
	//댓글 수정 메서드
	public void updateAnswer(String idx, String content) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getCommonConnection();
		String sql="update answer set content=? where idx=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, content);
			pstmt.setString(2, idx);
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbColse(pstmt, conn);
		}
		
	}
	
	//댓글 삭제 메서드
	public void deleteAnswer(String idx) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getCommonConnection();
		String sql="delete from answer where idx=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, idx);
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbColse(pstmt, conn);
		}
	}
	
	//관리자 페이지-데이터 얻기
	public AnswerDto getAnswer(String idx){
		//반환타입 list 선언
		AnswerDto dto=new AnswerDto();
		//변수선언
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//sql문
		String sql="select * from answer where idx=?";
		//db연결
		conn=db.getCommonConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, idx);
			//실행
			rs=pstmt.executeQuery();
			//dto에 데이터 넣기
			if(rs.next()) {
				
				dto.setIdx(rs.getString("idx"));
				dto.setContent(rs.getString("content"));
				dto.setNum(rs.getInt("num"));
				dto.setWriteday(rs.getTimestamp("writeday"));		
					
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbColse(rs, pstmt, conn);
		}
		
		return dto;
	}

}
