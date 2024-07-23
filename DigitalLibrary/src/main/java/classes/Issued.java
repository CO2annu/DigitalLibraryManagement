package classes;

public class Issued {
	private int IID;
	private int UID;
	private int BID;
	private String Issued_date;
	private String Return_date;
	private int period;
	private int fine;
	
	public Issued(int IID, int UID, int BID, String Issued_date, String Return_date, int period, int fine) {
		
		this.IID = IID;
		this.UID = UID;
		this.BID = BID;
		this.Issued_date = Issued_date;
		this.Return_date = Return_date;
		this.period = period;
		this.fine = fine;
	}
	
	public int getIID() {
		return IID;
	}
	public void setIID(int iID) {
		IID = iID;
	}
	public int getUID() {
		return UID;
	}
	public void setUID(int uID) {
		UID = uID;
	}
	public int getBID() {
		return BID;
	}
	public void setBID(int bID) {
		BID = bID;
	}
	public String getIssued_date() {
		return Issued_date;
	}
	public void setIssued_date(String issued_date) {
		Issued_date = issued_date;
	}
	public String getReturn_date() {
		return Return_date;
	}
	public void setReturn_date(String return_date) {
		Return_date = return_date;
	}
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	public int getFine() {
		return fine;
	}
	public void setFine(int fine) {
		this.fine = fine;
	}
	
}
