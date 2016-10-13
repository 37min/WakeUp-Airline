package NET.WUA.RESERVATION.DB;

public class ReservationResultBean {
	
	private int rNo;           
	private int rScheNo;       
	private String rMemberId;  
	private String rState;    
	
	private int schNo;
	private String schApName;
	private String schDepartDate;
	private String schDepartTime;
	private String schArrivalTime;
	private int schFare;
	private String schDeparture;
	private String schArrival;
	
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
	public int getSchNo() {
		return schNo;
	}
	public void setSchNo(int schNo) {
		this.schNo = schNo;
	}
	public String getSchApName() {
		return schApName;
	}
	public void setSchApName(String schApName) {
		this.schApName = schApName;
	}
	public String getSchDepartDate() {
		return schDepartDate;
	}
	public void setSchDepartDate(String schDepartDate) {
		this.schDepartDate = schDepartDate;
	}
	public String getSchDepartTime() {
		return schDepartTime;
	}
	public void setSchDepartTime(String schDepartTime) {
		this.schDepartTime = schDepartTime;
	}
	public String getSchArrivalTime() {
		return schArrivalTime;
	}
	public void setSchArrivalTime(String schArrivalTime) {
		this.schArrivalTime = schArrivalTime;
	}
	public int getSchFare() {
		return schFare;
	}
	public void setSchFare(int schFare) {
		this.schFare = schFare;
	}
	public String getSchDeparture() {
		return schDeparture;
	}
	public void setSchDeparture(String schDeparture) {
		this.schDeparture = schDeparture;
	}
	public String getSchArrival() {
		return schArrival;
	}
	public void setSchArrival(String schArrival) {
		this.schArrival = schArrival;
	}
	
}
