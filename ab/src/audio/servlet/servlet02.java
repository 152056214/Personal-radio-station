package audio.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class servlet02
 */
@WebServlet("/servlet02")
public class servlet02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servlet02() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");          
        /* 设置响应头允许ajax跨域访问 */  
        response.setHeader("Access-Control-Allow-Origin", "*");  
        /* 星号表示所有的异域请求都可以接受， */  
        response.setHeader("Access-Control-Allow-Methods", "GET,POST");  
       
        //获取微信小程序get的参数值并打印
        
        response.setContentType("text/json; charset=utf-8");
//        String id = "10004";
        String id = request.getParameter("authorid");
        PrintWriter pout = response.getWriter();
         try { 
            
            Class.forName("com.mysql.jdbc.Driver");
             Connection connect = DriverManager.getConnection( 
                     "jdbc:mysql://localhost:3306/radio-station","root","root");

                    Statement stmt = connect.createStatement(); //创建Statement对象
            String sql;
            sql = "SELECT * FROM audiomes where authorid='"+id+"'";
            ResultSet rs = stmt.executeQuery(sql);
            JSONArray jsonarray = new JSONArray(); 
            JSONObject jsonobj = new JSONObject(); 
            // 展开结果集数据库
            while(rs.next()){
                // 通过字段检索
                jsonobj.put("audioid", rs.getString("audioid"));  
                jsonobj.put("author", rs.getString("author"));  
                jsonobj.put("audioUrl", rs.getString("audioUrl"));     
                jsonobj.put("title", rs.getString("title"));           
                jsonobj.put("album", rs.getString("album"));           
                jsonobj.put("image", rs.getString("image"));            
                jsonobj.put("authorid", rs.getString("authorid"));                               
                 
                jsonarray.add(jsonobj);            
              }
            // 输出数据
            pout = response.getWriter();
            
            pout.println(jsonarray);
            // 完成后关闭
            rs.close();   
            stmt.close();   
            connect.close();                  
         }catch (Exception e) { 
              pout.print("get data error!"); 
              e.printStackTrace(); }
	}

}
