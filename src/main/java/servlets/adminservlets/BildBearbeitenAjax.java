//
//Erstellt von Lukas Theinert
//

package servlets.adminservlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BildBearbeitenAjax
 */

@WebServlet("/BildBearbeitenAjax")

public class BildBearbeitenAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response) 
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());

		// Dateien aus Request in neues Objekt einfügen
		String neuKategorie = String.valueOf(request.getParameter("neuKategorie"));
		String bildID = String.valueOf(request.getParameter("bildID"));

		// Kategorie von Bild ändern
		changeKategorie(neuKategorie, bildID);

	}

	// Kategorie von Bild ändern
	private void changeKategorie(String neuKategorie, String bildID) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con
						.prepareStatement("UPDATE bild SET kategorie = (?) WHERE bild.id = (?);")) {

			pstmt.setString(1, neuKategorie);
			pstmt.setString(2, bildID);

			pstmt.executeUpdate();

		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
