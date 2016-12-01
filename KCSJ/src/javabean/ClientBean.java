package javabean;

import entity.Client;
import entity.Room;

public class ClientBean {
	private Client client;
	private Room room;
	private String XinXi;
	
	public ClientBean() {
		// TODO Auto-generated constructor stub
	}
	
	
	


	public ClientBean(Client client, Room room, String xinXi) {
		super();
		this.client = client;
		this.room = room;
		XinXi = xinXi;
	}





	public String getXinXi() {
		return XinXi;
	}


	public void setXinXi(String xinXi) {
		XinXi = xinXi;
	}


	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	
	//计算总价（饭钱+房费）
	public double allPrice(double feeprice,double roomprice){
		
		return  feeprice+roomprice;
		
	}

	
}

