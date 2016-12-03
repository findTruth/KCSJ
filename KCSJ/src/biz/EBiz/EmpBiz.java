package biz.EBiz;

import java.util.List;

import entity.Client;
import entity.Emp;
import entity.History;
import entity.Room;
import entity.Vip;
import javabean.ClientBean;
import javabean.VipBean;

public interface EmpBiz {
	
	//员工登录时查询

	String queryEmp(String name, String pwd, String code, String checkCode);

	String changePwd(String card, String password);

	List<Room> QueryAllRoom();

	List<Room> QueryAllRoomNullBytype(String type);
	
	boolean updateroomyudingruzhu(int rmno);
    
	boolean yudingruzhu(int rmno);
	
	boolean roomyudingruzhu(int rmno);
	
	boolean ClientYuDing(String name, String card, long tel,int rmno);
	
	boolean ClientRuZhu(String name, String card, long tel,int rmno);
	
	boolean yudingHistory(String vname, String vcard, long tel, 
			int rmno, String rmtype, String newtime,String shijian);
	
	boolean addRuZhuhistory(String name, String card, long tel,
			int rmno, String type, String newtime,
			String shijian);
	
	boolean addTuiDinghistory(String name, String card, 
			long tel, int rmno, String type, String newtime,
			String shijian);
	
	Client queryClientByRmno(int rmno);
	
	 String queryRoomTypeByRmno(int rmno);
    
	List<Room> QueryAllNullRoom();
	
	List<Room> QueryAllYuDing();
	
	boolean updateRoomYuDing(int rmno);

	boolean tuiding(int rmno);
	
	boolean deleteClient(int rmno);
	
	boolean updateRoomRuZhu(int rmno);

	String updateEmpPwd(String oldpwd, String newpwd, String ename);

	String VipRuZhu(int vno, String vcard, int rmno);
	
	Vip QueryVipByVno(int vno);

	List<ClientBean> queryClient_Leave(int rmno);

	List<VipBean> queryVip_Leave(int rmno);

	String VipLeave(int vno, int rmno, double mfee, double allfee, String card, String name, long tel, String type,
			String time);

	String ClientLeave(int rmno, double mfee, double allfee, String card, String name, long tel, String type,
			String time);

	List<History> queryAllHistory();

	List<History> QueryHistoryByType(String type);

	List<History> QueryHistoryByRmno(int rmno);
	
}
