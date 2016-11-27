package biz.MBiz;

import java.util.List;

import entity.Emp;
import entity.Room;

public interface ManagerBiz {
	
	boolean addManager(String mname,String pwd,String card);
	
	String querymanager(String name, String pwd, String code, String checkCode);
	
	List<Emp> queryall();
	
	boolean AddEmp(String name, String sex, int age,double sal,String card);
	
	boolean updateEmp(int empno, String ename, String sex, int age, double sal,String card);
	
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

}
