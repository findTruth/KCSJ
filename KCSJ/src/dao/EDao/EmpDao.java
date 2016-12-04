package dao.EDao;

import java.util.List;

import entity.Client;
import entity.Emp;
import entity.History;
import entity.Menus;
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

	List<Room> QueryAllYuDing();	
	
	List<Room> QueryAllRoomNullBytype(String type);
	
	List<Room> QueryAllRoomByRmbuff();
	
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
	
	boolean addRuZhuhistory(String name, String card, long tel,int rmno, String type,String shijian);
	
	public boolean addTuiDinghistory(String name, String card, 
			long tel, int rmno, String type, String newtime,
			String shijian);
	
	Emp querEmpByName(String ename);

	boolean updateEmpPwd(String ename, String newpwd);

	Vip QueryVipByVno(int vno);

	boolean VipRuZhu(String vcard, int rmno);

	List<ClientBean> queryClientByRmno2(int rmno);

	List<VipBean> queryVipByRmno(int rmno);

	boolean updateVipLeave(int vno);

	boolean updateRoomLeave(int rmno);

	boolean HistoryOfLeave(String name, String card, long tel, int rmno, String type, String time, double allfee);

	boolean deleteClient(String name);

	List<History> queryAllHistory();

	List<History> queryAllHistoryByType(String type);

	List<History> QueryHistoryByRmno(int rmno);
	
	Vip QueryVipByVno2(int vno);

	List<Menus> queryAllMenus();
	
	/*
	
	list<Menus> QueryAllMenusByName(String msname);
	
	boolean AddMenus(String msname,double msfee,double mvfee);
	
	boolean DeleteMenus(String msname);
	
	boolean UpdateMenus(int mno,String msname,double msfee,double mvfee);
	*/
}
