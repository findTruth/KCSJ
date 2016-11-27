package entity;

public class Vip {
	private int vno;
	private String vname;
	private String vcard;
	private int rmno;
	private long vtel;
	private double vfee;
	private String vdate;
	
	
	public Vip() {
		// TODO Auto-generated constructor stub
	}
	
	public Vip(int vno, String vname, String vcard, int rmno, long vtel, double vfee, String vdate) {
		super();
		this.vno = vno;
		this.vname = vname;
		this.vcard = vcard;
		this.rmno = rmno;
		this.vtel = vtel;
		this.vfee = vfee;
		this.vdate = vdate;
	}








	public int getVno() {
		return vno;
	}
	public void setVno(int vno) {
		this.vno = vno;
	}
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}
	public String getVcard() {
		return vcard;
	}
	public void setVcard(String vcard) {
		this.vcard = vcard;
	}
	public int getRmno() {
		return rmno;
	}
	public void setRmno(int rmno) {
		this.rmno = rmno;
	}
	public long getVtel() {
		return vtel;
	}
	public void setVtel(long vtel) {
		this.vtel = vtel;
	}
	public double getVfee() {
		return vfee;
	}
	public void setVfee(double vfee) {
		this.vfee = vfee;
	}
	public String getVdate() {
		return vdate;
	}
	public void setVdate(String vdate) {
		this.vdate = vdate;
	}
	
	
	
	
	
	
}
