//
//Erstellt von Lukas Theinert
//

package servlets;

import jakarta.servlet.http.HttpServlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import beans.Bestenliste;
import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BesteSpielerAjax
 */

@WebServlet("/BesteSpielerAjax")

public class BesteSpielerAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response) 
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());

		// Neues Liste erstellen
		ArrayList<Bestenliste> besteSpielerAjax = new ArrayList<>();

		// Liste mit Nutzer befüllen, absteigend nach Gesamtpunktezahl aller Spiele
		besteSpielerAjax = readNutzer(besteSpielerAjax);

		// Infos werden nur für diesen Request speichern
		request.setAttribute("besteSpielerAjax", besteSpielerAjax);

		// Weiterleiten an JSP
		final RequestDispatcher dispatcher = request.getRequestDispatcher("html/hauptseiten/besteSpielerListe.jsp");
		dispatcher.forward(request, response);

	}

	private ArrayList<Bestenliste> readNutzer(ArrayList<Bestenliste> besteSpielerAjax) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT name, punkteBilderMemorie + punkteBilderBilderWort + punkteBilderOrdnen + punkteMathe + punkteJumpnrun as punkte FROM nutzer WHERE admin = 0 ORDER BY punkte DESC, name ASC LIMIT 3;")) {

			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs != null && rs.next()) {
					Bestenliste bestenliste = new Bestenliste();
					bestenliste.setNutzer(rs.getString("name"));
					bestenliste.setGesamtPunkte(rs.getInt("punkte"));
					besteSpielerAjax.add(bestenliste);
				}
			}

		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		return besteSpielerAjax;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response) 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
