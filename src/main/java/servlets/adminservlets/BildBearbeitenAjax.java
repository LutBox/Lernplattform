//
//Erstellt von Lukas Theinert
//

package servlets.adminservlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
 * 
 */
@WebServlet("/BildBearbeitenAjax")

public class BildBearbeitenAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BildBearbeitenAjax() {
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
		
		// Dateien aus Bean in neues Objekt einfügen
		String neuKategorie = String.valueOf(request.getParameter("neuKategorie"));
		String bildID = String.valueOf(request.getParameter("bildID"));

		//log("HAT GEKLAPPT: " + neuKategorie + "BILDID:" + bildID);
		// In Datenbank eintragen
		persist(neuKategorie, bildID);
		
		//Weiterleiten an JSP
		//final RequestDispatcher dispatcher = request.getRequestDispatcher("html/verwaltungsseiten/spielekonfigurator.jsp");
		//dispatcher.forward(request, response);
	}
	

	private void persist(String neuKategorie, String bildID) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"UPDATE bild SET kategorie = (?) WHERE bild.id = (?);")) {
		
				pstmt.setString(1, neuKategorie);
				pstmt.setString(2, bildID);
				
			pstmt.executeUpdate();
			//log("HAT GEKLAPPT");
			
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//log("TEEEEEEEST");
		doGet(request, response);
	}

}
