package reservation.db;

import java.sql.Timestamp;

public class ReservationDto {
	private int num;
	private int guestNum;
	private String guestName;
	private String checkInDate;
	private String checkOutDate;
	private int guestQty;
	private int bookingQty;
	private int totalPrice;
	private int roomNum;
	
	public int getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getGuestNum() {
		return guestNum;
	}
	public void setGuestNum(int guestNum) {
		this.guestNum = guestNum;
	}
	public String getGuestName() {
		return guestName;
	}
	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}
	
	public String getCheckInDate() {
		return checkInDate;
	}
	public void setCheckInDate(String checkInDate) {
		this.checkInDate = checkInDate;
	}
	public String getCheckOutDate() {
		return checkOutDate;
	}
	public void setCheckOutDate(String checkOutDate) {
		this.checkOutDate = checkOutDate;
	}
	public int getGuestQty() {
		return guestQty;
	}
	public void setGuestQty(int guestQty) {
		this.guestQty = guestQty;
	}
	public int getBookingQty() {
		return bookingQty;
	}
	public void setBookingQty(int bookingQty) {
		this.bookingQty = bookingQty;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
}
