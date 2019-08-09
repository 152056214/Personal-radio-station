package test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class CreteID
 */
@WebServlet("/CreteID")
public class CreteID extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreteID() {
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
//        String id = "qwerty";
        String id = request.getParameter("openid");
        PrintWriter pout = response.getWriter();
         try { 
            
            Class.forName("com.mysql.jdbc.Driver");
             Connection connect = DriverManager.getConnection( 
                     "jdbc:mysql://localhost:3306/radio-station","root","root");
            
            String sql = "INSERT INTO idtable (openid) VALUES ('"+id+"')";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.executeUpdate();
            connect.close();  
                         
         }catch (Exception e) { 
              pout.print("get data error!"); 
              e.printStackTrace(); }
	}
}


