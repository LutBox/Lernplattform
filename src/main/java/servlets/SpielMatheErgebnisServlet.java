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

import beans.SpielMatheBean;
import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class SpielMatheErgebnisServlet
 */
@WebServlet("/SpielMatheErgebnisServlet")
public class SpielMatheErgebnisServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SpielMatheErgebnisServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());

		// Dateien aus Bean in neues Objekt einfügen
		SpielMatheBean spielMatheBean = (SpielMatheBean) request.getSession().getAttribute("spielMatheBean");

		// Nutzerergebnis aufrufen und in Bean speichern
		int temp = Integer.parseInt(request.getParameter("NutzerErgebnis1"));
		spielMatheBean.setNutzerErgebnis1(temp);

		// DB-Zugriff
		persist(spielMatheBean);
		
		SpielMatheBean datenDB = new SpielMatheBean();
		datenDB = read();

		// Infos werden nur für mehrere Requests gespeichert innerhalb einer Bean
		final HttpSession session = request.getSession();
		session.setAttribute("spielMatheBean", spielMatheBean);
		session.setAttribute("datenDB", datenDB);

		// Weiterleiten an JSP
		final RequestDispatcher dispatcher = request.getRequestDispatcher("html/spieleseiten/spiel_mathe_ergebnis.jsp");
		dispatcher.forward(request, response);

	}

	private void persist(SpielMatheBean formBeam) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"INSERT INTO dummy_table_1 (aufgabe,ergebnis,nutzerergebnis) VALUES (?,?,?)")) {

			// Zugriff über Klasse java.sql.PreparedStatement
			pstmt.setString(1, formBeam.getZahl1() + "+" + formBeam.getZahl2());
			pstmt.setInt(2, formBeam.getErgebnis1());
			pstmt.setInt(3, formBeam.getNutzerErgebnis1());
			pstmt.executeUpdate();
			
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}

	}
	
	private SpielMatheBean read() throws ServletException {
		SpielMatheBean spielMatheBean = new SpielMatheBean();
		
		//DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT MAX(dt1_key), aufgabe, ergebnis, nutzerergebnis FROM dummy_table_1;")) {

			try(ResultSet rs = pstmt.executeQuery()) {
				if (rs!= null && rs.next()) {
					spielMatheBean.setAufgabe(rs.getString("aufgabe"));
					spielMatheBean.setErgebnis1(rs.getInt("ergebnis"));
					spielMatheBean.setNutzerErgebnis1(rs.getInt("nutzerErgebnis"));
				}
			}
			
			
			
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		
		return spielMatheBean;

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
