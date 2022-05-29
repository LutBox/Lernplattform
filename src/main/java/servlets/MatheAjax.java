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
 * 
 */
@WebServlet("/MatheAjax")

public class MatheAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MatheAjax() {
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
		SpielStartenBean matheAjax = (SpielStartenBean) request.getSession().getAttribute("spielStartenBean");

		matheAjax.setZeit(Integer.valueOf(request.getParameter("zeit")));
		matheAjax.setVersuche(Integer.valueOf(request.getParameter("versuche")));
		
		NutzerViewBean aktuellerNutzer = (NutzerViewBean) request.getSession().getAttribute("nutzer");
		//NutzerBean aktuellerNutzer = (NutzerBean) request.getSession().getAttribute("nutzer");
		
		// In Datenbank eintragen
		persist(matheAjax, aktuellerNutzer);
	
		if(matheAjax.getGewertet().equals("gewertetAn")) {
				persist2(matheAjax, aktuellerNutzer);
			//log("HAT GEKLAPPT");	
		}
		
	}
	

	private void persist(SpielStartenBean matheAjax, NutzerViewBean aktuellerNutzer) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"INSERT INTO mathe (nutzer, kategorie, schwierigkeit, isgelistet, istimer, zeit, versuche, uhrzeit) VALUES (?,?,?,?,?,?,?,NOW());")) {
		
				pstmt.setString(1, aktuellerNutzer.getName());
				pstmt.setString(2, matheAjax.getSpielart());
				pstmt.setString(3, matheAjax.getSchwierigkeit());
				pstmt.setString(4, matheAjax.getGewertet());
				pstmt.setString(5, matheAjax.getTimer());
				pstmt.setInt(6, matheAjax.getZeit());
				pstmt.setInt(7, matheAjax.getVersuche());
				
			pstmt.executeUpdate();
			//log("HAT GEKLAPPT: "+aktuellerNutzer.getName());
			
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}

	}
	

	private void persist2(SpielStartenBean matheAjax, NutzerViewBean aktuellerNutzer) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"UPDATE nutzer SET punkteMathe = punkteMathe + ? WHERE name = ?;")) {
			
			int zeit = matheAjax.getZeit();
			int versuche = matheAjax.getVersuche();
			
			String schwierigkeit = matheAjax.getSchwierigkeit();
			
			if(schwierigkeit.equals("leicht")) {
				if(versuche >= 45) {
					pstmt.setInt(1, 2);
				} else if(versuche >= 30) {
					pstmt.setInt(1, 1);
				} else {
					pstmt.setInt(1, 0);
				}
			} else if(schwierigkeit.equals("mittel")) {
				if(versuche >= 30) {
					pstmt.setInt(1, 3);
				} else if(versuche >= 20) {
					pstmt.setInt(1, 2);
				} else {
					pstmt.setInt(1, 1);
				}
			} else if(schwierigkeit.equals("schwer")) {
				if(versuche >= 20) {
					pstmt.setInt(1, 4);
				} else if(versuche >= 10) {
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
		log("TEEEEEEEST");
		doGet(request, response);
	}

}
