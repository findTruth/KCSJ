package dao.MDao;

import java.util.List;

import entity.Emp;
import entity.Manager;
import entity.Menus;
import entity.Room;

public interface ManagerDao {
	
	boolean addManager(String mname, String pwd,String card);
	
	Manager querymanager(String name);
	
	List<Emp> queryall();
	
	boolean AddEmp(String name, String sex, int age,double sal,String card);
	
	boolean updateEmp(int empno, String ename, String sex, int age, double sal,String card);
	
	boolean deleteemp(int empno);
	
	Emp queryemp(int empno);

	Manager querymanagerByCard(String card);

	List<Emp> queryempByno(int no);

	List<Emp> queryempByname(String str);

	List<Room> QueryAllRoom();

	List<Room> queryRoomByNo(int no);

	List<Room> queryRoomByName(String str);

	boolean deleteRoom(int rmno);

	boolean updateRoom(int rmno, String type, double price, double vprice);

	boolean updatePwd(String mname, String md5);

	boolean addRoom(String type, double price, double vprice);

	Emp queryempByename(String ename);

	List<Menus> MenusList();

	boolean deleteMenus(int mno);

	List<Menus> queryMenusByType(String type);

	List<Menus> queryMenusByString(String str);

	boolean addMenus(String address, String mname, String type, double price, double vprice);
	
}
