//
//Erstellt von Lukas Theinert
//

package servlets;

import jakarta.servlet.http.HttpServlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import beans.Bestenliste;
import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BildHochladenServlet
 */

@WebServlet("/BeliebtesteSpieleAjax")

public class BeliebtesteSpieleAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	
	public BeliebtesteSpieleAjax() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response) 
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());

		// Neues Bestenlisten-Objekt erstellen
		Bestenliste beliebtesteSpieleAjax = new Bestenliste();

		// Bestenliste befüllen
		readNutzer(beliebtesteSpieleAjax);

		// Infos werden nur für diesen Request speichern
		request.setAttribute("beliebtesteSpieleAjax", beliebtesteSpieleAjax);

		// Weiterleiten an JSP
		final RequestDispatcher dispatcher = request.getRequestDispatcher("html/hauptseiten/beliebtesteSpieleListe.jsp");
		dispatcher.forward(request, response);
		
	}

	// Anzahl der insgesamt gespielten Spiele werden für jede Spielart in der Bestenliste gespeichert
	private void readNutzer(Bestenliste beliebtesteSpieleAjax) throws ServletException {
		// Datenbank-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT"
						+ "(SELECT COUNT(*) FROM bildermemorie WHERE kategorie = 'bildermemorie') as punkteBilderMemorie,"
						+ "(SELECT COUNT(*) FROM bilderwort WHERE kategorie = 'bilderwort') as punkteBilderBilderWort,"
						+ "(SELECT COUNT(*) FROM bilderordnen WHERE kategorie = 'bilderordnen') as punkteBilderOrdnen,"
						+ "(SELECT COUNT(*) FROM mathe WHERE kategorie = 'mathe') as punkteMathe,"
						+ "(SELECT COUNT(*) FROM jumpnrun WHERE kategorie = 'jumpnrun') as punkteJumpnrun;")) {

			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs != null && rs.next()) {
					beliebtesteSpieleAjax.setPunkteBilderMemorie(rs.getInt("punkteBilderMemorie"));
					beliebtesteSpieleAjax.setPunkteBilderBilderWort(rs.getInt("punkteBilderBilderWort"));
					beliebtesteSpieleAjax.setPunkteBilderOrdnen(rs.getInt("punkteBilderOrdnen"));
					beliebtesteSpieleAjax.setPunkteMathe(rs.getInt("punkteMathe"));
					beliebtesteSpieleAjax.setPunkteJumpnrun(rs.getInt("punkteJumpnrun"));
				}
			}

		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)  
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
