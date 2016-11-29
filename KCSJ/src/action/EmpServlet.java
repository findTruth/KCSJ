package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import biz.EBiz.EmpBiz;
import biz.EBiz.EmpBizImpl;
import biz.MBiz.ManagerBiz;
import biz.MBiz.ManagerBizImpl;
import entity.Room;
import javabean.ClientBean;
import javabean.VipBean;

@WebServlet("/Emp/*")
public class EmpServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");

		request.setCharacterEncoding("utf-8");// 设置request解码
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();

		String url = request.getRequestURI();

		String path = url.substring(url.lastIndexOf("/"), url.lastIndexOf("."));

		EmpBiz biz = new EmpBizImpl();

		if ("/login".equals(path)) {


			String name = request.getParameter("name");

			String pwd = request.getParameter("pwd");

			// 获取用户输入验证码
			String code = request.getParameter("code");

			// 先从session中获取正确验证码
			
			String checkCode = (String) session.getAttribute("right_checkCode");

			String panduan = biz.queryEmp(name, pwd, code, checkCode);

			if (!panduan.equals("验证码错误")) {

				if ("正确".equals(panduan)) {
					
					//登录成功后将员工名字和密码存入session
					session.setAttribute("ename", name);
					session.setAttribute("epwd", pwd);
					out.print("{\"result\":\"5\"}");
					
				} else if ("错误".equals(panduan)) {
					out.print("{\"result\":\"0\"}");
				} else {
					out.print("{\"result\":\"1\"}");
				}
			} else {
				out.print("{\"result\":\"2\"}");
			}
		} else if ("/password".equals(path)) {


			String card = request.getParameter("card");

			String password = request.getParameter("password");

			String str = biz.changePwd(card, password);

			if (str.equals("您输入的身份证有误，请重试")) {
				request.setAttribute("msg", "您输入的身份证有误，请重试");
				request.getRequestDispatcher("../Login/Emppassword.jsp").forward(request, response);

			} else if (str.equals("成功")) {
				response.sendRedirect("../Login/EmpLogin.jsp");

			} else {
				request.setAttribute("msg", "出错了");
				request.getRequestDispatcher("../Login/Emppassword.jsp").forward(request, response);
			}
			
		 //散客确认入住
		} else if ("/RuZhu".equals(path)) {

			String name = request.getParameter("name");

			String card = request.getParameter("card");

			long  tel = Long.valueOf(request.getParameter("tel"));

			int rmno = Integer.valueOf(request.getParameter("rmno"));

			boolean flag = biz.ClientRuZhu(name, card, tel,rmno);

			 if(flag){
			    //房间的入住状态
				 boolean flag1 = biz.updateRoomRuZhu(rmno);
				 if(flag1==true){
					 out.print("{\"result\":\"0\"}");
				 }
			 }else{
				 out.print("{\"result\":\"1\"}");
			 }

		}else if("/updatePwd".equals(path)){
			
			String oldpwd = request.getParameter("oldpwd");
			
			String newpwd = request.getParameter("newpwd");
			
			String ename = (String) session.getAttribute("ename");
			
			String str = biz.updateEmpPwd(oldpwd,newpwd,ename);
			
			if(str.equals("密码错误")){
				
				out.print("{\"result\":\"0\"}");
				
			}else if(str.equals("成功修改")){ 
				
				out.print("{\"result\":\"1\"}");
			}else{
				
				out.print("{\"result\":\"2\"}");
			}
			
			
		}else if("/VipRuZhu".equals(path)){
			int vno = Integer.valueOf(request.getParameter("vno"));
			
			String vcard = request.getParameter("vcard");
			
			int rmno = Integer.valueOf(request.getParameter("rmno"));
			
			String s = biz.VipRuZhu(vno,vcard,rmno);
			
			if(s.equals("信息有误")){
				
				out.print("{\"result\":\"0\"}");
			}else if(s.equals("ok")){
				out.print("{\"result\":\"1\"}");
			}else if(s.equals("erro")){
				out.print("{\"result\":\"2\"}");
			}else{
				out.print("{\"result\":\"3\"}");
			}
			
		}else if("/ClientLeave".equals(path)){
			
			int rmno = Integer.valueOf(request.getParameter("sousuo"));
			
			
			//查询普通客户的入住信息
			List<ClientBean> list = biz.queryClient_Leave(rmno);
			
			List<VipBean> listVip = biz.queryVip_Leave(rmno);
			
            Gson json = new Gson();
            
            if(list.size()==1){
            	out.print(json.toJson(list));
            }else if(listVip.size()==1){
            	out.print(json.toJson(listVip));
            	
            }else{
            	out.print(json.toJson(null));
            	
            }
			
		}

	}
	
	
}
