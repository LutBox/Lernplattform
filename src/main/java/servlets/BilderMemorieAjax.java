//
//Erstellt von Lukas Theinert
//

package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import beans.NutzerViewBean;
import beans.SpielStartenBean;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
 * Servlet implementation class BilderMemorieAjax
 */

@WebServlet("/BilderMemorieAjax")

public class BilderMemorieAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	public BilderMemorieAjax() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());

		// Dateien aus Session in neues Objekt einfügen
		SpielStartenBean bilderMemorieAjax = (SpielStartenBean) request.getSession().getAttribute("spielStartenBean");

		// Daten aus Request lesen
		bilderMemorieAjax.setZeit(Integer.valueOf(request.getParameter("zeit")));
		bilderMemorieAjax.setVersuche(Integer.valueOf(request.getParameter("versuche")));

		NutzerViewBean aktuellerNutzer = (NutzerViewBean) request.getSession().getAttribute("nutzer");

		// Daten zum Spiel in der Datenbank speichern
		safeGame(bilderMemorieAjax, aktuellerNutzer);

		// Wenn Spiel gewerten: anzahl der vom Nutzer benötigten Versuche und Zeit in der Datenbank speichern
		if (bilderMemorieAjax.getGewertet().equals("gewertetAn")) {
			safeUserStats(bilderMemorieAjax, aktuellerNutzer);
		}

	}

	private void safeGame(SpielStartenBean bilderMemorieAjax, NutzerViewBean aktuellerNutzer) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"INSERT INTO bildermemorie (nutzer, kategorie, schwierigkeit, isgelistet, istimer, zeit, versuche, uhrzeit) VALUES (?,?,?,?,?,?,?,NOW());")) {

			pstmt.setString(1, aktuellerNutzer.getName());
			pstmt.setString(2, bilderMemorieAjax.getSpielart());
			pstmt.setString(3, bilderMemorieAjax.getSchwierigkeit());
			pstmt.setString(4, bilderMemorieAjax.getGewertet());
			pstmt.setString(5, bilderMemorieAjax.getTimer());
			pstmt.setInt(6, bilderMemorieAjax.getZeit());
			pstmt.setInt(7, bilderMemorieAjax.getVersuche());

			pstmt.executeUpdate();

		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}

	}

	// Anzahl der vom Nutzer benötigten Versuche und Zeit in der Datenbank speichern
	private void safeUserStats(SpielStartenBean bilderMemorieAjax, NutzerViewBean aktuellerNutzer) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"UPDATE nutzer SET punkteBilderMemorie = punkteBilderMemorie + ? WHERE name = ?;")) {

			int zeit = bilderMemorieAjax.getZeit();
			int versuche = bilderMemorieAjax.getVersuche();

			String schwierigkeit = bilderMemorieAjax.getSchwierigkeit();

			// Anzahl der erreichten Punktezahl berechnen und in der Datenbank speichern
			if (schwierigkeit.equals("leicht")) {
				if (zeit <= 24 && versuche <= 24) {
					pstmt.setInt(1, 2);
				} else if (zeit <= 34 && versuche <= 30) {
					pstmt.setInt(1, 1);
				} else {
					pstmt.setInt(1, 0);
				}
			} else if (schwierigkeit.equals("mittel")) {
				if (zeit <= 50 && versuche <= 40) {
					pstmt.setInt(1, 6);
				} else if (zeit <= 70 && versuche <= 50) {
					pstmt.setInt(1, 4);
				} else {
					pstmt.setInt(1, 2);
				}
			} else if (schwierigkeit.equals("schwer")) {
				if (zeit <= 80 && versuche <= 60) {
					pstmt.setInt(1, 10);
				} else if (zeit <= 120 && versuche <= 70) {
					pstmt.setInt(1, 8);
				} else {
					pstmt.setInt(1, 6);
				}
			}

			pstmt.setString(2, aktuellerNutzer.getName());

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
