//
//Erstellt von Lukas Theinert
//

package servlets;

import jakarta.servlet.http.HttpServlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import beans.SpielStartenBean;
import beans.viewbeans.NutzerViewBean;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BildHochladenServlet
 */
@WebServlet("/BilderOrdnenAjax")

public class BilderOrdnenAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BilderOrdnenAjax() {
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
		SpielStartenBean bilderOrdnenAjax = (SpielStartenBean) request.getSession().getAttribute("spielStartenBean");

		bilderOrdnenAjax.setZeit(Integer.valueOf(request.getParameter("zeit")));
		bilderOrdnenAjax.setVersuche(Integer.valueOf(request.getParameter("versuche")));
		
		NutzerViewBean aktuellerNutzer = (NutzerViewBean) request.getSession().getAttribute("nutzer");
		//NutzerBean aktuellerNutzer = (NutzerBean) request.getSession().getAttribute("nutzer");
		
		// In Datenbank eintragen
		persist(bilderOrdnenAjax, aktuellerNutzer);
	
		if(bilderOrdnenAjax.getGewertet().equals("gewertetAn")) {
				persist2(bilderOrdnenAjax, aktuellerNutzer);
			//log("HAT GEKLAPPT");	
		}
		
	}
	

	private void persist(SpielStartenBean bilderOrdnenAjax, NutzerViewBean aktuellerNutzer) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"INSERT INTO bilderordnen (nutzer, kategorie, schwierigkeit, isgelistet, istimer, zeit, versuche, uhrzeit) VALUES (?,?,?,?,?,?,?,NOW());")) {
		
				pstmt.setString(1, aktuellerNutzer.getName());
				pstmt.setString(2, bilderOrdnenAjax.getSpielart());
				pstmt.setString(3, bilderOrdnenAjax.getSchwierigkeit());
				pstmt.setString(4, bilderOrdnenAjax.getGewertet());
				pstmt.setString(5, bilderOrdnenAjax.getTimer());
				pstmt.setInt(6, bilderOrdnenAjax.getZeit());
				pstmt.setInt(7, bilderOrdnenAjax.getVersuche());
				
			pstmt.executeUpdate();
			//log("HAT GEKLAPPT: "+aktuellerNutzer.getName());
			
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}

	}
	

	private void persist2(SpielStartenBean bilderOrdnenAjax, NutzerViewBean aktuellerNutzer) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"UPDATE nutzer SET punkte = punkte + ? WHERE name = ?;")) {
			
			int zeit = bilderOrdnenAjax.getZeit();
			int versuche = bilderOrdnenAjax.getVersuche();
			
			String schwierigkeit = bilderOrdnenAjax.getSchwierigkeit();
			
			if(schwierigkeit.equals("leicht")) {
				if(zeit <= 15 && versuche <= 8) {
					pstmt.setInt(1, 2);
				} else if(zeit <= 20 && versuche <= 9) {
					pstmt.setInt(1, 1);
				} else {
					pstmt.setInt(1, 0);
				}
			} else if(schwierigkeit.equals("mittel")) {
				if(zeit <= 18 && versuche <= 12) {
					pstmt.setInt(1, 3);
				} else if(zeit <= 23 && versuche <= 14) {
					pstmt.setInt(1, 2);
				} else {
					pstmt.setInt(1, 1);
				}
			} else if(schwierigkeit.equals("schwer")) {
				if(zeit <= 25 && versuche <= 16) {
					pstmt.setInt(1, 4);
				} else if(zeit <= 30 && versuche <= 19) {
					pstmt.setInt(1, 3);
				} else {
					pstmt.setInt(1, 2);
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
