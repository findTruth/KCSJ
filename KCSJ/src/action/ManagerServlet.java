package action;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.google.gson.Gson;
import com.google.gson.JsonObject;

import Tool.picture;
import biz.MBiz.ManagerBiz;
import biz.MBiz.ManagerBizImpl;
import entity.Emp;
import entity.Menus;
import entity.Room;

/**
 * 管理员操作servlet
 */
@WebServlet("/Manager/*")
public class ManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 先从session中获取正确验证码

		HttpSession session = request.getSession();
		/**
		 * 设置编码
		 */
		response.setContentType("text/html;charset=utf-8");

		response.setCharacterEncoding("utf-8");

		request.setCharacterEncoding("utf-8");

		/**
		 * 对路径进行切割
		 */
		PrintWriter out = response.getWriter();

		String url = request.getRequestURI();

		String path = url.substring(url.lastIndexOf("/"), url.lastIndexOf("."));

		ManagerBiz biz = new ManagerBizImpl();

		if ("/login".equals(path)) {

			String name = request.getParameter("name");
			String pwd = request.getParameter("pwd");

			// 获取用户输入验证码
			String code = request.getParameter("code");

			String checkCode = (String) session.getAttribute("right_checkCode");

			String panduan = biz.querymanager(name, pwd, code, checkCode);

			if (!panduan.equals("验证码错误")) {

				if ("正确".equals(panduan)) {

					session.setAttribute("mname", name);

					session.setAttribute("pwd", pwd);

					out.print("{\"result\":\"5\"}");

				} else if ("错误".equals(panduan)) {
					out.print("{\"result\":\"0\",\"msg\":\"pwderro\"}");

				} else {
					out.print("{\"result\":\"1\"}");
				}
			} else {
				out.print("{\"result\":\"2\"}");
			}

		} else if ("/register".equals(path)) {

			request.setCharacterEncoding("utf-8");// 设置request解码

			String name = request.getParameter("name");
			String pwd = request.getParameter("pwd");
			String card = request.getParameter("card");

			// 获取用户输入验证码
			String code = request.getParameter("code");

			// 先从session中获取正确验证码

			String checkCode = (String) session.getAttribute("right_checkCode");

			String panduan = biz.AddManager(name, pwd, code, checkCode, card);

			if (!panduan.equals("验证码错误")) {

				if (panduan.equals("成功")) {

					response.sendRedirect("../Login/ManagerLogin.jsp");

				} else if (panduan.equals("失败")) {
					request.setAttribute("login_msg", "出错了");
					request.getRequestDispatcher("../Login/Register.jsp").forward(request, response);

				} else if (panduan.equals("已经存在")) {

					request.setAttribute("login_msg", "该用户名已存在");
					request.getRequestDispatcher("../Login/Register.jsp").forward(request, response);
				} else if (panduan.equals("该身份证已经被注册")) {
					request.setAttribute("login_msg", "该身份证用户已存在");
					request.getRequestDispatcher("../Login/Register.jsp").forward(request, response);

				} else {

				}

			} else {
				// 返回登录页面并给予提示
				request.setAttribute("code_msg", "验证码错误！");
				request.getRequestDispatcher("../Login/Register.jsp").forward(request, response);
			}

		} else if ("/queryEmp".equals(path)) {
			String str = request.getParameter("str");
			List<Emp> list = biz.QueryEmp(str);

			Gson roomjson = new Gson();

			out.print(roomjson.toJson(list));

		} else if ("/Emplist".equals(path)) {
			List<Emp> list = biz.queryall();
			request.setAttribute("Emplist", list);
			request.getRequestDispatcher("../ManagerJsp/queryEmp.jsp").forward(request, response);

		} else if ("/deleteEmp".equals(path)) {
			int empno = Integer.valueOf(request.getParameter("empno"));
			boolean flag = biz.deleteEmp(empno);
			if (flag) {
				response.sendRedirect("../Manager/Emplist.do");

			}

		} else if ("/addEmp".equals(path)) {

			String name = request.getParameter("ename");
			String sex = request.getParameter("esex");
			int age = Integer.valueOf(request.getParameter("eage"));
			double sal = Double.valueOf(request.getParameter("esal"));
			String card = request.getParameter("card");
			String flag = biz.AddEmp(name, sex, age, sal, card);
			if (flag.equals("success")) {
				out.print("{\"result\":\"0\"}");
			} else if (flag.equals("重复")) {
				out.print("{\"result\":\"1\"}");
			} else {
				out.print("{\"result\":\"2\"}");
			}
		}

		else if ("/updateEmp".equals(path)) {

			int empno = Integer.valueOf(request.getParameter("empno"));
			String ename = request.getParameter("ename");
			String sex = request.getParameter("esex");
			int age = Integer.valueOf(request.getParameter("eage"));
			double sal = Double.valueOf(request.getParameter("esal"));
			String card = request.getParameter("card");
			String flag = biz.updateEmp(empno, ename, sex, age, sal, card);
			if (flag.equals("success")) {
				out.print("{\"result\":\"0\"}");
			} else if (flag.equals("重复")) {
				out.print("{\"result\":\"1\"}");
			} else {

				out.print("{\"result\":\"2\"}");
			}

		} else if ("/Roomlist".equals(path)) {
			List<Room> list = biz.QueryAllRoom();
			if (list != null) {
				request.setAttribute("Roomlist", list);
				request.getRequestDispatcher("../ManagerJsp/queryRoom.jsp").forward(request, response);

			}

		} else if ("/queryRoom".equals(path)) {

			String name = request.getParameter("str");

			List<Room> list = biz.QueryRoom(name);

			Gson roomjson = new Gson();

			out.print(roomjson.toJson(list));

		}

		else if ("/deleteRoom".equals(path)) {

			int rmno = Integer.valueOf(request.getParameter("rmno"));

			boolean flag = biz.deleteRoom(rmno);

			if (flag) {

				response.sendRedirect("../Manager/Roomlist.do");

			}
		} else if ("/updateRoom".equals(path)) {

			int rmno = Integer.valueOf(request.getParameter("rmno"));

			String type = request.getParameter("type");

			double price = Double.valueOf(request.getParameter("price"));

			double vprice = Double.valueOf(request.getParameter("vprice"));

			boolean flag = biz.updateRoom(rmno, type, price, vprice);

			if (flag) {

				out.print("{\"result\":\"1\"}");

			}

		} else if ("/addRoom".equals(path)) {

			String type = request.getParameter("type");

			double price = Double.valueOf(request.getParameter("price"));

			double vprice = Double.valueOf(request.getParameter("vprice"));

			boolean flag = biz.addRoom(type, price, vprice);

			if (flag) {

				out.print("{\"result\":\"0\"}");

			} else {

				out.print("{\"result\":\"1\"}");
			}

		} else if ("/updatePwd".equals(path)) {

			// 用session保存的管理员的密码
			String pwd = (String) session.getAttribute("pwd");

			// 获得管理员的姓名
			String mname = (String) session.getAttribute("mname");
			String oldpwd = request.getParameter("oldpwd");
			String newpwd = request.getParameter("newpwd");
			String str = biz.updatePwd(mname, pwd, oldpwd, newpwd);
			if (str.equals("nosame")) {
				out.print("{\"result\":\"0\"}");
			} else if (str.equals("erro")) {
				out.print("{\"result\":\"1\"}");
			} else {
				out.print("{\"result\":\"2\"}");
			}
		} else if ("/MenusList".equals(path)) {

			List<Menus> list = biz.MenusList();

			if (list != null) {
				request.setAttribute("Menuslist", list);
				request.getRequestDispatcher("../ManagerJsp/ManagerMenus/queryMenus.jsp").forward(request, response);

			}

		}else if("/deleteMenus".equals(path)){
			
			int mno = Integer.valueOf(request.getParameter("mno"));
			
			boolean flag = biz.deleteMenus(mno);
			
			if(flag){
				
				response.sendRedirect("../Manager/MenusList.do");
				
			}
		}else if("/ChangeMenusByType".equals(path)){
			
			String type = request.getParameter("type");
			
			System.out.println(type);

			List<Menus> list = biz.queryMenusByType(type);

			Gson roomjson = new Gson();

			out.print(roomjson.toJson(list));
			
		}else if("/queryMenusByString".equals(path)){
			
			String str = request.getParameter("str");

			List<Menus> list = biz.queryMenusByString(str);

			Gson roomjson = new Gson();

			out.print(roomjson.toJson(list));
		}else if ("/upload".equals(path)) {
			JsonObject json = picture.upload(request, response);
			
			String address = json.get("fileName").getAsString();
			
			String mname = request.getParameter("mname");
			String type =  request.getParameter("type");
			double price = Double.valueOf(request.getParameter("price"));
			double vprice  = Double.valueOf(request.getParameter("vprice"));
			
			boolean flag = biz.addMenus(address,mname,type,price,vprice);
			
			if(flag){
				
				out.print("true");
				
			}else{
				out.print("false");
			}
			
	}else if("/queryMenus_update".equals(path)){
		int mno = Integer.valueOf(request.getParameter("mno"));
		Menus m = biz.queryMenus_update(mno);
		request.setAttribute("m", m);
		request.setAttribute("type", m.getMtype());
		request.getRequestDispatcher("../ManagerJsp/ManagerMenus/updateMenus.jsp").forward(request, response);
	}else if("/updateMenus".equals(path)){
		
		String address;
		String msname = request.getParameter("mname");
		int mno  = Integer.valueOf(request.getParameter("mno")) ;
		String type =  request.getParameter("type");
		double price = Double.valueOf(request.getParameter("price"));
		double vprice  = Double.valueOf(request.getParameter("vprice"));
		
		
		
		int mark = Integer.valueOf(request.getParameter("mark"));
		
		if(mark==1){
			address = request.getParameter("img");
		}else{
			JsonObject json = picture.upload(request, response);
			 address = json.get("fileName").getAsString();
		}
		
		boolean flag = biz.updateMenus(mno,msname,type,price,vprice,address);

		System.out.println(flag);
		if(flag){
			out.print("true");
		}
		
		
		
		
		
		
		
		
	}
}

}
