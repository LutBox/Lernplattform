//
//Erstellt von Lukas Theinert
//

package servlets;

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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class AlleBilderAnzeigenServlet
 */

@WebServlet("/AlleBilderAnzeigenServlet")

public class AlleBilderAnzeigenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response) 
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());

		// Neue Listen anlegen für alle Bilder und alle Kategorien
		List<BilderAnzeigen> bilderListe;
		List<BilderAnzeigen> kategorieListe;

		// Listen befüllen
		bilderListe = readBild();
		kategorieListe = readKategorie();

		// Infos werden für mehrere Requests innerhalb einer Bean gespeichert
		final HttpSession session = request.getSession();
		session.setAttribute("bilderListe", bilderListe);
		session.setAttribute("kategorieListe", kategorieListe);

		// Weiterleiten an JSP
		final RequestDispatcher dispatcher = request.getRequestDispatcher("html/verwaltungsseiten/bilderAnzeigen.jsp");
		dispatcher.forward(request, response);

	}

	// Alle Bilder-IDs werden in der Liste gespeichert
	private List<BilderAnzeigen> readBild() throws ServletException {
		List<BilderAnzeigen> bilderListe = new ArrayList<>();

		// Datenbank-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT id, kategorie FROM bild;")) {

			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs != null && rs.next()) {
					BilderAnzeigen spielBilder = new BilderAnzeigen();
					spielBilder.setBildID(rs.getLong("id"));
					spielBilder.setBildKategorie(rs.getString("kategorie"));
					bilderListe.add(spielBilder);
				}
			}

		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		return bilderListe;
	}

	// Alle Kategorien werden in der Liste gespeichert
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
	 *
	 *
	 *	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	 *		doGet(request, response);
	 *	}
	 */
}
