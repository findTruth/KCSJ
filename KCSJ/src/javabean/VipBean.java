package javabean;

import entity.Room;
import entity.Vip;

public class VipBean {
	private Vip vip;
	private Room room;
	private String XinXi;

	
	public VipBean() {
		// TODO Auto-generated constructor stub
	}	
	
	public VipBean(Vip vip, Room room, String xinXi) {
		super();
		this.vip = vip;
		this.room = room;
		XinXi = xinXi;
	}

	public String getXinXi() {
		return XinXi;
	}

	public void setXinXi(String xinXi) {
		XinXi = xinXi;
	}

	public Vip getVip() {
		return vip;
	}

	public void setVip(Vip vip) {
		this.vip = vip;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

}
