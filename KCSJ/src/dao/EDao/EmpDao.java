package dao.EDao;

import java.util.List;

import entity.Emp;
import entity.Room;
import exception.Exception;

public interface EmpDao {
	
	Emp queryEmp(String name);

	Emp queryEmpByCard(String card);

	boolean changePwd(String md5Pwd, String card);
	
	List<Room> QueryAllRoom();

	List<Room> QueryAllRoomNullBytype(String type);

	boolean ClientRuZhu(String name, String card, long tel,int rmno);

	List<Room> QueryAllNullRoom();

	boolean updateRoomRuZhu(int rmno);

	Emp querEmpByName(String ename);

	boolean updateEmpPwd(String ename, String newpwd);

	void QueryVipByVno(int vno);
	
	/*
	List<Menus> QueryAllMenus(); 
	
	list<Menus> QueryAllMenusByName(String msname);
	
	boolean AddMenus(String msname,double msfee,double mvfee);
	
	boolean DeleteMenus(String msname);
	
	boolean UpdateMenus(int mno,String msname,double msfee,double mvfee);
	*/
}
