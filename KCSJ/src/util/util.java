package util;

import java.io.IOException;
	import java.io.InputStream;
	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.ResultSet;
	import java.sql.Statement;
	import java.util.Properties;


	public class util {
		
		private static String  driver = null;
		private static String url = null;
		private static String  username=null;
		private static String password = null;
		private static Properties pro = null;
		//建立连接
		static{
			 pro=new Properties() ;
			 InputStream is = util.class.getResourceAsStream("pro.properties");
			 try {
				pro.load(is);
				driver = pro.getProperty("driver");
				url = pro.getProperty("url");
				username = pro.getProperty("username");
				password = pro.getProperty("password");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		public static Connection getConnection() throws Exception{
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url,username,password);
			return conn;	
		}

		public static void closeConnection(Statement sta,Connection conn,ResultSet rs) throws Exception{
			if(sta!=null)sta.close();
			if(conn!=null)conn.close();
			if(rs!=null)rs.close();
		}
		public static void closeConnection(Connection conn,ResultSet rs) throws Exception{
			closeConnection(null,conn, rs);
		}
	}

