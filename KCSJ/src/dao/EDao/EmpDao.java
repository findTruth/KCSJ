package dao.EDao;

import java.util.List;

import entity.Emp;
import entity.History;
import entity.Room;
import entity.Vip;
import exception.Exception;
import javabean.ClientBean;
import javabean.VipBean;

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

	Vip QueryVipByVno(int vno);

	boolean VipRuZhu(String vcard, int rmno);

	List<ClientBean> queryClientByRmno(int rmno);

	List<VipBean> queryVipByRmno(int rmno);

	boolean updateVipLeave(int vno);

	boolean updateRoomLeave(int rmno);

	boolean HistoryOfLeave(String name, String card, long tel, int rmno, String type, String time, double allfee);

	boolean deleteClient(String name);

	List<History> queryAllHistory();

	List<History> queryAllHistoryByType(String type);

	List<History> QueryHistoryByRmno(int rmno);
	
	/*
	List<Menus> QueryAllMenus(); 
	
	list<Menus> QueryAllMenusByName(String msname);
	
	boolean AddMenus(String msname,double msfee,double mvfee);
	
	boolean DeleteMenus(String msname);
	
	boolean UpdateMenus(int mno,String msname,double msfee,double mvfee);
	*/
}
