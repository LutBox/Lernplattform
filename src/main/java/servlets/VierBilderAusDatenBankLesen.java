package servlets;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import beans.SpielVierBilderEinWortBean;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class VierBilderAusDatenBankLesen
 */
@WebServlet("/VierBilderAusDatenBankLesen")
public class VierBilderAusDatenBankLesen extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// Verbindung zur DB 
	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VierBilderAusDatenBankLesen() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		Integer id = Integer.valueOf(request.getParameter("id"));
		
	// 2) 4 bilder (IDs) passend zum ausgewählten Wort
		// DB-Zugriff
		try (Connection con = ds.getConnection();
			 PreparedStatement pstmt = con.prepareStatement("SELECT image FROM bild where id=?")) {
			pstmt.setInt(1, id);
  	      try (ResultSet rs = pstmt.executeQuery()) {
  			
				if (rs != null && rs.next()) {
					Blob bild = rs.getBlob("image");
					response.reset();
					long length = bild.length();
					response.setHeader("Content-Length",String.valueOf(length));
					
					try (InputStream in = bild.getBinaryStream()) {
						final int bufferSize = 256;
						byte[] buffer = new byte[bufferSize];
						
						ServletOutputStream out = response.getOutputStream();
						while ((length = in.read(buffer)) != -1) {
							out.write(buffer,0,(int) length);
						}
					}
				}
			}
			
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		
		
}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
