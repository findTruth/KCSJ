package dao.EDao;

import java.util.List;

import entity.Client;
import entity.Emp;
import entity.Room;
import entity.Vip;
import exception.Exception;

public interface EmpDao {
	
	Emp queryEmp(String name);

	Emp queryEmpByCard(String card);

	boolean changePwd(String md5Pwd, String card);
	
	List<Room> QueryAllRoom();

	List<Room> QueryAllYuDing();	
	
	List<Room> QueryAllRoomNullBytype(String type);
	
	boolean updateroomyudingruzhu(int rmno);
	
	boolean yudingruzhu(int rmno);
	
	boolean roomyudingruzhu(int rmno);
	
	boolean ClientYuDing(String name, String card, long tel,int rmno);

	boolean ClientRuZhu(String name, String card, long tel,int rmno);

	List<Room> QueryAllNullRoom();
	
	Client queryClientByRmno(int rmno);
	
	 String queryRoomTypeByRmno(int rmno);
 
	boolean updateRoomYuDing(int rmno);
	
	boolean updateRoomRuZhu(int rmno);
	
	boolean tuiding(int rmno);
	
	boolean deleteClient(int rmno);

	boolean yudingHistory(String vname, String vcard, long tel, 
			int rmno, String rmtype, String newtime,String shijian);
	
	boolean addRuZhuhistory(String name, String card, long tel,
			int rmno, String type, String newtime,
			String shijian);
	
	public boolean addTuiDinghistory(String name, String card, 
			long tel, int rmno, String type, String newtime,
			String shijian);
	
	Emp querEmpByName(String ename);

	boolean updateEmpPwd(String ename, String newpwd);

	void QueryVipByVno(int vno);
	
	Vip QueryVipByVno2(int vno);
	
	/*
	List<Menus> QueryAllMenus(); 
	
	list<Menus> QueryAllMenusByName(String msname);
	
	boolean AddMenus(String msname,double msfee,double mvfee);
	
	boolean DeleteMenus(String msname);
	
	boolean UpdateMenus(int mno,String msname,double msfee,double mvfee);
	*/
}
