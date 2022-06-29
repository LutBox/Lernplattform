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
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class KategorieEntfernenServlet
 */

@WebServlet("/KategorieEntfernenServlet")

public class KategorieEntfernenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 *
	 *
	 *	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 *		
	 *	}
	 */

	// Alle Bilder aus der Datenbank mit der jeweiligen Kategorie entfernen
	private void deleteBild(String neuKategorie) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("DELETE FROM bild WHERE kategorie = (?);")) {

			pstmt.setString(1, neuKategorie);

			pstmt.executeUpdate();

		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}

	}

	// Kategorie aus der Datenbank entfernen
	private void deleteKategorie(String neuKategorie) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("DELETE FROM wort WHERE kategorie = (?);")) {

			pstmt.setString(1, neuKategorie);

			pstmt.executeUpdate();

		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)  
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());

		// Daten aus Request holen
		String kategorie = request.getParameter("kategorieWahl");

		// Alle Bilder aus der Datenbank mit der jeweiligen Kategorie entfernen
		deleteBild(kategorie);
		// Kategorie aus der Datenbank entfernen
		deleteKategorie(kategorie);

		// Weiterleiten an JSP
		final RequestDispatcher dispatcher = request.getRequestDispatcher("html/verwaltungsseiten/spielekonfigurator.jsp");
		dispatcher.forward(request, response);
	}

}
