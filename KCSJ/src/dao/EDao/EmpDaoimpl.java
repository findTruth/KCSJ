package dao.EDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import entity.Client;
import entity.Emp;
import entity.History;
import entity.Manager;
import entity.Menus;
import entity.Room;
import entity.Vip;
import javabean.ClientBean;
import javabean.VipBean;
import util.util;

public class EmpDaoimpl implements EmpDao {
	Date nowTime = new Date();
	SimpleDateFormat time = new SimpleDateFormat("yyyy/MM/dd/ HH:mm:ss");
	String t = time.format(nowTime);
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
	//会员预定修改会员表
	public boolean updateVipMession(int vno,int rmno){
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = "update vip set rmno=? where vno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, rmno);
			ps.setInt(2, vno);
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
			String sql = "update emp set epassword=? where ecard=?";
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

	// 查询所有预定的

	public List<Room> QueryAllYuDing() {
		List<Room> list = new ArrayList<Room>();
		try {
			Connection conn = util.getConnection();
			String sql = "select * from room where rmbook='已预订' order by rmno asc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String rmbook = rs.getString("rmbook");
				String rmbuff = rs.getString("rmbuff");
				int rmno = rs.getInt("rmno");
				double rmprice = rs.getDouble("rmprice");
				String rmtype = rs.getString("rmtype");
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

	// 退订
	public boolean tuiding(int rmno) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = "update room set rmbook='无人预订' where rmno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, rmno);
			int i = ps.executeUpdate();
			if (i >= 1) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	
	//更新会员时间
	public  boolean updateVipTime(int rmno){
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
		
			Date nowTime=new Date(); 
			SimpleDateFormat time=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); 
			String t = time.format(nowTime);
			String sql ="update vip set vdate=? where rmno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,t);
			ps.setInt(2,rmno);
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

	// 退订 删除客户信息
	public boolean deleteClient(int rmno) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = "delete from client where rmno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, rmno);
			int i = ps.executeUpdate();
			if (i >= 1) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	// 预定入住跟新client的时间
	public boolean yudingruzhu(int rmno) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();

			Date nowTime = new Date();
			SimpleDateFormat time = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			String t = time.format(nowTime);
			String sql = "update client set cdate=? where rmno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, t);
			ps.setInt(2, rmno);
			int i = ps.executeUpdate();
			if (i >= 1) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}

	// 预定入住跟新房间的入住时间
	public boolean roomyudingruzhu(int rmno) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			Date nowTime = new Date();
			SimpleDateFormat time = new SimpleDateFormat("yyyy/MM/dd/ HH:mm:ss");
			String t = time.format(nowTime);
			String sql = "update room set rydate=? where rmno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, t);
			ps.setInt(2, rmno);
			int i = ps.executeUpdate();
			if (i >= 1) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}

	// 预定入住后 更新房间的信息 预定改为无人预定 设置入住为 有人
	public boolean updateroomyudingruzhu(int rmno) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = "update room set rmbook='无人预订',rmbuff='有人' where rmno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, rmno);
			int i = ps.executeUpdate();
			if (i >= 1) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	/**
	 * 查询所有房间
	 * 
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
				String rmtype = rs.getString("rmtype");
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
			ps.setString(1, type);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				String rmbook = rs.getString("rmbook");
				String rmbuff = rs.getString("rmbuff");
				int rmno = rs.getInt("rmno");
				double rmprice = rs.getDouble("rmprice");
				String rmtype = rs.getString("rmtype");
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

	// 通过房间状态查询房间
	public List<Room> QueryAllRoomByRmbuff() {
		List<Room> list = new ArrayList<Room>();
		try {
			Connection conn = util.getConnection();
			String sql = "select * from room where rmbuff='有人' or rmbook='已预订' order by rmno asc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int rmno = rs.getInt("rmno");
				String rmbuff = rs.getString("rmbuff");
				String rmbook = rs.getString("rmbook");
				String rmtype = rs.getString("rmtype");
				double rmprice = rs.getDouble("rmprice");
				double vprice = rs.getDouble("vprice");
				String rydate = rs.getString("rydate");
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
	//通过card找vip
		public String queryVipByCard(String card){
			String card2 = null;
			try {
				Connection conn = util.getConnection();
				String sql = "select * from vip where vcard=?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1,card);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
				 card2 = rs.getString("vcard");
			}
				util.closeConnection(ps, conn, rs);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return card2;
		}
	
	//通过房间号查找客户信息
	public Client queryClientByRmno(int rmno){
		Client client = null;
		try {
			Connection conn = util.getConnection();
			String sql = "select * from client where rmno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, rmno);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String cname = rs.getString("cname");
				String ccard = rs.getString("ccard");
				long ctel = rs.getLong("ctel");
				double cmfee = rs.getDouble("cmfee");
				client = new Client(cname, ccard, ctel, rmno, cmfee, t);
			}
			util.closeConnection(ps, conn, rs);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return client;

	}

	// 通过房间号查找房间类型
	public String queryRoomTypeByRmno(int rmno) {
		String type = null;
		try {
			Connection conn = util.getConnection();
			String sql = "select rmtype from room where rmno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, rmno);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				type = rs.getString("rmtype");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return type;
	}

	// 查询所有空房间

	// 查询所有空房间
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
				String rmtype = rs.getString("rmtype");
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

	// 普通客户入住
	public boolean ClientRuZhu(String name, String card, long tel, int rmno) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = "insert into client(cid,cname,ccard,ctel,rmno,cmfee,cdate) values(client_seq.nextval,?,?,?,?,0,to_char(sysdate,'yyyy-MM-dd HH24:mi:ss'))";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, card);
			ps.setLong(3, tel);
			ps.setInt(4, rmno);
			int i = ps.executeUpdate();
			if (i >= 1) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	// 顾客入住后更新房间状态
	public boolean updateRoomRuZhu(int rmno) {
		boolean flag = false;

		try {
			Connection conn = util.getConnection();
			String sql = "update room set rmbuff='有人' where rmno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, rmno);
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

	// 预定不加时间
	public boolean ClientYuDing(String name, String card, long tel, int rmno) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = " insert into client(cid,cname,ccard,ctel,rmno,cmfee,cdate) values(client_seq.nextval,?,?,?,?,0,null)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, card);
			ps.setLong(3, tel);
			ps.setInt(4, rmno);
			int i = ps.executeUpdate();
			if (i >= 1) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	public boolean updateRoomYuDing(int rmno) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = "update room set rmbook='已预订' where rmno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, rmno);
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

	// 预定记录
	public boolean yudingHistory(String vname, String vcard, long tel, int rmno, String rmtype, String newtime,
			String shijian) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = "insert into history  values(his_seq.nextval,?,?,?,?,?,?,'无','无','无',0,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vname);
			ps.setString(2, vcard);
			ps.setLong(3, tel);
			ps.setInt(4, rmno);
			ps.setString(5, rmtype);
			ps.setString(6, newtime);
			ps.setString(7, shijian);
			int i = ps.executeUpdate();
			if (i >= 1) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	// 客户退订后增加记录
	public boolean addTuiDinghistory(String name, String card, long tel, int rmno, String type, String newtime,
			String shijian) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = " insert into history values(his_seq.nextval,?,?,?,?,?,'空',?,'无','无',0,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, card);
			ps.setLong(3, tel);
			ps.setInt(4, rmno);
			ps.setString(5, type);
			ps.setString(6, newtime);
			ps.setString(7, shijian);
			int i = ps.executeUpdate();
			if (i >= 1) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	// 预定入住后添加纪录（包括入住）
	public boolean addRuZhuhistory(String name, String card, long tel, int rmno, String type, String shijian) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = " insert into history  values(his_seq.nextval,?,?,?,?,?,'空','空',to_char(sysdate,'yyyy-MM-dd HH24:mi:ss'),'无',0,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, card);
			ps.setLong(3, tel);
			ps.setInt(4, rmno);
			ps.setString(5, type);
			ps.setString(6, shijian);
			int i = ps.executeUpdate();
			if (i >= 1) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	// 更新员工密码
	public boolean updateEmpPwd(String ename, String newpwd) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = "update emp set epassword=?  where ename=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newpwd);
			ps.setString(2, ename);
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
	 * 通过会员编号查询会员
	 */

	public Vip QueryVipByVno(int vno) {
		Vip v = null;
		try {
			Connection conn = util.getConnection();
			String sql = "select * from vip where vno=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, vno);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				v = new Vip();
				v.setVno(rs.getInt("vno"));
				v.setRmno(rs.getInt("rmno"));
				v.setVtel(rs.getLong("vtel"));
				v.setVcard(rs.getString("vcard"));
				v.setVdate(rs.getString("vdate"));
				v.setVfee(rs.getDouble("vfee"));
				v.setVname(rs.getString("vname"));
				v.setVno(rs.getInt("vno"));
			}
			// 关闭连接
			util.closeConnection(ps, conn, rs);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return v;

	}

	// 会员预定判定
	public Vip QueryVipByVno2(int vno) {
		Vip vip = new Vip();
		try {
			Connection conn = util.getConnection();
			String sql = "select * from Vip where vno=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, vno);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String vname = rs.getString("vname");
				String vcard = rs.getString("vcard");
				long vtel = rs.getLong("vtel");
				vip.setVname(vname);
				vip.setVcard(vcard);
				vip.setVtel(vtel);
			}
			util.closeConnection(ps, conn, rs);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return vip;
	}

	// 更新Vip入住的信息
	public boolean VipRuZhu(String vcard, int rmno) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = "update vip set vdate=to_char(sysdate,'yyyy/MM/dd HH24:mi:ss'),rmno=?  where vcard=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, rmno);
			ps.setString(2, vcard);
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
	 * 普通客户退房时查询信息
	 */
	public List<ClientBean> queryClientBy_Rmno(int rmno) {

		List<ClientBean> list = new ArrayList<ClientBean>();

		try {
			Connection conn = util.getConnection();
			String sql = "select * from room r,client c where c.rmno=r.rmno and r.rmno=? ";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, rmno);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Client c = new Client();
				Room r = new Room();
				r.setRmtype(rs.getString("rmtype"));
				r.setRmprice(Double.valueOf(rs.getDouble("rmprice")));
				r.setRydate(rs.getString("rydate"));
				r.setRmno(rmno);
				c.setCtel(rs.getLong("ctel"));
				c.setCname(rs.getString("cname"));
				c.setCcard(rs.getString("ccard"));
				c.setCmfee(rs.getDouble("cmfee"));
				c.setCdate(rs.getString("cdate"));
				ClientBean cb = new ClientBean(c, r, "client");
				list.add(cb);
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
	 * Vip退房时查询Vip用户的
	 */
	public List<VipBean> queryVipByRmno(int rmno) {
		List<VipBean> list = new ArrayList<VipBean>();

		try {
			Connection conn = util.getConnection();
			String sql = "select * from room r,vip v where v.rmno=r.rmno and r.rmno=? ";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, rmno);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Vip v = new Vip();
				Room r = new Room();
				r.setRmtype(rs.getString("rmtype"));
				r.setVprice(Double.valueOf(rs.getDouble("vprice")));
				r.setRmno(rmno);

				v.setVno(rs.getInt("vno"));
				v.setVcard(rs.getString("vcard"));
				v.setVdate(rs.getString("vdate"));
				v.setVfee(rs.getDouble("vfee"));
				v.setVname(rs.getString("vname"));
				v.setVtel(rs.getLong("vtel"));

				VipBean vb = new VipBean(v, r, "vip");
				list.add(vb);
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
	 * vip退房时更新信息
	 */
	public boolean updateVipLeave(int vno) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = "update vip set rmno=null,vfee=0,vdate='空'  where vno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, vno);
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
	 * 顾客退房后更新房间状态
	 */
	public boolean updateRoomLeave(int rmno) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = "update room set rmbuff='无人'  where rmno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, rmno);
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
	 * 更新顾客退房后的历史记录
	 */
	public boolean HistoryOfLeave(String name, String card, long tel, int rmno, String type, String time,
			double allfee) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = " insert into history  values(his_seq.nextval,?,?,?,?,?,'无','无',?,to_char(sysdate,'yyyy/MM/dd HH24:mi:ss'),?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, card);
			ps.setLong(3, tel);
			ps.setInt(4, rmno);
			ps.setString(5, type);
			ps.setString(6, time);
			ps.setDouble(7, allfee);
			ps.setString(8, "退房");
			int i = ps.executeUpdate();
			if (i >= 1) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	/**
	 * 普通客户退房时删除
	 */
	public boolean deleteClient(String name) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = "delete from client where  cname=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
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

	// 查询所有历史记录
	public List<History> queryAllHistory() {

		List<History> list = new ArrayList<History>();
		try {
			Connection conn = util.getConnection();
			String sql = "select * from history order by id asc ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				History h = new History();
				h.setId(rs.getInt("id"));
				h.setHyedate(rs.getString("hyedate"));
				h.setHydate(rs.getString("hydate"));
				h.setHtel(rs.getLong("htel"));
				h.setHshijian(rs.getString("hshijian"));
				h.setHrmno(rs.getInt("hrmno"));
				h.setHtype(rs.getString("htype"));
				h.setHname(rs.getString("hname"));
				h.setHedate(rs.getString("hedate"));
				h.setHdate(rs.getString("hdate"));
				h.setHcard(rs.getString("hcard"));
				h.setHallfee(rs.getDouble("hallfee"));
				list.add(h);
			}
			util.closeConnection(ps, conn, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	/**
	 * 通过房间类型查询历史记录
	 */
	public List<History> queryAllHistoryByType(String type) {
		List<History> list = new ArrayList<History>();
		try {
			Connection conn = util.getConnection();
			String sql = "select * from history where htype=? order by id asc ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, type);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				History h = new History();
				h.setId(rs.getInt("id"));
				h.setHyedate(rs.getString("hyedate"));
				h.setHydate(rs.getString("hydate"));
				h.setHtel(rs.getLong("htel"));
				h.setHshijian(rs.getString("hshijian"));
				h.setHrmno(rs.getInt("hrmno"));
				h.setHtype(rs.getString("htype"));
				h.setHname(rs.getString("hname"));
				h.setHedate(rs.getString("hedate"));
				h.setHdate(rs.getString("hdate"));
				h.setHcard(rs.getString("hcard"));
				h.setHallfee(rs.getDouble("hallfee"));
				list.add(h);
			}
			util.closeConnection(ps, conn, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 通过房间编号查询历史记录
	 */
	public List<History> QueryHistoryByRmno(int rmno) {
		List<History> list = new ArrayList<History>();
		try {
			Connection conn = util.getConnection();
			String sql = "select * from history where hrmno=? order by id asc ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, rmno);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				History h = new History();
				h.setId(rs.getInt("id"));
				h.setHyedate(rs.getString("hyedate"));
				h.setHydate(rs.getString("hydate"));
				h.setHtel(rs.getLong("htel"));
				h.setHshijian(rs.getString("hshijian"));
				h.setHrmno(rs.getInt("hrmno"));
				h.setHtype(rs.getString("htype"));
				h.setHname(rs.getString("hname"));
				h.setHedate(rs.getString("hedate"));
				h.setHdate(rs.getString("hdate"));
				h.setHcard(rs.getString("hcard"));
				h.setHallfee(rs.getDouble("hallfee"));
				list.add(h);
			}
			util.closeConnection(ps, conn, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 查询所有菜
	 */
	public List<Menus> queryAllMenus() {
		List<Menus> list = new ArrayList<Menus>();
		try {
			Connection conn = util.getConnection();
			String sql = "select * from menus  order by mno asc ";
			PreparedStatement ps = conn.prepareStatement(sql);
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

	// 点菜时查询VIp
	public Vip queryvipByrmno(int rmno) {
		Vip vip = null;
		try {
			Connection conn = util.getConnection();
			String sql = "select * from vip  where rmno=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,rmno);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				vip = new Vip();

				vip.setRmno(rmno);
				vip.setVcard(rs.getString("vcard"));
				vip.setVdate(rs.getString("vdate"));
			}
			util.closeConnection(ps, conn, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vip;
	}

	/**
	 * 更新普通顾客的点菜
	 */
	public boolean updateClientMenus(int rmno, double clientprice) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = "update client set cmfee=cmfee+?  where rmno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setDouble(1, clientprice);
			ps.setInt(2,rmno);
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
	 *更新vip的点菜 
	 */
	public boolean updateVipMenus(int rmno, double vipprice) {
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql = "update vip set vfee=vfee+?  where rmno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setDouble(1, vipprice);
			ps.setInt(2,rmno);
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
	
	//根据菜系查询菜
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


	/**
	 * 通过菜名查询菜单
	 */
	public List<Menus> queryMenusByName(String mname) {
		List<Menus> list = new ArrayList<Menus>();
		try {
			Connection conn = util.getConnection();
			String sql = "select * from menus where msname=?  ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,mname);
			
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
	
	
	
	
	
	public static void main(String[] args) {

		// EmpDaoimpl dao = new EmpDaoimpl();
		// int rmno = 102;
		//
		// List<VipBean> list = dao.queryVipByRmno(rmno);
		// System.out.println(list.get(0).getRoom().getVprice());

		// System.out.println(list.get(0).getRoom().getRmprice());

	}


}
