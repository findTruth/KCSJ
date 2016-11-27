package biz.EBiz;

import java.util.List;

import entity.Emp;
import entity.Room;
import entity.Vip;

public interface EmpBiz {
	
	//员工登录时查询

	String queryEmp(String name, String pwd, String code, String checkCode);

	String changePwd(String card, String password);

	List<Room> QueryAllRoom();

	List<Room> QueryAllRoomNullBytype(String type);

	boolean ClientRuZhu(String name, String card, long tel,int rmno);

	List<Room> QueryAllNullRoom();

	boolean updateRoomRuZhu(int rmno);

	String updateEmpPwd(String oldpwd, String newpwd, String ename);

	String VipRuZhu(int vno, String vcard, int rmno);
	
	Vip QueryVipByVno(int vno);
	
}
