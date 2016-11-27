package entity;

import java.util.Date;

public class Emp {
	private int empno;
	private String ecard;
	private String epassword;
	private String ename;
	private String esex;
	private int eage;
	private double esal;

	public Emp() {
		// TODO Auto-generated constructor stub
	}

	public Emp(int empno, String ecard, String epassword, String ename, String esex, int eage, double esal) {
		super();
		this.empno = empno;
		this.ecard = ecard;
		this.epassword = epassword;
		this.ename = ename;
		this.esex = esex;
		this.eage = eage;
		this.esal = esal;
	}

	public String getEcard() {
		return ecard;
	}

	public void setEcard(String ecard) {
		this.ecard = ecard;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getEpassword() {
		return epassword;
	}

	public void setEpassword(String epassword) {
		this.epassword = epassword;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getEsex() {
		return esex;
	}

	public void setEsex(String esex) {
		this.esex = esex;
	}

	public int getEage() {
		return eage;
	}

	public void setEage(int eage) {
		this.eage = eage;
	}

	public double getEsal() {
		return esal;
	}

	public void setEsal(double esal) {
		this.esal = esal;
	}

}
