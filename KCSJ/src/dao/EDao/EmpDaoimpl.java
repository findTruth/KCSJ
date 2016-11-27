package dao.EDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Emp;
import entity.Manager;
import entity.Room;
import util.util;

public class EmpDaoimpl implements EmpDao {

	public Emp queryEmp(String name) {
		Emp emp = null;
		try {
			Connection conn = util.getConnection();
			String sql = "select * from emp where ename=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				emp = new Emp();
				emp.setEage(rs.getInt("eage"));
				emp.setEmpno(rs.getInt("empno"));
				emp.setEname(rs.getString("ename"));
				emp.setEpassword(rs.getString("epassword"));
				emp.setEsal(rs.getDouble("esal"));
				emp.setEsex(rs.getString("esex"));
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

	// 通过身份证查询员工
	public Emp queryEmpByCard(String card) {
		Emp emp = null;
		try {
			Connection conn = util.getConnection();
			String sql = "select * from emp where ecard=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, card);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				emp = new Emp();
				emp.setEage(rs.getInt("eage"));
				emp.setEmpno(rs.getInt("empno"));
				emp.setEname(rs.getString("ename"));
				emp.setEpassword(rs.getString("epassword"));
				emp.setEsal(rs.getDouble("esal"));
				emp.setEsex(rs.getString("esex"));
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

	// 通过身份证修改员工密码
	public boolean changePwd(String md5Pwd, String card) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = "update emp set epassword=?  where ecard=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, md5Pwd);
			ps.setString(2, card);
			int n = ps.executeUpdate();
			if (n >= 1) {
				flag = true;
			}
			util.closeConnection(ps, conn, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	
	/**
	 * 查询所有房间
	 * @return
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
	 * 查询所有空房间通过房间类型
	 */
	public List<Room> QueryAllRoomNullBytype(String type) {
		List<Room> list = new ArrayList<Room>();
		try {
			Connection conn = util.getConnection();
			
			
			
			String sql = "select * from room where rmtype=? and rmbuff='无人' and rmbook='无人预订'  order by rmno asc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,type);
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
	//查询所有空房间
	public List<Room> QueryAllNullRoom() {
		List<Room> list = new ArrayList<Room>();
		try {
			Connection conn = util.getConnection();
			String sql = "select * from room where rmbuff='无人' and rmbook='无人预订' order by rmno asc";
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


	//普通客户入住
	public boolean ClientRuZhu(String name, String card, long tel,int rmno) {
		boolean flag = false;
		
		try {
			Connection conn = util.getConnection();
			String sql =" insert into client(cid,cname,ccard,ctel,rmno,cmfee,cdate) values(client_seq.nextval,?,?,?,?,0,to_char(sysdate,'yyyy-MM-dd HH24:mi:ss'))";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,name);
			ps.setString(2,card);
			ps.setLong(3,tel);
			ps.setInt(4,rmno);
			int i = ps.executeUpdate();
			if(i>=1){
				flag =  true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
             return flag;
	}

	//顾客入住后更新房间状态
	public boolean updateRoomRuZhu(int rmno) {
		boolean flag = false;
		try{
		Connection conn = util.getConnection();
		String sql = "update room set rmbuff='有人'  where rmno=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1,rmno);
		int n=ps.executeUpdate();
		if(n>=1){
			 flag=true;
		}
		util.closeConnection(ps, conn, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
         return flag;
	}

	/**
	 * 查询员工通过姓名
	 */
	public Emp querEmpByName(String ename) {
		Emp e = null;
		
		try {
			Connection conn = util.getConnection();
			String sql = "select * from emp where ename=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, ename);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int empno = rs.getInt("empno");
				String password = rs.getString("epassword");
				String esex = rs.getString("esex");
				int eage = rs.getInt("eage");
				double sal = rs.getDouble("esal");
				String ecard = rs.getString("ecard");

				// emp表-->Employee对象
				e = new Emp(empno, ecard, password, ename, esex, eage, sal);
			}
			util.closeConnection(ps, conn, rs);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return e;

	}

	//更新员工密码
	public boolean updateEmpPwd(String ename,String newpwd) {
		boolean flag = false;
		try{
		Connection conn = util.getConnection();
		String sql = "update emp set epassword=?  where ename=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1,newpwd);
		ps.setString(2,ename);
		int n=ps.executeUpdate();
		if(n>=1){
			 flag=true;
		}
		util.closeConnection(ps, conn, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
         return flag;
	}

	/**
	 * 通过会员编号查询会员
	 */
	public void QueryVipByVno(int vno) {
		// TODO Auto-generated method stub
		
	}

	
	
}
