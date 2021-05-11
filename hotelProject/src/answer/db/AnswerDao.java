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
	
	//insert�޼���
	public void insertAnswer (AnswerDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;

		//sql�� ����
		String sql="insert into answer values (seq_Q.nextval,?,?,sysdate)";

		conn=db.getCommonConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, dto.getContent());
			pstmt.setInt(2, dto.getNum());
			//����
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbColse(pstmt, conn);
		}
	}
	
	//������ ��� �޼���
	public List<AnswerDto> getAnswerList(String num){
		//��ȯŸ�� list ����
		List<AnswerDto> list=new Vector<AnswerDto>();
		//��������
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//sql��
		String sql="select * from answer where num=? order by idx desc";
		//db����
		conn=db.getCommonConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, num);
			//����
			rs=pstmt.executeQuery();
			//dto�� ������ �ֱ�
			while(rs.next()) {
				//dto����(�ݵ�� while�� �ȿ��� �����ؾ���)
				AnswerDto dto=new AnswerDto();
				
				dto.setIdx(rs.getString("idx"));
				dto.setContent(rs.getString("content"));
				dto.setNum(rs.getInt("num"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				//list�� �ֱ�
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
	
	//��� ���� �޼���
	public void updateAnswer(String idx, String content) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getCommonConnection();
		String sql="update answer set content=? where idx=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, content);
			pstmt.setString(2, idx);
			//����
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbColse(pstmt, conn);
		}
		
	}
	
	//��� ���� �޼���
	public void deleteAnswer(String idx) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getCommonConnection();
		String sql="delete from answer where idx=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, idx);
			//����
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbColse(pstmt, conn);
		}
	}
	
	//������ ������-������ ���
	public AnswerDto getAnswer(String idx){
		//��ȯŸ�� list ����
		AnswerDto dto=new AnswerDto();
		//��������
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//sql��
		String sql="select * from answer where idx=?";
		//db����
		conn=db.getCommonConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, idx);
			//����
			rs=pstmt.executeQuery();
			//dto�� ������ �ֱ�
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
