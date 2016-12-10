package dao.MDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Emp;
import entity.Manager;
import entity.Menus;
import entity.Room;
import util.util;

public class ManagerDaoimpl implements ManagerDao {

	// 管理员注册
	public boolean addManager(String mname, String pwd, String card) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = " insert into manager values(manager_seq.nextval,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, mname);
			ps.setString(2, pwd);
			ps.setString(3, card);
			int i = ps.executeUpdate();
			if (i >= 1) {
				flag = true;
			}

			util.closeConnection(ps, conn, null);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	// 查询单个管理员
	public Manager querymanager(String name) {
		Manager m = null;

		try {
			Connection conn = util.getConnection();
			String sql = "select * from manager where mname=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				m = new Manager();
				m.setMname(rs.getString("mname"));
				m.setPassword(rs.getString("mpassword"));
				m.setMcard(rs.getString("mcard"));
			}
			util.closeConnection(ps, conn, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return m;
	}

	// 通过身份证查询管理员
	public Manager querymanagerByCard(String card) {
		Manager m = null;

		try {
			Connection conn = util.getConnection();
			String sql = "select * from manager where mcard=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, card);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				m = new Manager();
				m.setMname(rs.getString("mname"));
				m.setPassword(rs.getString("mpassword"));
				m.setMcard(rs.getString("mcard"));
			}
			util.closeConnection(ps, conn, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return m;
	}

	// 查询所有员工
	public List<Emp> queryall() {
		List<Emp> list = new ArrayList<Emp>();
		try {
			Connection conn = util.getConnection();
			String sql = "select * from emp order by empno asc ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			Emp e = null;
			while (rs.next()) {
				int empno = rs.getInt("empno");
				String password = rs.getString("epassword");
				String esex = rs.getString("esex");
				String ename = rs.getString("ename");
				int eage = rs.getInt("eage");
				double sal = rs.getDouble("esal");
				String ecard = rs.getString("ecard");

				// emp表-->Employee对象
				e = new Emp(empno, ecard, password, ename, esex, eage, sal);
				list.add(e);
			}
			util.closeConnection(ps, conn, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	// 根据员工编号查询员工
	public List<Emp> queryempByno(int no) {
		List<Emp> list = new ArrayList<Emp>();
		try {
			Connection conn = util.getConnection();
			String sql = "select * from emp where empno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			Emp e = null;
			while (rs.next()) {
				int empno = rs.getInt("empno");
				String password = rs.getString("epassword");
				String esex = rs.getString("esex");
				String ename = rs.getString("ename");
				int eage = rs.getInt("eage");
				double sal = rs.getDouble("esal");
				String ecard = rs.getString("ecard");

				// emp表-->Employee对象
				e = new Emp(empno, ecard, password, ename, esex, eage, sal);
				list.add(e);
			}
			util.closeConnection(ps, conn, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 通过员工姓名查询员工
	public List<Emp> queryempByname(String str) {
		List<Emp> list = new ArrayList<Emp>();
		try {
			Connection conn = util.getConnection();
			String sql = "select * from emp where ename=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, str);
			ResultSet rs = ps.executeQuery();
			Emp e = null;
			while (rs.next()) {
				int empno = rs.getInt("empno");
				String password = rs.getString("epassword");
				String esex = rs.getString("esex");
				String ename = rs.getString("ename");
				int eage = rs.getInt("eage");
				double sal = rs.getDouble("esal");
				String ecard = rs.getString("ecard");

				// emp表-->Employee对象
				e = new Emp(empno, ecard, password, ename, esex, eage, sal);
				list.add(e);
			}
			util.closeConnection(ps, conn, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 增加员工
	public boolean AddEmp(String name, String sex, int age, double sal, String card) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = " insert into emp values(emp_seq.nextval,?,666666,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, card);
			ps.setString(2, name);
			ps.setString(3, sex);
			ps.setInt(4, age);
			ps.setDouble(5, sal);
			int i = ps.executeUpdate();
			if (i >= 1) {
				flag = true;
			}
			
			util.closeConnection(ps, conn,null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}


	/**
	 * 更新员工信息
	 */
	public boolean updateEmp(int empno, String ename, String sex, int age, double sal,String card) {

		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = "update emp set ename=?,esex=?,eage=?,esal=?,ecard=? where empno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, ename);
			ps.setString(2, sex);
			ps.setInt(3, age);
			ps.setDouble(4, sal);
			ps.setString(5, card);
			ps.setInt(6, empno);

			int n = 0;
			n = ps.executeUpdate();
			if (n == 1) {

				flag = true;
			}

			ps.close();
			conn.close();

		} catch (Exception e) {
			// TODO: handle exception
		}
		return flag;
	}

	// 通过员工编号删除员工
	public boolean deleteemp(int empno) {
		boolean flag = false;

		try {
			Connection conn = util.getConnection();
			String sql = "delete  from emp where empno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, empno);
			int rs = ps.executeUpdate();
			if (rs == 1) {
				flag = true;
			}
			ps.close();
			conn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}

		return flag;
	}

	//通过员工号查询员工
	public Emp queryemp(int empno) {
		Emp emp = null;
		try {
			Connection conn = util.getConnection();
			String sql = "select * from emp where empno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, empno);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				String password = rs.getString("epassword");
				String esex = rs.getString("esex");
				String ename = rs.getString("ename");
				int eage = rs.getInt("eage");
				double sal = rs.getDouble("esal");
				String ecard = rs.getString("ecard");

				// emp表-->Employee对象
				emp = new Emp(empno, ecard, password, ename, esex, eage, sal);
			}
			rs.close();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return emp;
	}

	/**
	 * 通过身份证号查询员工
	 */
	public Emp queryempByename(String card) {
		Emp emp = null;
		try {
			Connection conn = util.getConnection();
			String sql = "select * from emp where ecard=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, card);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				int empno = rs.getInt("empno");
				String password = rs.getString("epassword");
				String esex = rs.getString("esex");
				String ename = rs.getString("ename");
				int eage = rs.getInt("eage");
				double sal = rs.getDouble("esal");

				// emp表-->Employee对象
				emp = new Emp(empno, card, password, ename, esex, eage, sal);
			}
			util.closeConnection(ps, conn, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return emp;
	}
	
	

	/**
	 * 查询所有房间
	 */
	public List<Room> QueryAllRoom() {
		
		List<Room> list = new ArrayList<Room>();
		try {
			Connection conn = util.getConnection();
			String sql = "select * from room order by rmno asc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				
				String rmbook = rs.getString("rmbook");
				String rmbuff = rs.getString("rmbuff");
				int rmno = rs.getInt("rmno");
				double rmprice = rs.getDouble("rmprice");
				String rmtype= rs.getString("rmtype");
				String rydate = rs.getString("rydate");
				double vprice = rs.getDouble("vprice");
				
				Room r = new Room(rmno, rmtype, rmprice, vprice, rmbuff, rmbook, rydate);
				list.add(r);
			}
			
			util.closeConnection(ps, conn, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}


	/**
	 * 通过房间号查询房间
	 */
	public List<Room> queryRoomByNo(int no) {
		List<Room> list = new ArrayList<Room>();
		try {
			Connection conn = util.getConnection();
			String sql = "select * from room where rmno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1,no);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				
				String rmbook = rs.getString("rmbook");
				String rmbuff = rs.getString("rmbuff");
				int rmno = rs.getInt("rmno");
				double rmprice = rs.getDouble("rmprice");
				String rmtype= rs.getString("rmtype");
				String rydate = rs.getString("rydate");
				double vprice = rs.getDouble("vprice");
				
				Room r = new Room(rmno, rmtype, rmprice, vprice, rmbuff, rmbook, rydate);
				list.add(r);
			}
			
			util.closeConnection(ps, conn, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}
	/**
	 * 通过房间类型查询房间
	 */
	public List<Room> queryRoomByName(String str) {
		List<Room> list = new ArrayList<Room>();
		try {
			Connection conn = util.getConnection();
			String sql = "select * from room where rmtype=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1,str);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				
				String rmbook = rs.getString("rmbook");
				String rmbuff = rs.getString("rmbuff");
				int rmno = rs.getInt("rmno");
				double rmprice = rs.getDouble("rmprice");
				String rmtype= rs.getString("rmtype");
				String rydate = rs.getString("rydate");
				double vprice = rs.getDouble("vprice");
				
				Room r = new Room(rmno, rmtype, rmprice, vprice, rmbuff, rmbook, rydate);
				list.add(r);
			}
			
			util.closeConnection(ps, conn, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	
	/**
	 * 通过房间号删除房间
	 */
	public boolean deleteRoom(int rmno) {
		boolean flag = false;

		try {
			Connection conn = util.getConnection();
			String sql = "delete  from room where rmno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, rmno);
			int rs = ps.executeUpdate();
			if (rs == 1) {
				flag = true;
			}
			ps.close();
			conn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}

		return flag;
	}


	//更新房间信息
	public boolean updateRoom(int rmno, String type, double price, double vprice) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = "update room set rmtype=?,rmprice=?,vprice=? where rmno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, type);
			ps.setDouble(2, price);
			ps.setDouble(3, vprice);
			ps.setInt(4, rmno);
			int n = ps.executeUpdate();
			if (n == 1) {
				flag = true;
			}

			util.closeConnection(ps, conn, null);;

		} catch (Exception e) {
			// TODO: handle exception
		}
		return flag;
	}

	/**
	 * 更新管理员密码
	 */
	public boolean updatePwd(String mname, String md5) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = "update manager set mpassword=? where mname=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,md5);
			ps.setString(2,mname);
			int n = ps.executeUpdate();
			if (n == 1) {

				flag = true;
			}

			ps.close();
			conn.close();

		} catch (Exception e) {
			// TODO: handle exception
		}
		return flag;
	}


	/**
	 * 增加房间信息
	 */
	public boolean addRoom(String type, double price, double vprice) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = " insert into room values(room_seq.nextval,?,?,?,'无人','无人预订',null)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, type);
			ps.setDouble(2, price);
			ps.setDouble(3, vprice);
			int i = ps.executeUpdate();
			if (i >= 1) {
				flag = true;
			}

			util.closeConnection(ps, conn, null);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	/**
	 * 查询所有菜单
	 */
	public List<Menus> MenusList() {
		List<Menus> list = new ArrayList<Menus>();
		try {
			Connection conn = util.getConnection();
			String sql = "select * from menus";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Menus m = new Menus();
				m.setMno(rs.getInt("mno"));
				m.setMsname(rs.getString("msname"));
				m.setMimg(rs.getString("mimg"));
				m.setMsale(rs.getDouble("msale"));
				m.setMsfee(rs.getDouble("msfee"));
				m.setMtype(rs.getString("mtype"));
				m.setMvfee(rs.getDouble("mvfee"));
				list.add(m);
			}
			//关闭连接
			util.closeConnection(ps, conn, rs);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;

	}

	/**
	 * 删除菜单
	 */
	public boolean deleteMenus(int mno) {
		boolean flag = false;

		try {
			Connection conn = util.getConnection();
			String sql = "delete  from menus where mno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, mno);
			int rs = ps.executeUpdate();
			if (rs == 1) {
				flag = true;
			}
			ps.close();
			conn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}

		return flag;
	}

	/**
	 * 查询菜单通过菜系
	 */
	public List<Menus> queryMenusByType(String type) {
		List<Menus> list = new ArrayList<Menus>();
		try {
			Connection conn = util.getConnection();
			String sql = "select * from menus where mtype=? order by msale asc ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,type);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Menus m = new Menus();

				m.setMimg(rs.getString("mimg"));
				m.setMno(rs.getInt("mno"));
				m.setMsale(rs.getDouble("msale"));
				m.setMsfee(rs.getDouble("msfee"));
				m.setMsname(rs.getString("msname"));
				m.setMtype(rs.getString("mtype"));
				m.setMvfee(rs.getDouble("mvfee"));

				list.add(m);
			}
			util.closeConnection(ps, conn, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	//通过菜名查询菜单
	public List<Menus> queryMenusByString(String str) {
		List<Menus> list = new ArrayList<Menus>();
		try {
			Connection conn = util.getConnection();
			String sql = "select * from menus where msname=? order by msale asc ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,str);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Menus m = new Menus();

				m.setMimg(rs.getString("mimg"));
				m.setMno(rs.getInt("mno"));
				m.setMsale(rs.getDouble("msale"));
				m.setMsfee(rs.getDouble("msfee"));
				m.setMsname(rs.getString("msname"));
				m.setMtype(rs.getString("mtype"));
				m.setMvfee(rs.getDouble("mvfee"));

				list.add(m);
			}
			util.closeConnection(ps, conn, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	//增加菜单
	public boolean addMenus(String address, String mname, String type, double price, double vprice) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = "insert into menus values(menus_seq.nextval,?,?,?,?,?,0)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,mname);
			ps.setString(2, address);
			ps.setString(3,type);
			ps.setDouble(4,price);
			ps.setDouble(5,vprice);
			int i = ps.executeUpdate();
			if(i>=1){
				flag =  true;
			}
			util.closeConnection(ps,conn, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	}
           return flag;
	}

	
	
	
	
//	
	//public static void main(String[] args) {
		
	//	System.out.println((new ManagerDaoimpl().QueryAllRoom()).size());
	//}

}
