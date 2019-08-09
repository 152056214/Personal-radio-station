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
import pojo.User;


/**
 * Servlet implementation class CreteID
 */
@WebServlet("/AddAudio")
public class AddAudio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAudio() {
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
        String title = request.getParameter("title");
        String filename = request.getParameter("filename");
        String openid = request.getParameter("openid");
        String id = getIdByopenId(openid);
        User user = getByuserId(id);
        PrintWriter pout = response.getWriter();
         try { 
            
            Class.forName("com.mysql.jdbc.Driver");
             Connection connect = DriverManager.getConnection( 
                     "jdbc:mysql://localhost:3306/radio-station","root","root");
            
            String sql = "INSERT INTO audiomes (author, audioUrl, title, album, authorid, image) VALUES ( ?, ?, ?, ?, ?, ?);";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, user.getAuthor());
            ps.setString(2, filename);
            ps.setString(3, title);
            ps.setString(4, user.getAlbum());
            ps.setString(5, Integer.toString(user.getUserID()));
            ps.setString(6, user.getHeadimg());
            ps.executeUpdate();
            connect.close();  
                         
         }catch (Exception e) { 
              pout.print("get data error!"); 
              e.printStackTrace(); }
	}
	
	//根据id获取用户信息
	public User getByuserId(String UserID){
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		User  user = null;
		try {
			conn = DbUtils.getConnection();
			String sql= "select * from usertable where UserID='"+ UserID +"'";
			stat = conn.prepareStatement(sql);
			
			rs = stat.executeQuery();
			if (rs.next()) {
				user=new User();
				user.setHeadimg(rs.getString("headimg"));
				user.setAlbum(rs.getString("album"));
				user.setAuthor(rs.getString("author"));
				user.setUserID(rs.getInt("userid"));
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

		return user;
		  
	}

	//用openid获取id
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


