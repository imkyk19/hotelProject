package guest.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import oracle.db.DbConnect;

public class GuestDao {
   
DbConnect db=new DbConnect();

      public boolean isIdCheck(String id) {
         boolean t=false;     
         Connection conn=null;
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         
         String sql="select * from guest where id=?";
         conn=db.getCommonConnection();
         try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs=pstmt.executeQuery();
            if(rs.next()) {
               t=true;
            }
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }finally {
            db.dbColse(rs, pstmt, conn);
         }
         return t;
      }
      
  
      public String getPass(String id) {
         Connection conn=null;
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         String pass="    ";
         
         String sql="select pass from guest where id=?";
         conn=db.getCommonConnection();
         try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs=pstmt.executeQuery();
            
            if(rs.next()) {
               pass=rs.getString(1);
            }
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }finally {
            db.dbColse(rs, pstmt, conn);
         }
         return pass;
      }
      

  
            public List<GuestDto> getGuestList()
            {
               List<GuestDto> list=new Vector<GuestDto>();
               Connection conn=null;
               PreparedStatement pstmt=null;
               ResultSet rs=null;
               String sql="select * from guest order by g_num";
               conn=db.getCommonConnection();
               
               try {
                  pstmt=conn.prepareStatement(sql);
                  rs=pstmt.executeQuery();
                  while(rs.next())
                  {
                     GuestDto dto=new GuestDto();
                     dto.setG_num(rs.getString("g_num"));
                     dto.setName(rs.getString("name"));
                     dto.setBirth(rs.getString("birth"));
                     dto.setEmail(rs.getString("email"));
                     dto.setHp(rs.getString("hp"));
                     dto.setAddr(rs.getString("addr"));
                     dto.setId(rs.getString("id"));
                     dto.setPass(rs.getString("pass"));
                     
                     
                     list.add(dto);
                  }
               } catch (SQLException e) {
                  // TODO Auto-generated catch block
                  e.printStackTrace();
               }finally {
                  db.dbColse(rs,pstmt, conn);
               }
               
               return list;
            }
      
         
      public GuestDto getData(String id)

      {
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

            // TODO Auto-generated catch block

            e.printStackTrace();

         }finally {

            db.dbColse(rs, pstmt, conn);

         }return dto;
      }
      
 
      //num에대한 id반환 메서드
      public GuestDto getId(String g_num)

      {
         GuestDto dto=new GuestDto();
         Connection conn=null;

         PreparedStatement pstmt=null;

         ResultSet rs=null;

         String sql="select * from guest where g_num=?";

         conn=db.getCommonConnection();

   

         try {

            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, g_num);
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

            // TODO Auto-generated catch block

            e.printStackTrace();

         }finally {

            db.dbColse(rs, pstmt, conn);

         }return dto;
      }
      
      
      
      

      public void updateGuest(GuestDto dto)

      {
            Connection conn=null;

            PreparedStatement pstmt=null;

            String sql="update guest set name=?,birth=TO_DATE(?,'yyyy-MM-dd'),email=?,hp=?,addr=? where id=?";
            
            conn=db.getCommonConnection();

            try {

               pstmt=conn.prepareStatement(sql);
               
               pstmt.setString(1, dto.getName());
               
               pstmt.setString(2, dto.getBirth());

               pstmt.setString(3, dto.getEmail());

               pstmt.setString(4, dto.getHp());

               pstmt.setString(5, dto.getAddr());

               pstmt.setString(6, dto.getId());
          System.out.println("name : " + dto.getName());
			System.out.println("birth : " +  dto.getBirth());
			System.out.println("email : " + dto.getEmail());
			System.out.println("hp : " + dto.getHp());
			System.out.println("addr : " + dto.getAddr());
			System.out.println("id : " + dto.getId());

               pstmt.execute();

            } catch (SQLException e) {

               // TODO Auto-generated catch block

               e.printStackTrace();

            }finally {

               db.dbColse(pstmt, conn);

            }

         }
      
      public void deleteGuest(String g_num) {
         Connection conn = null;
         PreparedStatement pstmt = null;
         String sql = "delete from guest where g_num=?";
         
         conn = db.getCommonConnection();
         try {
            pstmt = conn.prepareStatement(sql);
            System.out.println("a");
            pstmt.setString(1, g_num);
            
            pstmt.execute();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         } finally {
            db.dbColse(pstmt, conn);
         }
      }
      

            public void insertGuest(GuestDto dto) {
               Connection conn=null;
               PreparedStatement pstmt=null;
               
               String sql="insert into guest values (seq_q.nextval,?,TO_DATE(?,'yyyy-MM-dd'),?,?,?,?,?,0)";
               conn=db.getCommonConnection();
               try {
                  pstmt=conn.prepareStatement(sql);
                  pstmt.setString(1, dto.getName());
                  pstmt.setString(2, dto.getBirth());
                  pstmt.setString(3, dto.getEmail());
                  pstmt.setString(4, dto.getHp());
                  pstmt.setString(5, dto.getAddr());
                  pstmt.setString(6, dto.getId());
                  pstmt.setString(7, dto.getPass());
                  
                  pstmt.execute();
               } catch (SQLException e) {
                  // TODO Auto-generated catch block
                  e.printStackTrace();
               }finally {
                  db.dbColse(pstmt, conn);
               }
               
            }
            
            
            
            public boolean isPassCheck(String id,String pass) {
    			Connection conn=null;
    			PreparedStatement pstmt=null;
    			ResultSet rs=null;
    			
    			conn=db.getCommonConnection();
    			String sql="select count(*) from guest where id=? and pass=?";
    			
    			int r=0;
    			
    			try {
    				pstmt=conn.prepareStatement(sql);
    				pstmt.setString(1,id);
    				pstmt.setString(2,pass);
    				rs=pstmt.executeQuery();
    				if(rs.next())
    					r=rs.getInt(1);
    			} catch (SQLException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}finally {
    				db.dbColse(rs,pstmt,conn);
    			}
    			return r==1?true:false;
    		}
            
            
            
            public String getName(String id)
            {
            	String name="";
            	Connection conn=null;
            	PreparedStatement pstmt=null;
            	ResultSet rs=null;
            	String sql="select name from guest where id=?";
            	conn=db.getConnection();
            	try {
            		pstmt=conn.prepareStatement(sql);
            		pstmt.setString(1, id);
            		rs=pstmt.executeQuery();
            		if(rs.next())
            			name=rs.getString("name");
            	} catch (SQLException e) {
            		// TODO Auto-generated catch block
            		e.printStackTrace();
            	}finally {
            		db.dbColse(rs,pstmt, conn);
            	}
            	
            	
            	return name;
            }
            }
            
            
     

