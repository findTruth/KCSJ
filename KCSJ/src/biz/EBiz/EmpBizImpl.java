package biz.EBiz;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;

import Tool.MD5;
import dao.EDao.EmpDao;
import dao.EDao.EmpDaoimpl;
import entity.Client;
import entity.Emp;
import entity.History;
import entity.Manager;
import entity.Menus;
import entity.Room;
import entity.Vip;
import javabean.ClientBean;
import javabean.VipBean;

//封装对业务的处理
public class EmpBizImpl implements EmpBiz {

	EmpDao dao = new EmpDaoimpl();

	public String queryEmp(String name, String pwd, String code, String checkCode) {

		Emp e = dao.queryEmp(name);

		// 加密后进行判断
		String Md5Pwd = MD5.MD5(pwd);

		if (code != null && code.equals(checkCode)) {
			if (e != null) {
				if (e.getEname().equals(name) && e.getEpassword().equals(Md5Pwd)) {
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

	// 通过身份证改密码
	public String changePwd(String card, String password) {
		Emp e = dao.queryEmpByCard(card);
		if (e == null) {
			return "您输入的身份证有误，请重试";
		} else {
			String Md5Pwd = MD5.MD5(password);
			boolean flag = dao.changePwd(Md5Pwd, card);
			if (flag) {
				return "成功";
			} else {
				return "出错了";
			}
		}
	}

	/**
	 * 查询所有房间
	 */
	public List<Room> QueryAllRoom() {

		return dao.QueryAllRoom();
	}

	public List<Room> QueryAllYuDing() {
		return dao.QueryAllYuDing();
	}

	/**
	 * 查询所有空房间通过房间类型
	 */
	public List<Room> QueryAllRoomNullBytype(String type) {
		return dao.QueryAllRoomNullBytype(type);
	}

	/**
	 * 普通客户入住
	 */
	public boolean ClientRuZhu(String name, String card, long tel, int rmno, String type) {
		if (dao.ClientRuZhu(name, card, tel, rmno) == true) {

			boolean flag = dao.addRuZhuhistory(name, card, tel, rmno, type, "入住");
			if (flag == true) {
				return true;

			} else {

				return false;
			}

		} else {
			return false;
		}
	}
	//通过card查找会员号
	public String queryVipByCard(String card){
		return dao.queryVipByCard(card);
	}

	/**
	 * 入住时查询所有可入住的房间
	 */
	public List<Room> QueryAllNullRoom() {
		return dao.QueryAllNullRoom();
	}
	//会员时间入住
	public boolean updateVipTime(int rmno){
		return dao.updateVipTime(rmno);
	}
	
	// 客户预定

	public boolean ClientYuDing(String name, String card, long tel, int rmno) {
		return dao.ClientYuDing(name, card, tel, rmno);
	}

	// 预定跟新表
	public boolean updateRoomYuDing(int rmno) {
		return dao.updateRoomYuDing(rmno);
	}

	// 客户入住后更新房间状态
	public boolean updateRoomRuZhu(int rmno) {
		return dao.updateRoomRuZhu(rmno);
	}

	public boolean tuiding(int rmno) {
		return dao.tuiding(rmno);
	}

	public boolean deleteClient(int rmno) {
		return dao.deleteClient(rmno);
	}

	public boolean yudingruzhu(int rmno) {
		return dao.yudingruzhu(rmno);
	}

	public boolean roomyudingruzhu(int rmno) {
		return dao.roomyudingruzhu(rmno);
	}

	public boolean updateroomyudingruzhu(int rmno) {
		return dao.updateroomyudingruzhu(rmno);
	}

	/**************/
	// 客户预定记录
	public boolean yudingHistory(String vname, String vcard, long tel, int rmno, String rmtype, String newtime,
			String shijian) {
		return dao.yudingHistory(vname, vcard, tel, rmno, rmtype, newtime, shijian);

	}

	// 通过房间号查找client;
	public Client queryClientByRmno(int rmno) {
		return dao.queryClientByRmno(rmno);
	}

	public String queryRoomTypeByRmno(int rmno) {
		return dao.queryRoomTypeByRmno(rmno);
	}

	// 退订
	public boolean addTuiDinghistory(String name, String card, long tel, int rmno, String type, String newtime,
			String shijian) {
		return dao.addTuiDinghistory(name, card, tel, rmno, type, newtime, shijian);
	}

	// 入住记录
	public boolean addRuZhuhistory(String name, String card, long tel, int rmno, String type, String shijian) {
		return dao.addRuZhuhistory(name, card, tel, rmno, type, shijian);
	}

	// 通过房间状态查询房间
	public List<Room> QueryAllRoomByRmbuff() {
		return dao.QueryAllRoomByRmbuff();
	}

	/**
	 * 员工修改个人密码
	 */
	public String updateEmpPwd(String oldpwd, String newpwd, String ename) {

		Emp emp = dao.querEmpByName(ename);

		if (!emp.getEpassword().equals(MD5.MD5(oldpwd))) {
			return "密码错误";
		} else {
			// 更新员工密码
			boolean flag = dao.updateEmpPwd(ename, MD5.MD5(newpwd));

			if (flag == true) {

				return "成功修改";

			} else {

				return "失败";
			}
		}
	}

	// 通过会员编号查询会员
	public Vip QueryVipByVno(int vno) {

		return dao.QueryVipByVno(vno);

	}
	public boolean updateVipMession(int vno,int rmno){
		return dao.updateVipMession(vno,rmno);
		
	}

	/**
	 * 会员入住时
	 */
	public String VipRuZhu(int vno, String vcard, int rmno, String type) {

		Vip v = QueryVipByVno(vno);

		System.out.println(v);
		if (v != null) {
			if (!v.getVcard().equals(vcard)) {

				return "信息有误";
			} else {

				// 更新vip的入住信息
				boolean flag = dao.VipRuZhu(vcard, rmno);

				if (flag == true) {

					// 更新房间信息
					boolean flag1 = dao.updateRoomRuZhu(rmno);

					if (flag1 == true) {

						dao.addRuZhuhistory(v.getVname(), v.getVcard(), v.getVtel(), rmno, type, "入住");

						return "ok";

					} else {
						return "erro";
					}

				} else {
					return "erro";
				}

			}
		} else {

			return "无此会员";

		}

	}

	/**
	 * 普通客户退房时查询退房信息
	 */
	public List<ClientBean> queryClient_Leave(int rmno) {

		// 通过房间号查询普通客户
		return dao.queryClientBy_Rmno(rmno);

	}

	/**
	 * vip客户退房时查询退房信息
	 */
	public List<VipBean> queryVip_Leave(int rmno) {
		return dao.queryVipByRmno(rmno);
	}

	/**
	 * vip退房，并修改vip的数据
	 */
	public String VipLeave(int vno, int rmno, double mfee, double allfee, String card, String name, long tel,
			String type, String time) {

		// 更新vip的内容
		if (dao.updateVipLeave(vno) == true) {

			// 更新退房后的房间状态
			if (dao.updateRoomLeave(rmno) == true) {

				// 更新退房的历史记录表
				if (dao.HistoryOfLeave(name, card, tel, rmno, type, time, allfee) == true) {

					return "success";
				} else {
					return "erro";
				}
			} else {

				return "erro";
			}

		} else {

			return "erro";

		}

	}

	/**
	 * 普通客户退房时的操作
	 */
	public String ClientLeave(int rmno, double mfee, double allfee, String card, String name, long tel, String type,
			String time) {
		if (dao.deleteClient(name) == true) {

			if (dao.updateRoomLeave(rmno) == true) {

				if (dao.HistoryOfLeave(name, card, tel, rmno, type, time, allfee)) {

					return "success";
				} else {
					return "erro";
				}

			} else {
				return "erro";
			}

		} else {
			return "erro";
		}
	}

	public Vip QueryVipByVno2(int vno) {
		return dao.QueryVipByVno2(vno);
	}

	/**
	 * 查询所有历史记录
	 */
	public List<History> queryAllHistory() {
		return dao.queryAllHistory();
	}

	/**
	 * 通过房间号查询历史记录
	 */
	public List<History> QueryHistoryByRmno(int rmno) {
		return dao.QueryHistoryByRmno(rmno);
	}

	/**
	 * 通过房间类型查询历史记录
	 */
	public List<History> QueryHistoryByType(String type) {
		if (type.equals("全部房间")) {
			return dao.queryAllHistory();
		} else {
			return dao.queryAllHistoryByType(type);
		}
	}

	/**
	 * 查询所有菜单
	 */
	public List<Menus> queryAllMenus() {
		return dao.queryAllMenus();
	}

	/**
	 * 通过房间号查询vip
	 */
	private Vip queryVipByRmno(int rmno) {
		return dao.queryvipByrmno(rmno);
	}

	// 客户点菜
	public String dianCan(double clientprice, double vipprice, int rmno) {

		Client client = queryClientByRmno(rmno);

		Vip vip = queryVipByRmno(rmno);

		if (client != null) {
			boolean flag = dao.updateClientMenus(rmno, clientprice);
			if (flag==true) {
				return "client";
			}else{
				return "erro";
			}

		} else if (vip != null) {
			boolean flag = dao.updateVipMenus(rmno,vipprice);
			if(flag==true){
				return "vip";
			}else{
				
				return "erro";
				
			}
		} else {

			return "erro";

		}

	}

	//根据菜系查询菜
	public List<Menus> queryMenusByType(String type) {
		return dao.queryMenusByType(type);
	}

	//根据菜名查询菜
	public List<Menus> queryMenusByName(String mname) {
		return dao.queryMenusByName(mname);
	}

}
