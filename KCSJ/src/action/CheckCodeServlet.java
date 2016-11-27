package action;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
/**
 *生成验证码
 * @author Administrator
 *
 */
public class CheckCodeServlet extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.设置响应类型
		response.setContentType("image/jpg");
		//2.画图--在内存创建图片对象 参数:宽、高、填充图片颜色方式
		BufferedImage image=new BufferedImage(60,20,BufferedImage.TYPE_INT_RGB);
		//3.获得画笔
		Graphics g= image.getGraphics();
		//4.填充背景色 背景色可变
		Random r=new Random();
		g.setColor(new Color(r.nextInt(155)+100,r.nextInt(155)+100,r.nextInt(155)+100));
		g.fillRect(0, 0, 60, 20);
		//5.获得画笔，填充前景色(文字)
		g.setColor(Color.BLACK);
		//6.生成随机数并画到"图片上"
		String number=String.valueOf(r.nextInt(8999)+1000);
		g.drawString(number, 5, 15);
		/***
		 * 将正确验证码保存到session中
		 * 
		 */
		HttpSession session=request.getSession();
		session.setAttribute("right_checkCode", number);
		
		
		//7.添加干扰线
		g.setColor(new Color(r.nextInt(255),r.nextInt(255),r.nextInt(255)));
		g.drawLine(r.nextInt(20), r.nextInt(10), r.nextInt(60), r.nextInt(20));
		g.drawLine(r.nextInt(20), r.nextInt(10), r.nextInt(60), r.nextInt(20));
		g.drawLine(r.nextInt(20), r.nextInt(10), r.nextInt(60), r.nextInt(20));
		g.drawLine(r.nextInt(20), r.nextInt(10), r.nextInt(60), r.nextInt(20));
		//8.压缩图片对象，生成图片
		/**
		 * 获得servlet输出流，将内存图片输出到浏览器
		 */
		OutputStream os=response.getOutputStream();
		JPEGImageEncoder encoder=JPEGCodec.createJPEGEncoder(os);
		encoder.encode(image);
	}

}
