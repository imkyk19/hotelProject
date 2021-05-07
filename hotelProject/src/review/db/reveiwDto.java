package review.db;

import java.sql.Timestamp;

public class reveiwDto {
	private String h_num;
	private String type;
	private String g_num;
	private String subject;
	private String content;
	private String image;
	private int readcount;
	private int likes;
	private Timestamp writeday;
	
	
	public String getH_num() {
		return h_num;
	}
	public void setH_num(String h_num) {
		this.h_num = h_num;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getG_num() {
		return g_num;
	}
	public void setG_num(String g_num) {
		this.g_num = g_num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	


	
	
}
