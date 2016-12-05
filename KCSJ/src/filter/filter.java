package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Emp;

/**
 * Servlet Filter implementation class filter
 */
@WebFilter("/*")
public class filter implements Filter {

	/**
	 * Default constructor.
	 */
	public filter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;

		response.setCharacterEncoding("utf-8");

		HttpServletResponse resp = (HttpServletResponse) response;

		resp.setCharacterEncoding("utf-8");

		String url = req.getRequestURL().toString();

		HttpSession hs = req.getSession();

		String ename = (String) hs.getAttribute("ename");

		String mname = (String) hs.getAttribute("mname");

		String user = (String) hs.getAttribute("User");

		String path = req.getContextPath();

		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
				+ "/";

		if (ename != null || mname != null || url.endsWith("Home.jsp")|| url.endsWith("Emppassword.jsp") || url.endsWith("ManagerLogin.jsp")
				|| url.endsWith("Register.jsp") || url.endsWith("EmpLogin.jsp") || url.equals(basePath)
				|| url.endsWith("/check") || url.endsWith("/login.do") || url.endsWith("404.jsp")||url.endsWith("/GetroomlistBytype.do")
				|| url.endsWith("404.html") || url.endsWith(".css") || url.endsWith(".js") || url.endsWith(".gif")
				|| url.endsWith(".png") || url.endsWith(".jpg")) {
			chain.doFilter(request, response);
		} else {

			PrintWriter out = resp.getWriter();
			out.println("<head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /></head>");
			out.print("<script>alert('请登录后在进行操作！…………');top.location.href='" + req.getContextPath()
					+ "/Login/Home.jsp'</script>");
			// resp.sendRedirect(req.getContextPath() + "/index.jsp");
			out.close();
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {

	}

}
