package javabean;

import entity.Client;
import entity.Room;

public class ClientBean {
	Client client;
	Room room;
	
	
	public ClientBean() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public ClientBean(Client client, Room room) {
		super();
		this.client = client;
		this.room = room;
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
	

	
}

