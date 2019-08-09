package ab;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class ad
 */
@WebServlet("/follow")
public class follow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public follow() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/json; charset=utf-8");
		String openid = request.getParameter("openid");
        PrintWriter out = response.getWriter();
         try { 
            
            Class.forName("com.mysql.jdbc.Driver");
             Connection connect = DriverManager.getConnection( 
                     "jdbc:mysql://localhost:3306/radio-station","root","root");

                    Statement stmt = connect.createStatement(); //创建Statement对象
            String sql;
            sql = "SELECT * FROM usertable where userid in" + 
            		"(SELECT myfollowid FROM  myfollow where userid in" + 
            		"(SELECT userid FROM idtable where openid='"+openid+"'));";
             ResultSet rs = stmt.executeQuery(sql);
             JSONArray jsonarray = new JSONArray(); 
             JSONArray dataarray = new JSONArray(); 
             JSONObject jsonobj = new JSONObject(); 
             JSONObject dataobj = new JSONObject(); 
             // 展开结果集数据库
             while(rs.next()){
                 // 通过字段检索
                 jsonobj.put("userid", rs.getString("userid"));  //对象用{}
                 jsonobj.put("author", rs.getString("author"));  
                 jsonobj.put("album", rs.getString("album"));     
                 jsonobj.put("image", rs.getString("headimg"));   
                 jsonobj.put("Category", rs.getString("Category"));                               
                  
                 jsonarray.add(jsonobj);  //并列数据的集合用[]          
               }
             // 输出数据
             out = response.getWriter();
             dataobj.put("list", jsonarray);
             dataarray.add(dataobj);
             out.println(dataarray);
             // 完成后关闭
             rs.close();   
             stmt.close();   
             connect.close();                  
          }catch (Exception e) { 
               out.print("get data error!"); 
               e.printStackTrace(); }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
