package entity;

public class Menus {
	private int mno;
	private String msname;
	private double msfee;
	private double mvfee;

	
	public Menus() {
		// TODO Auto-generated constructor stub
	}
	
	
	public Menus(int mno, String msname, double msfee, double mvfee) {
		super();
		this.mno = mno;
		this.msname = msname;
		this.msfee = msfee;
		this.mvfee = mvfee;
	}






	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getMsname() {
		return msname;
	}

	public void setMsname(String msname) {
		this.msname = msname;
	}

	public double getMsfee() {
		return msfee;
	}

	public void setMsfee(double msfee) {
		this.msfee = msfee;
	}

	public double getMvfee() {
		return mvfee;
	}

	public void setMvfee(double mvfee) {
		this.mvfee = mvfee;
	}

}
