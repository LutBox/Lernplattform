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
 * Servlet implementation class BildHochladenServlet
 */
@WebServlet("/BesteSpielerAjax")

public class BesteSpielerAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BesteSpielerAjax() {
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
		
		ArrayList<Bestenliste> besteSpielerAjax = new ArrayList<Bestenliste>();
		

		// Alle Nutzer auslesen
		besteSpielerAjax = readNutzer(besteSpielerAjax);
		
		request.setAttribute("besteSpielerAjax", besteSpielerAjax);

		//Weiterleiten an JSP
		final RequestDispatcher dispatcher = request.getRequestDispatcher("html/hauptseiten/besteSpielerListe.jsp");
		dispatcher.forward(request, response);

	}
	
	private ArrayList<Bestenliste> readNutzer(ArrayList<Bestenliste> besteSpielerAjax) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT name, punkteBilderMemorie + punkteBilderBilderWort + punkteBilderOrdnen + punkteMathe + punkteJumpnrun as punkte FROM nutzer WHERE admin = 0 ORDER BY punkte DESC, name ASC LIMIT 3;")) {
		
			try(ResultSet rs = pstmt.executeQuery()) {
				while (rs!= null && rs.next()) {
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
