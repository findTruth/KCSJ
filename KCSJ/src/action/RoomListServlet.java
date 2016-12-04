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
import entity.History;
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
		response.setHeader("content-type", "text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String url = request.getRequestURI();
		String path = url.substring(url.lastIndexOf("/"), url.lastIndexOf("."));
		
		System.out.println(path);
		
		EmpBiz biz = new EmpBizImpl();

		// 查询所有空房间
		if ("/GetroomlistBytype".equals(path)) {
			System.out.println("111");
			String type = request.getParameter("type");
			List<Room> list = biz.QueryAllRoomNullBytype(type);

			System.out.println(list.size());
			Gson roomjson = new Gson();
			out.print(roomjson.toJson(list));

		} // 顾客入住时查询所有可入住的房间
		else if ("/queryAllNullRoom".equals(path)) {

			List<Room> list = biz.QueryAllNullRoom();

			if (list != null) {
				request.setAttribute("Roomlist", list);
				request.getRequestDispatcher("../EmpJsp/ClientRuZhu.jsp").forward(request, response);
			}
			// 顾客预定查询所有可入住的房间
		} else if ("/queryAllRoom".equals(path)) {
			List<Room> list = biz.QueryAllNullRoom();
			if (list != null) {
				request.setAttribute("Roomlist", list);
				request.getRequestDispatcher("../EmpJsp/predetermine.jsp").forward(request, response);
			}
		} else if ("/queryYuDing".equals(path)) {
			// 调用方法将查到的预定转发出去
			List<Room> list = biz.QueryAllYuDing();
			Gson roomjson = new Gson();
			out.print(roomjson.toJson(list));

		} else if ("/HistoryListBytype".equals(path)) {

			String type = request.getParameter("type");

			List<History> list = biz.QueryHistoryByType(type);

			Gson historyjson = new Gson();

			out.print(historyjson.toJson(list));

		} else if ("/HistoryListByRmno".equals(path)) {

			int rmno = Integer.valueOf(request.getParameter("sousuo"));

			List<History> list = biz.QueryHistoryByRmno(rmno);

			Gson historyjson = new Gson();

			out.print(historyjson.toJson(list));

		}
	}
}
