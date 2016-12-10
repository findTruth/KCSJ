package Tool;


import java.io.File;
import java.io.FileOutputStream;

import org.apache.commons.fileupload.FileItem;  
import org.apache.commons.fileupload.FileUploadException;  
import org.apache.commons.fileupload.disk.DiskFileItemFactory;  
import org.apache.commons.fileupload.servlet.ServletFileUpload;  
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.google.gson.JsonObject;

import Tool.picture;


public class picture {

	// 图片上传
	public final static JsonObject upload(HttpServletRequest request, HttpServletResponse response) throws IOException {
		JsonObject json = new JsonObject();
		 //1、创建一个DiskFileItemFactory工厂  
        DiskFileItemFactory factory = new DiskFileItemFactory();  
        //2、创建一个文件上传解析器  
        ServletFileUpload upload = new ServletFileUpload(factory);  
        //解决上传文件名的中文乱码  
        upload.setHeaderEncoding("UTF-8");   
        factory.setSizeThreshold(1024 * 500);//设置内存的临界值为500K  
        File linshi = new File("C:\\Users\\eason\\git");//当超过500K的时候，存到一个临时文件夹中  
        factory.setRepository(linshi);  
        upload.setSizeMax(1024 * 1024 * 5);//设置上传的文件总的大小不能超过5M  
        try {  
            // 1. 得到 FileItem 的集合 items  
            List<FileItem> /* FileItem */items = upload.parseRequest(request);  
  
            // 2. 遍历 items:  
            for (FileItem item : items) {  
                // 若是一个一般的表单域, 打印信息  
                if (item.isFormField()) {  
                    String name = item.getFieldName(); 
                        
                    String value = item.getString("utf-8");  
  
                    //System.out.println(name + ": " + value); 
                    json.addProperty(name, value);
                      
                      
                }  
                // 若是文件域则把文件保存到 e:\\files 目录下.  
                else {  
                    String fileName = item.getName();  
                    long sizeInBytes = item.getSize(); 
                    
                    
                    json.addProperty("fileName", fileName);
                    
                    System.out.println(fileName);  
                    System.out.println(sizeInBytes);  
  
                    InputStream in = item.getInputStream();  
                    byte[] buffer = new byte[1024];  
                    int len = 0;  
  
                    //根据部署的路径，这是临时路径
                    fileName = "C:\\Users\\eason\\git\\KCSJ\\KCSJ\\WebContent\\EmpJsp\\Image\\" + fileName;//文件最终上传的位置  
                    System.out.println(fileName);  
                    OutputStream outstream = new FileOutputStream(fileName);  
  
                    while ((len = in.read(buffer)) != -1) {  
                    	outstream.write(buffer, 0, len);  
                    }  
  
                    outstream.close();  
                    in.close();  
                }  
            }  
  
        } catch (FileUploadException e) {  
            e.printStackTrace();  
        }
		return json;  
  
    }  
}
