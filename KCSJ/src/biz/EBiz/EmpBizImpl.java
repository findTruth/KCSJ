package biz.EBiz;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;

import Tool.MD5;
import dao.EDao.EmpDao;
import dao.EDao.EmpDaoimpl;
import entity.Emp;
import entity.Manager;
import entity.Room;
import entity.Vip;

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

	/**
	 * 查询所有空房间通过房间类型
	 */
	public List<Room> QueryAllRoomNullBytype(String type) {
		return dao.QueryAllRoomNullBytype(type);
	}

	/**
	 * 普通客户入住
	 */
	public boolean ClientRuZhu(String name, String card, long tel,int rmno) {
		return dao.ClientRuZhu(name,card,tel,rmno);
	}

	/**
	 * 入住时查询所有可入住的房间
	 */
	public List<Room> QueryAllNullRoom() {
		return dao.QueryAllNullRoom();
	}

	

	//客户入住后更新房间状态
	public boolean updateRoomRuZhu(int rmno) {
		return dao.updateRoomRuZhu(rmno);
	}


	/**
	 * 员工修改个人密码
	 */
	public String updateEmpPwd(String oldpwd, String newpwd, String ename) {
		
	  Emp emp = dao.querEmpByName(ename);
	  
	  if(!emp.getEpassword().equals(MD5.MD5(oldpwd))){
		  return "密码错误";
	  }else{
		  //更新员工密码
		  boolean flag = dao.updateEmpPwd(ename,MD5.MD5(newpwd));
		  
		  if(flag==true){
			  
			  return "成功修改";
			  
		  }else{
			  
			  return "失败";
		  }
	  }
	}

	//通过会员编号查询会员
	private Vip QueryVipByVno(int vno) {
		
		dao.QueryVipByVno(vno);
		
	}
	@Override
	public String VipRuZhu(int vno, String vcard, int rmno) {
		
		Vip v = QueryVipByVno(vno);
		return null;
	}


	
}
