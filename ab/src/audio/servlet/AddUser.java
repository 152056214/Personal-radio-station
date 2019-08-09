package audio.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pojo.DbUtils;


/**
 * Servlet implementation class CreteID
 */
@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUser() {
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
        String openid = request.getParameter("openid");
        String id = getIdByopenId(openid);
        String name = request.getParameter("name");
        String album = request.getParameter("album");
        String category = request.getParameter("category");
        PrintWriter pout = response.getWriter();
         try { 
            
            Class.forName("com.mysql.jdbc.Driver");
             Connection connect = DriverManager.getConnection( 
                     "jdbc:mysql://localhost:3306/radio-station","root","root");
            
            String sql = "INSERT INTO usertable (userid, author, album, iscanuse, Category) VALUES ('"+id+"', ?, ?, ?, ?);";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, album);
            ps.setString(3, "true");
            ps.setString(4, category);
            ps.executeUpdate();
            connect.close();  
                         
         }catch (Exception e) { 
              pout.print("get data error!"); 
              e.printStackTrace(); }
	}

	public String getIdByopenId(String openid){
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		String id = null;
		try {
			conn = DbUtils.getConnection();
			String sql= "select * from idtable where openid='"+openid+"';";
			stat = conn.prepareStatement(sql);
			
			rs = stat.executeQuery();
			if (rs.next()) {
				id = rs.getString("userid");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				DbUtils.close(null, stat, conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return id;
	}
}


