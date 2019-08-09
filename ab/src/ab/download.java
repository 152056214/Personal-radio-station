package ab;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;

import sun.misc.BASE64Encoder;
import sun.nio.ch.IOUtil;

/**
 * Servlet implementation class download
 */
@WebServlet("/download")
public class download extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public download() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		String filename = "http://localhost:8080/ab/upload/����Ψ - äĿ����.mp3 ";
		String filename = "E:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\ab\\upload\\���¸� ����\\36bcb94a307128af180b949c072a1749";
		//String framename = new String("�������.mp3".getBytes("GBK"),"ISO-8859-1");
		String framename = filenameEncoding("�������.mp3",request);
		//����ͷ��һ����
		String contentType = this.getServletContext().getMimeType(filename);
		String contentDisposition = "attachment;filename="+framename;
		FileInputStream input = new FileInputStream(filename);
		//����ͷ
		response.setHeader("ContentType", contentType);
        
		response.setHeader("ContentDisposition", contentDisposition);
		//��ȡ������Ӧ�˵���
		ServletOutputStream output = response.getOutputStream();
		IOUtils.copy(input, output);//������������д�������
		input.close();
	}
	
	public static String filenameEncoding(String filename, HttpServletRequest request) throws IOException {
		String agent = request.getHeader("User-Agent");
		if (agent.contains("Firefox")) {
			BASE64Encoder base64Encoder =new BASE64Encoder();
			filename = "=?utf-8?32"+ base64Encoder.encode(filename.getBytes("utf-8"))
					+"?=";
		} else {
			filename = URLEncoder.encode(filename,"utf-8");
		}
		return filename;
	}

}







