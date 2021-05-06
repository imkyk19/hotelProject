package question.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import oracle.db.DbConnect;

public class QuestionDao {

	DbConnect db=new DbConnect();
	
	//insert�޼���
	public void insertQuestion(QuestionDto dto){
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		//sql�� ����
		String sql="insert into question values (seq_Q.nextval,?,?,?,?,?,?,?,sysdate)";

		conn=db.getCommonConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, dto.getType());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getName());
			pstmt.setString(5, dto.getPass());
			pstmt.setString(6, dto.getEmail());
			pstmt.setString(7, dto.getHp());
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
		public List<QuestionDto> getList(int start, int end) {
			
			List<QuestionDto> list=new Vector<QuestionDto>();
			
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			conn=db.getCommonConnection();
			String sql="select a.* from (select ROWNUM as RNUM,b.* from "
					+ "(select * from question order by num desc)b)a where a.RNUM>=? and a.RNUM<=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				//���ε�
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				//����
				rs=pstmt.executeQuery();
				//������ �ֱ�
				while(rs.next()) {
					QuestionDto dto=new QuestionDto();
					
					dto.setNum(rs.getString("num"));
					dto.setType(rs.getString("type"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setName(rs.getString("name"));
					dto.setPass(rs.getString("pass"));
					dto.setEmail(rs.getString("email"));
					dto.setHp(rs.getString("hp"));
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
		String sql="select count(*) from question";
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
	
	
	//num�� �ش��ϴ� dto������ ��ȯ
	public QuestionDto getData(String num) {
		QuestionDto dto = new QuestionDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn = db.getCommonConnection();
		String sql = "select * from question where num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, num);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setType(rs.getString("type"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setEmail(rs.getString("email"));
				dto.setHp(rs.getString("hp"));
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
	
	//�����޼���
	public void updateContent(String num, String subject, String content){
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn = db.getCommonConnection();
		String sql = "update question set subject=?,content=? where num=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbColse(pstmt, conn);
		}
	}
	
	//�����޼���
	public void deleteContent(String num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn = db.getCommonConnection();
		String sql = "delete from question where num=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbColse(pstmt, conn);
		}
	}
	
}
