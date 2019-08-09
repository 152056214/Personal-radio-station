package test;

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
 * Servlet implementation class Servlet01
 */
@WebServlet("/Servlet01")
public class Servlet01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet01() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");          
        /* ������Ӧͷ����ajax������� */  
        response.setHeader("Access-Control-Allow-Origin", "*");  
        /* �Ǻű�ʾ���е��������󶼿��Խ��ܣ� */  
        response.setHeader("Access-Control-Allow-Methods", "GET,POST");  
       
        //��ȡ΢��С����get�Ĳ���ֵ����ӡ
        
        response.setContentType("text/json; charset=utf-8");
//        String id = "10004";
        //ͨ����ƵID��ȡ��Ƶ��Ϣ
        String id = request.getParameter("audioid");
        PrintWriter pout = response.getWriter();
         try { 
            
            Class.forName("com.mysql.jdbc.Driver");
             Connection connect = DriverManager.getConnection( 
                     "jdbc:mysql://localhost:3306/radio-station","root","root");
//             DELETE FROM `radio-station`.`idtable` WHERE `userid`='10003';//ɾ�����

                    Statement stmt = connect.createStatement(); //����Statement����
            String sql;
            sql = "SELECT * FROM audiomes where audioid='"+id+"'";
            ResultSet rs = stmt.executeQuery(sql);
            JSONArray jsonarray = new JSONArray(); 
            JSONObject jsonobj = new JSONObject(); 
            // չ����������ݿ�
            while(rs.next()){
                // ͨ���ֶμ���
                jsonobj.put("audioid", rs.getString("audioid"));  
                jsonobj.put("author", rs.getString("author"));  
                jsonobj.put("audioUrl", rs.getString("audioUrl"));     
                jsonobj.put("title", rs.getString("title"));           
                jsonobj.put("album", rs.getString("album"));            
                jsonobj.put("image", rs.getString("image"));                              
                 
                jsonarray.add(jsonobj);            
              }
            // �������
            pout = response.getWriter();
            
            pout.println(jsonarray);
            // ��ɺ�ر�
            rs.close();   
            stmt.close();   
            connect.close();                  
         }catch (Exception e) { 
              pout.print("get data error!"); 
              e.printStackTrace(); }
	}

}
