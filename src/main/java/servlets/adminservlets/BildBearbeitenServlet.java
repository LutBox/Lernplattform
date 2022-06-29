//
//Erstellt von Lukas Theinert
//
package servlets.adminservlets;

import jakarta.servlet.http.HttpServlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import beans.BilderAnzeigen;
import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class BildBearbeitenServlet
 */

@WebServlet("/BildBearbeitenServlet")
public class BildBearbeitenServlet extends HttpServlet {
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

	// Aktuelle Bild-ID und Bild-Kategorie auslesen
	private BilderAnzeigen read(String bildID) throws ServletException {
		BilderAnzeigen bild = new BilderAnzeigen();

		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("Select * from bild where id = (?)")) {

			pstmt.setString(1, bildID);
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs != null && rs.next()) {
					bild.setBildID(rs.getLong("id"));
					bild.setBildKategorie(rs.getString("kategorie"));
				}
			}
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		return bild;
	}

	// Alle Kategorien auslesen
	private List<BilderAnzeigen> readKategorie() throws ServletException {
		List<BilderAnzeigen> kategorieListe = new ArrayList<>();

		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM wort;")) {

			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs != null && rs.next()) {
					BilderAnzeigen spielBilder = new BilderAnzeigen();
					spielBilder.setBildKategorie(rs.getString("kategorie"));
					kategorieListe.add(spielBilder);
				}
			}

		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		return kategorieListe;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response) 
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());

		// Daten aus Request holen
		request.getParameter("bildID");
		String bildID = request.getParameter("bildID");
		
		// Alle Kategorien auslesen
		BilderAnzeigen bild = read(bildID);
		List<BilderAnzeigen> kategorieListe = readKategorie();

		// Infos werden für mehrere Requests in Session gespeichert
		final HttpSession session = request.getSession();
		session.setAttribute("bild", bild);
		session.setAttribute("kategorieListe", kategorieListe);

		// Weiterleiten an JSP
		final RequestDispatcher dispatcher = request.getRequestDispatcher("./html/verwaltungsseiten/bildBearbeiten.jsp");
		dispatcher.forward(request, response);
	}

}
