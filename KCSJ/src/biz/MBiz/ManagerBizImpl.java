package biz.MBiz;

import java.util.ArrayList;
import java.util.List;

import Tool.MD5;
import dao.EDao.EmpDaoimpl;
import dao.MDao.ManagerDao;
import dao.MDao.ManagerDaoimpl;
import entity.Emp;
import entity.Manager;
import entity.Room;

public class ManagerBizImpl implements ManagerBiz {

	ManagerDao dao = new ManagerDaoimpl();

	// 增加管理员
	public boolean addManager(String mname, String pwd,String card) {

		boolean flag = dao.addManager(mname, pwd,card);

		return flag;
	}

	// 登录时查询管理员
	public String querymanager(String name, String pwd, String code, String checkCode) {

		Manager m = dao.querymanager(name);

		String MD5pwd = MD5.MD5(pwd);
		
		if (code != null && code.equals(checkCode)) {
			if (m!= null) {
				
				if (m.getMname().equals(name) && m.getPassword().equals(MD5pwd)) {

					return "正确";

				} else {
					return "错误";

				}
			}
			return "无该用户";
		} else {

			return "验证码错误";

		}

	}

	// 管理员的注册
	public String AddManager(String name, String pwd, String code, String checkCode,String card) {

		Manager m = dao.querymanager(name);
		
		Manager m1 = dao.querymanagerByCard(card);
		
		if (code!= null && code.equals(checkCode)) {

			if(m1 !=null){
				return "该身份证已经被注册";
			}
			
			if (m!=null) {
				return "已经存在";
			}
			
			//对密码进行加密
			String Md5pwd = MD5.MD5(pwd);
			
			boolean flag = dao.addManager(name, Md5pwd,card);

			if (flag == true) {
				return "成功";
			} else {
				return "失败";
			}

		} else {

			return "验证码错误";
		}

	}

	//查询所有员工
	public List<Emp> queryall() {
		
		return dao.queryall();
	}
	
	//删除员工通过员工编号
	public boolean deleteEmp(int empno) {
		
		return dao.deleteemp(empno);
	}

	//实现单个查询(判断是姓名还是编号)
	
	public List<Emp> QueryEmp(String str) {
		
		if(!str.equals("")){
			//判断是否是数字
			if(str!=null&&str.matches("^[0-9]+$")){
				
				int no = Integer.valueOf(str);
				
				return dao.queryempByno(no);
			}else{
				return dao.queryempByname(str);
				
			}
		}else{
			return dao.queryall();
		}
		
		
	}
	
	

	//增加员工
	public boolean AddEmp(String name, String sex, int age,double sal,String card) {

		return dao.AddEmp(name, sex, age, sal, card);
	}
	


	//更新员工信息
	public boolean updateEmp(int empno, String ename, String sex, int age, double sal,String card) {

		return dao.updateEmp(empno, ename, sex, age, sal,card);
	}

	
	// 查询单个emp
	public Emp queryemp(int empno) {

		return dao.queryemp(empno);
	}
	

    //查询所有房间信息
	public List<Room> QueryAllRoom() {

       return dao.QueryAllRoom();
		
	}

	//查询单个房间
	public List<Room> QueryRoom(String str) {

		if(!str.equals("")){
			//判断是否是数字
			if(str!=null&&str.matches("^[0-9]+$")){
				
				int no = Integer.valueOf(str);
				
				return dao.queryRoomByNo(no);
				
				
			}else{
				
				return dao.queryRoomByName(str);
				
				
			}
		}else{
			
			return dao.QueryAllRoom();
			
		}
		
	}

	@Override
	public boolean deleteRoom(int rmno) {

		return dao.deleteRoom(rmno);
		
	}

	//更新房间信息
	public boolean updateRoom(int rmno, String type, double price, double vprice) {
		return dao.updateRoom(rmno,type,price,vprice);
	}

	/**
	 * 管理员更新密码
	 */
	public String updatePwd(String mname,String pwd, String oldpwd, String newpwd) {
		if(!pwd.equals(oldpwd)){
			return "nosame";
		}else{
			
			boolean flag = dao.updatePwd(mname,MD5.MD5(newpwd));
			
			if(flag){
				return "success";
				
			}else{
				
				return "erro";
			}
		}
	}

	@Override
	public boolean addRoom(String type, double price, double vprice) {
		return dao.addRoom(type,price,vprice);
	}


	


}
