package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import biz.EBiz.EmpBiz;
import biz.EBiz.EmpBizImpl;
import entity.Room;

/**
 * Servlet implementation class RoomListServlet
 */
@WebServlet("/RoomList/*")
public class RoomListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/**
		 * 设置编码
		 */
		response.setContentType("text/html;charset=utf-8");

		response.setCharacterEncoding("utf-8");

		request.setCharacterEncoding("utf-8");

		PrintWriter out = response.getWriter();

		String url = request.getRequestURI();

		String path = url.substring(url.lastIndexOf("/"), url.lastIndexOf("."));

		EmpBiz biz = new EmpBizImpl();
		
		
		//查询所有空房间
		if ("/GetroomlistBytype".equals(path)) {
			
			String type = request.getParameter("type");
			
			System.out.println(type);
			
			List<Room> list = biz.QueryAllRoomNullBytype(type);
			
			Gson roomjson = new Gson();
			
			out.print(roomjson.toJson(list));
			
			//顾客入住时查询所有可入住的房间
		}else if("/queryAllNullRoom".equals(path)){
			
			List<Room> list = biz.QueryAllNullRoom();
			
			if (list != null) {
				request.setAttribute("Roomlist", list);
				request.getRequestDispatcher("../EmpJsp/ClientRuZhu.jsp").forward(request, response);
			}
			
		}

	}

}
