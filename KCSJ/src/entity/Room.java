package entity;

public class Room {
	private int rmno;
	private String rmtype;
	private double rmprice;
	private double vprice;
	private String rmbuff;
	private String rmbook;
	private String rydate;

	
	
	public Room() {
		// TODO Auto-generated constructor stub
	}
	
	
	public Room(int rmno, String rmtype, double rmprice, double vprice, String rmbuff, String rmbook, String rydate) {
		super();
		this.rmno = rmno;
		this.rmtype = rmtype;
		this.rmprice = rmprice;
		this.vprice = vprice;
		this.rmbuff = rmbuff;
		this.rmbook = rmbook;
		this.rydate = rydate;
	}

	public int getRmno() {
		return rmno;
	}

	public void setRmno(int rmno) {
		this.rmno = rmno;
	}

	public String getRmtype() {
		return rmtype;
	}

	public void setRmtype(String rmtype) {
		this.rmtype = rmtype;
	}

	public double getRmprice() {
		return rmprice;
	}

	public void setRmprice(double rmprice) {
		this.rmprice = rmprice;
	}

	public double getVprice() {
		return vprice;
	}

	public void setVprice(double vprice) {
		this.vprice = vprice;
	}

	public String getRmbuff() {
		return rmbuff;
	}

	public void setRmbuff(String rmbuff) {
		this.rmbuff = rmbuff;
	}

	public String getRmbook() {
		return rmbook;
	}

	public void setRmbook(String rmbook) {
		this.rmbook = rmbook;
	}

	public String getRydate() {
		return rydate;
	}

	public void setRydate(String rydate) {
		this.rydate = rydate;
	}

}
