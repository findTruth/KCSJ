package entity;

public class Menus {
	private int mno;
	private String msname;
	private String mimg;
	private String mtype;
	private double msfee;
	private double mvfee;
	private double msale;
	

	
	public Menus() {
		// TODO Auto-generated constructor stub
	}
	

	public Menus(int mno, String msname, String mimg, String mtype, double msfee, double mvfee, double msale) {
		super();
		this.mno = mno;
		this.msname = msname;
		this.mimg = mimg;
		this.mtype = mtype;
		this.msfee = msfee;
		this.mvfee = mvfee;
		this.msale = msale;
	}






	public String getMtype() {
		return mtype;
	}



	public void setMtype(String mtype) {
		this.mtype = mtype;
	}



	public double getMsale() {
		return msale;
	}



	public void setMsale(double msale) {
		this.msale = msale;
	}



	public String getMimg() {
		return mimg;
	}


	public void setMimg(String mimg) {
		this.mimg = mimg;
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
