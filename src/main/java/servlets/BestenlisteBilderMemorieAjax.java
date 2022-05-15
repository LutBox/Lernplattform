//
//Erstellt von Lukas Theinert
//

package servlets;

import jakarta.servlet.http.HttpServlet;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import beans.SpielBilderMemorieBean;
import beans.SpielMatheBean;
import beans.SpielStartenBean;
import beans.modelbeans.NutzerBean;
import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class BildHochladenServlet
 */
@WebServlet("/BestenlisteBilderMemorieAjax")

public class BestenlisteBilderMemorieAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BestenlisteBilderMemorieAjax() {
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
		
		
		// Dateien aus Bean in neues Objekt einfügen
		SpielStartenBean bestenlisteBilderMemorieAjax = (SpielStartenBean) request.getSession().getAttribute("spielStartenBean");
		
		bestenlisteBilderMemorieAjax.setZeit(Integer.valueOf(request.getParameter("zeit")));
		bestenlisteBilderMemorieAjax.setVersuche(Integer.valueOf(request.getParameter("versuche")));
		

		
		NutzerBean aktuellerNutzer = (NutzerBean) request.getSession().getAttribute("nutzer");
		
		// In Datenbank eintragen
		persist(bestenlisteBilderMemorieAjax, aktuellerNutzer);
		
		// Infos werden nur für mehrere Requests gespeichert innerhalb einer Bean
		final HttpSession session = request.getSession();
		session.setAttribute("bestenlisteBilderMemorieAjax", bestenlisteBilderMemorieAjax);
		
		// Weiterleiten an JSP
		//final RequestDispatcher dispatcher = request.getRequestDispatcher("html/verwaltungsseiten/bildHochladenFertig.jsp");
		//dispatcher.forward(request, response);
		

	}
	

	private void persist(SpielStartenBean bestenlisteBilderMemorieAjax, NutzerBean aktuellerNutzer) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"INSERT INTO bildermemorie (nutzer, kategorie, schwierigkeit, isgelistet, istimer, zeit, versuche, uhrzeit) VALUES (?,?,?,?,?,?,?, CURDATE()")) {
		
				pstmt.setString(1, aktuellerNutzer.getName());
				pstmt.setString(2, bestenlisteBilderMemorieAjax.getSpielart());
				pstmt.setString(3, bestenlisteBilderMemorieAjax.getSchwierigkeit());
				pstmt.setString(4, bestenlisteBilderMemorieAjax.getGewertet());
				pstmt.setString(5, bestenlisteBilderMemorieAjax.getTimer());
				pstmt.setInt(6, bestenlisteBilderMemorieAjax.getZeit());
				pstmt.setInt(7, bestenlisteBilderMemorieAjax.getVersuche());
				
			pstmt.executeUpdate();
			
			
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}

	}
	
	private void persist2(SpielBilderMemorieBean spielBilderMemorieBean, Part filepart) throws ServletException {
		// DB-Zugriff
		String[] generatedKeys = new String[] {"id"};	// Name der Spalte(n), die automatisch generiert wird(werden)
		
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(

						"INSERT INTO bild (kategorie, image) VALUES (?,?)", generatedKeys)) {
			
				pstmt.setString(1,spielBilderMemorieBean.getBild1Kategorie());
				pstmt.setBinaryStream(2, filepart.getInputStream());

			pstmt.executeUpdate();
			
			try (ResultSet rs = pstmt.getGeneratedKeys()) {
				int i = 1;
				while (rs.next()) {
					if (i++ == 1)
						spielBilderMemorieBean.setBild1ID(rs.getInt(1));
					else
						spielBilderMemorieBean.setBild1ID(rs.getInt(1));
				}
			}
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}

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
