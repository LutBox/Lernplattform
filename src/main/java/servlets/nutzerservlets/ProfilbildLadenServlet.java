package servlets.nutzerservlets;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author Merlin Servlet implementation class ProfilbildLadenServlet
 */
@WebServlet("/ProfilbildLadenServlet")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5
		* 4, location = "./tmpbilder", fileSizeThreshold = 1024 * 1024)
public class ProfilbildLadenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT bild FROM `nutzer` WHERE name = ?")) {
			String nutzername = request.getParameter("nn");
			pstmt.setString(1, nutzername);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs != null && rs.next()) {
					Blob bild = rs.getBlob("bild");
					if (bild != null) {
						response.reset();
						long length = bild.length();
						response.setHeader("Content-Length", String.valueOf(length));

						try (InputStream in = bild.getBinaryStream();) {
							final int bufferSize = 256;
							byte[] buffer = new byte[bufferSize];

							ServletOutputStream out = response.getOutputStream();
							while ((length = in.read(buffer)) != -1) {
								out.write(buffer, 0, (int) length);
							}
							out.flush();
						}
					}

				}
			}
		} catch (SQLException e) {
			throw new ServletException(e.getMessage());
		}
	}
}
