package entity;

public class Client {
	private String cname;
	private String ccard;
	private long ctel;
	private int rmno;
	private double cmfee;
	private String cdate;

	public Client() {
	}
	
	public Client(String cname, String ccard, long ctel, int rmno, double cmfee, String cdate) {
		super();
		this.cname = cname;
		this.ccard = ccard;
		this.ctel = ctel;
		this.rmno = rmno;
		this.cmfee = cmfee;
		this.cdate = cdate;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCcard() {
		return ccard;
	}

	public void setCcard(String ccard) {
		this.ccard = ccard;
	}

	public long getCtel() {
		return ctel;
	}

	public void setCtel(long ctel) {
		this.ctel = ctel;
	}

	public int getRmno() {
		return rmno;
	}

	public void setRmno(int rmno) {
		this.rmno = rmno;
	}

	public double getCmfee() {
		return cmfee;
	}

	public void setCmfee(double cmfee) {
		this.cmfee = cmfee;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

}
