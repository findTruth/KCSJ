package biz.MBiz;

import java.util.List;

import entity.Emp;
import entity.Menus;
import entity.Room;

public interface ManagerBiz {
	
	boolean addManager(String mname,String pwd,String card);
	
	String querymanager(String name, String pwd, String code, String checkCode);
	
	List<Emp> queryall();
	
	String AddEmp(String name, String sex, int age,double sal,String card);
	
	String updateEmp(int empno, String ename, String sex, int age, double sal,String card);
	
	boolean deleteEmp(int empno);
	
	Emp queryemp(int empno);

	String AddManager(String name, String pwd, String code, String checkCode,String card);

	List<Emp> QueryEmp(String str);

	List<Room> QueryAllRoom();

	List<Room> QueryRoom(String name);

	boolean deleteRoom(int rmno);

	boolean updateRoom(int rmno, String type, double price, double vprice);

	String updatePwd(String mname,String pwd, String oldpwd, String newpwd);

	boolean addRoom(String type, double price, double vprice);

	List<Menus> MenusList();

	boolean deleteMenus(int mno);

	List<Menus> queryMenusByType(String type);

	List<Menus> queryMenusByString(String str);

	boolean addMenus(String address, String mname, String type, double price, double vprice);

	Menus queryMenus_update(int mno);

	boolean updateMenus(int mno, String msname, String type, double price, double vprice, String address);

}
