package entity;

public class Manager {
	
	private int mid;
	private String mname;
	private String password;
	private String mcard;
	
	
	public Manager() {
		// TODO Auto-generated constructor stub
	}

	public Manager(int mid, String mname, String password, String mcard) {
		super();
		this.mid = mid;
		this.mname = mname;
		this.password = password;
		this.mcard = mcard;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getMcard() {
		return mcard;
	}

	public void setMcard(String mcard) {
		this.mcard = mcard;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
