package NET.WUA.RESERVATION.DB;

public class ReservationBean {

	private int rNo;           // (예약번호)
	private int rScheNo;       // (스케줄 번호)
	private String rMemberId;  // (고객의 ID)
	private String rState;     // (예약상태)
	
	
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public int getrScheNo() {
		return rScheNo;
	}
	public void setrScheNo(int rScheNo) {
		this.rScheNo = rScheNo;
	}
	public String getrMemberId() {
		return rMemberId;
	}
	public void setrMemberId(String rMemberId) {
		this.rMemberId = rMemberId;
	}
	public String getrState() {
		return rState;
	}
	public void setrState(String rState) {
		this.rState = rState;
	}
 
	
}
