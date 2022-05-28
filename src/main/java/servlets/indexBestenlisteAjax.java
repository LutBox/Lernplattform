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
@WebServlet("/indexBestenlisteAjax")

public class indexBestenlisteAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public indexBestenlisteAjax() {
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
		
		ArrayList<Bestenliste> bestenlisteBilderMemorieAjax = new ArrayList<Bestenliste>();
		

		// Alle Nutzer auslesen
		bestenlisteBilderMemorieAjax = readNutzer(bestenlisteBilderMemorieAjax);
		
		request.setAttribute("bestenlisteBilderMemorieAjax", bestenlisteBilderMemorieAjax);

		//Weiterleiten an JSP
		final RequestDispatcher dispatcher = request.getRequestDispatcher("html/hauptseiten/indexLayoutRechts.jsp");
		dispatcher.forward(request, response);

	}
	
	private ArrayList<Bestenliste> readNutzer(ArrayList<Bestenliste> bestenlisteBilderMemorieAjax) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT name, punkte FROM nutzer WHERE admin = 0 ORDER BY punkte DESC, name ASC LIMIT 3;")) {
		
			try(ResultSet rs = pstmt.executeQuery()) {
				while (rs!= null && rs.next()) {
					Bestenliste bestenliste = new Bestenliste();
					bestenliste.setNutzer(rs.getString("name"));
					bestenliste.setPunkte(rs.getInt("punkte"));
					bestenlisteBilderMemorieAjax.add(bestenliste);
				}
			}
				
			
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		return bestenlisteBilderMemorieAjax;
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
