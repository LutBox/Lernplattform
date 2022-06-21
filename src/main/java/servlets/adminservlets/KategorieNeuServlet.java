//
//Erstellt von Lukas Theinert
//

package servlets.adminservlets;

import jakarta.servlet.http.HttpServlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.sql.DataSource;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class BildHochladenServlet
 */
@WebServlet("/KategorieNeuServlet")
@MultipartConfig(
        maxFileSize=128*128*4,
        maxRequestSize=128*128*4*4, 
        location= "/tmp",
        fileSizeThreshold=128*128)

public class KategorieNeuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public KategorieNeuServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//Kategorie entgegennehmen 
		String eingabeKategorie = request.getParameter("eingabeKategorie");

		persist(eingabeKategorie);

				
		// Weiterleiten an JSP
		final RequestDispatcher dispatcher = request.getRequestDispatcher("html/verwaltungsseiten/spielekonfigurator.jsp");
		dispatcher.forward(request, response);
	}
	


	private void persist(String neuKategorie) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"INSERT INTO wort VALUES(?);")) {
		
				pstmt.setString(1, neuKategorie);
				
			pstmt.executeUpdate();
			//log("HAT GEKLAPPT");
			
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}

	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
