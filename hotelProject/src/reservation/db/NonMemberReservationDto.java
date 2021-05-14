package reservation.db;

public class NonMemberReservationDto {
	private String num;
	private String guest_name;
	private String hp;
	private String addr;
	private int guest_qty;
	private int booking_qty;
	private int total_price;
	private int room_num;
	private String checkin_date;
	private String checkout_date;
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getGuest_name() {
		return guest_name;
	}
	public void setGuest_name(String guest_name) {
		this.guest_name = guest_name;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getGuest_qty() {
		return guest_qty;
	}
	public void setGuest_qty(int guest_qty) {
		this.guest_qty = guest_qty;
	}
	public int getBooking_qty() {
		return booking_qty;
	}
	public void setBooking_qty(int booking_qty) {
		this.booking_qty = booking_qty;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public String getCheckin_date() {
		return checkin_date;
	}
	public void setCheckin_date(String checkin_date) {
		this.checkin_date = checkin_date;
	}
	public String getCheckout_date() {
		return checkout_date;
	}
	public void setCheckout_date(String checkout_date) {
		this.checkout_date = checkout_date;
	}
	
	
}
