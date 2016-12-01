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
import entity.Manager;
import entity.Room;
import entity.Vip;
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
	
	//查询所有预定的
	
	public List<Room> QueryAllYuDing(){
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
	//退订
	public boolean tuiding(int rmno){
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql ="update room set rmbook='无人预订' where rmno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,rmno);
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
	//退订 删除客户信息
	public boolean deleteClient(int rmno){
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql ="delete from client where rmno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,rmno);
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
	//预定入住跟新client的时间
	public boolean yudingruzhu(int rmno){
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
		
			Date nowTime=new Date(); 
			SimpleDateFormat time=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); 
			String t = time.format(nowTime);
			String sql ="update client set cdate=? where rmno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, t);
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
	//预定入住跟新房间的入住时间
	public boolean roomyudingruzhu(int rmno){
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			Date nowTime=new Date(); 
			SimpleDateFormat time=new SimpleDateFormat("yyyy/MM/dd/ HH:mm:ss"); 
			String t = time.format(nowTime);
			String sql ="update room set rydate=? where rmno=?";
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
	//预定入住后 更新房间的信息 预定改为无人预定 设置入住为 有人
	public boolean updateroomyudingruzhu(int rmno){
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql ="update room set rmbook='无人预订',rmbuff='有人' where rmno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,rmno);
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
	
	//通过房间号查找客户信息
	public Client queryClientByRmno(int rmno){
		Client client = new Client();
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
				double cmfee = rs.getDouble("cmfee") ;
			   String cdate = rs.getString("cdate");
			   
			    client = new Client(cname, ccard, ctel, rmno, cmfee, cdate);
			
			  }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return client;
		
	}
	//通过房间号查找房间类型
	public String queryRoomTypeByRmno(int rmno){
		String type = null;
		try {
			Connection conn = util.getConnection();
			String sql = "select rmtype from room where rmno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, rmno);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				type = rs.getString("rmtype");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return type;
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
			String sql ="insert into client(cid,cname,ccard,ctel,rmno,cmfee,cdate) values(client_seq.nextval,?,?,?,?,0,to_char(sysdate,'yyyy-MM-dd HH24:mi:ss'))";
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
		String sql = "update room set rmbuff='有人' where rmno=?";
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
	
	//预定不加时间
	public boolean ClientYuDing(String name, String card, long tel,int rmno) {
		boolean flag = false;
		
		try {
			Connection conn = util.getConnection();
			String sql =" insert into client(cid,cname,ccard,ctel,rmno) values(client_seq.nextval,?,?,?,?)";
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
	public boolean updateRoomYuDing(int rmno) {
		boolean flag = false;
		try{
		Connection conn = util.getConnection();
		String sql = "update room set rmbook='已预订' where rmno=?";
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
	//预定记录
	public boolean yudingHistory(String vname, String vcard, long tel, 
		int rmno, String rmtype, String newtime,String shijian){
		boolean flag = false;
		try {
			Connection conn = util.getConnection();
			String sql ="insert into history  values(his_seq.nextval,?,?,?,?,?,?,'无','无','无',0,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,vname);
			ps.setString(2,vcard);
			ps.setLong(3,tel);
			ps.setInt(4,rmno);
			ps.setString(5,rmtype);
			ps.setString(6,newtime);
			ps.setString(7,shijian);
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
	//客户退订后增加记录
		public boolean addTuiDinghistory(String name, String card, 
				long tel, int rmno, String type, String newtime,
				String shijian) {
			boolean flag = false;
			try {
				Connection conn = util.getConnection();
				String sql =" insert into history  values(his_seq.nextval,?,?,?,?,?,'空',?,'无','无',0,?)";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1,name);
				ps.setString(2,card);
				ps.setLong(3,tel);
				ps.setInt(4,rmno);
				ps.setString(5,type);
				ps.setString(6,newtime);
				ps.setString(7,shijian);
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
	//预定入住后添加纪录
		public boolean addRuZhuhistory(String name, String card, long tel,
				int rmno, String type, String newtime,
				String shijian) {
			boolean flag = false;
			try {
				Connection conn = util.getConnection();
				String sql =" insert into history  values(his_seq.nextval,?,?,?,?,?,'空','空',?,'无',0,?)";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1,name);
				ps.setString(2,card);
				ps.setLong(3,tel);
				ps.setInt(4,rmno);
				ps.setString(5,type);
				ps.setString(6,newtime);
				ps.setString(7,shijian);
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
		}catch (Exception e) {
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
	//会员预定判定
	public Vip QueryVipByVno2(int vno){
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
}
