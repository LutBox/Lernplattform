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
@WebServlet("/BestenlisteServlet")

public class BestenlisteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BestenlisteServlet() {
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
		
		// ---------- Bildermemorie ----------
		ArrayList<Bestenliste> bestenlisteBilderMemorieAjax = new ArrayList<Bestenliste>();
		
		// Alle Nutzer auslesen
		bestenlisteBilderMemorieAjax = readPunkteBilderMemorie(bestenlisteBilderMemorieAjax);
		
		for(Bestenliste b : bestenlisteBilderMemorieAjax) {
			spieleInsgesamtBilderMemorie(b);
		}
		
        request.setAttribute("bestenlisteBilderMemorieAjax", bestenlisteBilderMemorieAjax);

        // ---------- Bilder-Ordnen ----------
        ArrayList<Bestenliste> bestenlisteBilderOrdnenAjax = new ArrayList<Bestenliste>();
		
		// Alle Nutzer auslesen
        bestenlisteBilderOrdnenAjax = readPunkteBilderOrdnen(bestenlisteBilderOrdnenAjax);
		
		for(Bestenliste b : bestenlisteBilderOrdnenAjax) {
			spieleInsgesamtBilderOrdnen(b);
		}
		
        request.setAttribute("bestenlisteBilderOrdnenAjax", bestenlisteBilderOrdnenAjax);
        
        // ---------- Bilder-Wort ----------
        ArrayList<Bestenliste> bestenlisteBilderWortAjax = new ArrayList<Bestenliste>();
		
		// Alle Nutzer auslesen
        bestenlisteBilderWortAjax = readPunkteBilderBilderWort(bestenlisteBilderWortAjax);
		
		for(Bestenliste b : bestenlisteBilderWortAjax) {
			spieleInsgesamtBilderWort(b);
		}
		
        request.setAttribute("bestenlisteBilderWortAjax", bestenlisteBilderWortAjax);
        
        // ---------- Mathe ----------
        ArrayList<Bestenliste> bestenlisteMatheAjax = new ArrayList<Bestenliste>();
		
		// Alle Nutzer auslesen
        bestenlisteMatheAjax = readPunkteMathe(bestenlisteMatheAjax);
		
		for(Bestenliste b : bestenlisteMatheAjax) {
			spieleInsgesamtMathe(b);
		}
		
        request.setAttribute("bestenlisteMatheAjax", bestenlisteMatheAjax);
        
        // ---------- Jumpnrun ----------
        ArrayList<Bestenliste> bestenlisteJumpnrunAjax = new ArrayList<Bestenliste>();
		
		// Alle Nutzer auslesen
        bestenlisteJumpnrunAjax = readPunkteJumpnrun(bestenlisteJumpnrunAjax);
		
		for(Bestenliste b : bestenlisteJumpnrunAjax) {
			spieleInsgesamtJumpnrun(b);
		}
		
        request.setAttribute("bestenlisteJumpnrunAjax", bestenlisteJumpnrunAjax);

		//Weiterleiten an JSP
		final RequestDispatcher dispatcher = request.getRequestDispatcher("html/hauptseiten/bestenliste.jsp");
		dispatcher.forward(request, response);

	}
	
	private void spieleInsgesamtBilderMemorie(Bestenliste b) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT COUNT(*) AS spiele, "
						+ "(SELECT (SUM(zeit)/COUNT(zeit)) FROM bildermemorie WHERE schwierigkeit = 'leicht' AND nutzer = ?) as zeitLeicht, "
						+ "(SELECT (SUM(zeit)/COUNT(zeit)) FROM bildermemorie WHERE schwierigkeit = 'mittel' AND nutzer = ?) as zeitMittel, "
						+ "(SELECT (SUM(zeit)/COUNT(zeit)) FROM bildermemorie WHERE schwierigkeit = 'schwer' AND nutzer = ?) as zeitSchwer "
						+ "FROM bildermemorie WHERE nutzer = ? AND isGelistet = 'gewertetAn' "
						+ "ORDER BY zeitLeicht ASC, zeitMittel ASC, zeitSchwer ASC;")) {
			
		pstmt.setString(1, b.getNutzer());
		pstmt.setString(2, b.getNutzer());
		pstmt.setString(3, b.getNutzer());
		pstmt.setString(4, b.getNutzer());
		//pstmt.setString(5, "bildermemorie") -> geht nicht
		
		//log(b.getNutzer());
			try(ResultSet rs = pstmt.executeQuery()) {
				if (rs!= null && rs.next()) {
					
					b.setSpieleInsgesamt(rs.getInt("spiele"));
					b.setDurchschnittZeitLeicht(rs.getInt("zeitLeicht"));
					b.setDurchschnittZeitMittel(rs.getInt("zeitMittel"));
					b.setDurchschnittZeitSchwer(rs.getInt("zeitSchwer"));
				}
			}
				
						
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
	}
	
	private void spieleInsgesamtBilderOrdnen(Bestenliste b) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT COUNT(*) AS spiele, "
						+ "(SELECT (SUM(zeit)/COUNT(zeit)) FROM bilderordnen WHERE schwierigkeit = 'leicht' AND nutzer = ?) as zeitLeicht, "
						+ "(SELECT (SUM(zeit)/COUNT(zeit)) FROM bilderordnen WHERE schwierigkeit = 'mittel' AND nutzer = ?) as zeitMittel, "
						+ "(SELECT (SUM(zeit)/COUNT(zeit)) FROM bilderordnen WHERE schwierigkeit = 'schwer' AND nutzer = ?) as zeitSchwer "
						+ "FROM bilderordnen WHERE nutzer = ? AND isGelistet = 'gewertetAn' "
						+ "ORDER BY zeitLeicht ASC, zeitMittel ASC, zeitSchwer ASC;")) {
			
		pstmt.setString(1, b.getNutzer());
		pstmt.setString(2, b.getNutzer());
		pstmt.setString(3, b.getNutzer());
		pstmt.setString(4, b.getNutzer());
		//pstmt.setString(5, "bilderordnen") -> geht nicht
		
		//log(b.getNutzer());
			try(ResultSet rs = pstmt.executeQuery()) {
				if (rs!= null && rs.next()) {
					
					b.setSpieleInsgesamt(rs.getInt("spiele"));
					b.setDurchschnittZeitLeicht(rs.getInt("zeitLeicht"));
					b.setDurchschnittZeitMittel(rs.getInt("zeitMittel"));
					b.setDurchschnittZeitSchwer(rs.getInt("zeitSchwer"));
				}
			}
				
						
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
	}
	
	private void spieleInsgesamtBilderWort(Bestenliste b) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT COUNT(*) AS spiele, "
						+ "(SELECT (SUM(zeit)/COUNT(zeit)) FROM bilderwort WHERE schwierigkeit = 'leicht' AND nutzer = ?) as zeitLeicht, "
						+ "(SELECT (SUM(zeit)/COUNT(zeit)) FROM bilderwort WHERE schwierigkeit = 'mittel' AND nutzer = ?) as zeitMittel, "
						+ "(SELECT (SUM(zeit)/COUNT(zeit)) FROM bilderwort WHERE schwierigkeit = 'schwer' AND nutzer = ?) as zeitSchwer "
						+ "FROM bilderwort WHERE nutzer = ? AND isGelistet = 'gewertetAn' "
						+ "ORDER BY zeitLeicht ASC, zeitMittel ASC, zeitSchwer ASC;")) {
			
		pstmt.setString(1, b.getNutzer());
		pstmt.setString(2, b.getNutzer());
		pstmt.setString(3, b.getNutzer());
		pstmt.setString(4, b.getNutzer());
		//pstmt.setString(5, "bildermemorie") -> geht nicht
		
		//log(b.getNutzer());
			try(ResultSet rs = pstmt.executeQuery()) {
				if (rs!= null && rs.next()) {
					
					b.setSpieleInsgesamt(rs.getInt("spiele"));
					b.setDurchschnittZeitLeicht(rs.getInt("zeitLeicht"));
					b.setDurchschnittZeitMittel(rs.getInt("zeitMittel"));
					b.setDurchschnittZeitSchwer(rs.getInt("zeitSchwer"));
				}
			}
				
						
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
	}
	
	private void spieleInsgesamtMathe(Bestenliste b) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT COUNT(*) AS spiele, "
						+ "(SELECT (SUM(versuche)/COUNT(versuche)) FROM mathe WHERE schwierigkeit = 'leicht' AND nutzer = ?) as zeitLeicht, "
						+ "(SELECT (SUM(versuche)/COUNT(versuche)) FROM mathe WHERE schwierigkeit = 'mittel' AND nutzer = ?) as zeitMittel, "
						+ "(SELECT (SUM(versuche)/COUNT(versuche)) FROM mathe WHERE schwierigkeit = 'schwer' AND nutzer = ?) as zeitSchwer "
						+ "FROM mathe WHERE nutzer = ? AND isGelistet = 'gewertetAn' "
						+ "ORDER BY zeitLeicht ASC, zeitMittel ASC, zeitSchwer ASC;")) {
			
		pstmt.setString(1, b.getNutzer());
		pstmt.setString(2, b.getNutzer());
		pstmt.setString(3, b.getNutzer());
		pstmt.setString(4, b.getNutzer());
		//pstmt.setString(5, "bildermemorie") -> geht nicht
		
		//log(b.getNutzer());
			try(ResultSet rs = pstmt.executeQuery()) {
				if (rs!= null && rs.next()) {
					
					b.setSpieleInsgesamt(rs.getInt("spiele"));
					b.setDurchschnittZeitLeicht(rs.getInt("zeitLeicht"));
					b.setDurchschnittZeitMittel(rs.getInt("zeitMittel"));
					b.setDurchschnittZeitSchwer(rs.getInt("zeitSchwer"));
				}
			}
				
						
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
	}
	
	private void spieleInsgesamtJumpnrun(Bestenliste b) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT COUNT(*) AS spiele, "
						+ "(SELECT (SUM(zeit)/COUNT(zeit)) FROM jumpnrun WHERE schwierigkeit = 'leicht' AND nutzer = ?) as zeitLeicht, "
						+ "(SELECT (SUM(zeit)/COUNT(zeit)) FROM jumpnrun WHERE schwierigkeit = 'mittel' AND nutzer = ?) as zeitMittel, "
						+ "(SELECT (SUM(zeit)/COUNT(zeit)) FROM jumpnrun WHERE schwierigkeit = 'schwer' AND nutzer = ?) as zeitSchwer "
						+ "FROM jumpnrun WHERE nutzer = ? AND isGelistet = 'gewertetAn' "
						+ "ORDER BY zeitLeicht ASC, zeitMittel ASC, zeitSchwer ASC;")) {
			
		pstmt.setString(1, b.getNutzer());
		pstmt.setString(2, b.getNutzer());
		pstmt.setString(3, b.getNutzer());
		pstmt.setString(4, b.getNutzer());
		//pstmt.setString(5, "bildermemorie") -> geht nicht
		
		//log(b.getNutzer());
			try(ResultSet rs = pstmt.executeQuery()) {
				if (rs!= null && rs.next()) {
					
					b.setSpieleInsgesamt(rs.getInt("spiele"));
					b.setDurchschnittZeitLeicht(rs.getInt("zeitLeicht"));
					b.setDurchschnittZeitMittel(rs.getInt("zeitMittel"));
					b.setDurchschnittZeitSchwer(rs.getInt("zeitSchwer"));
				}
			}
				
						
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
	}

	private ArrayList<Bestenliste> readPunkteBilderMemorie(ArrayList<Bestenliste> bestenlisteAjax) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT name, punkteBilderMemorie FROM nutzer WHERE admin = 0 ORDER BY punkteBilderMemorie DESC, name ASC;")) {
		
			try(ResultSet rs = pstmt.executeQuery()) {
				while (rs!= null && rs.next()) {
					Bestenliste bestenliste = new Bestenliste();
					bestenliste.setNutzer(rs.getString("name"));
					bestenliste.setPunkteBilderMemorie(rs.getInt("punkteBilderMemorie"));
					bestenlisteAjax.add(bestenliste);
				}
			}
				
			
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		return bestenlisteAjax;
	}
	
	private ArrayList<Bestenliste> readPunkteBilderOrdnen(ArrayList<Bestenliste> bestenlisteAjax) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT name, punkteBilderOrdnen FROM nutzer WHERE admin = 0 ORDER BY punkteBilderOrdnen DESC, name ASC;")) {
		
			try(ResultSet rs = pstmt.executeQuery()) {
				while (rs!= null && rs.next()) {
					Bestenliste bestenliste = new Bestenliste();
					bestenliste.setNutzer(rs.getString("name"));
					bestenliste.setPunkteBilderOrdnen(rs.getInt("punkteBilderOrdnen"));
					bestenlisteAjax.add(bestenliste);
				}
			}
				
			
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		return bestenlisteAjax;
	}
	
	private ArrayList<Bestenliste> readPunkteBilderBilderWort(ArrayList<Bestenliste> bestenlisteAjax) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT name, punkteBilderBilderWort FROM nutzer WHERE admin = 0 ORDER BY punkteBilderBilderWort DESC, name ASC;")) {
		
			try(ResultSet rs = pstmt.executeQuery()) {
				while (rs!= null && rs.next()) {
					Bestenliste bestenliste = new Bestenliste();
					bestenliste.setNutzer(rs.getString("name"));
					bestenliste.setPunkteBilderBilderWort(rs.getInt("punkteBilderBilderWort"));
					bestenlisteAjax.add(bestenliste);
				}
			}
				
			
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		return bestenlisteAjax;
	}
	
	private ArrayList<Bestenliste> readPunkteMathe(ArrayList<Bestenliste> bestenlisteAjax) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT name, punkteMathe FROM nutzer WHERE admin = 0 ORDER BY punkteMathe DESC, name ASC;")) {
		
			try(ResultSet rs = pstmt.executeQuery()) {
				while (rs!= null && rs.next()) {
					Bestenliste bestenliste = new Bestenliste();
					bestenliste.setNutzer(rs.getString("name"));
					bestenliste.setPunkteMathe(rs.getInt("punkteMathe"));
					bestenlisteAjax.add(bestenliste);
				}
			}
				
			
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		return bestenlisteAjax;
	}
	
	private ArrayList<Bestenliste> readPunkteJumpnrun(ArrayList<Bestenliste> bestenlisteAjax) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT name, punkteJumpnrun FROM nutzer WHERE admin = 0 ORDER BY punkteJumpnrun DESC, name ASC;")) {
		
			try(ResultSet rs = pstmt.executeQuery()) {
				while (rs!= null && rs.next()) {
					Bestenliste bestenliste = new Bestenliste();
					bestenliste.setNutzer(rs.getString("name"));
					bestenliste.setPunkteJumpnrun(rs.getInt("punkteJumpnrun"));
					bestenlisteAjax.add(bestenliste);
				}
			}
				
			
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		return bestenlisteAjax;
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
