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
 * Servlet implementation class BestenlisteServlet
 */

@WebServlet("/BestenlisteServlet")

public class BestenlisteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());

		//-------------------------------------------------
		//---------- Bildermemorie   ----------------------
		//-------------------------------------------------		
		ArrayList<Bestenliste> bestenlisteBilderMemorieAjax = new ArrayList<>();

		// Liste mit Nutzer befüllen, absteigend nach Gesamtpunktezahl Bildermemorie
		bestenlisteBilderMemorieAjax = readPunkteBilderMemorie(bestenlisteBilderMemorieAjax);

		// Für jeden Spieler Anzahl der Spiele und durchschnittliche Spielzeiten (je nach Schwierigkeitsgrad) auslesen 
		for (Bestenliste b : bestenlisteBilderMemorieAjax) {
			spieleInsgesamtBilderMemorie(b);
		}

		// Infos werden nur für diesen Request speichern
		request.setAttribute("bestenlisteBilderMemorieAjax", bestenlisteBilderMemorieAjax);

		//-------------------------------------------------
		//---------- Bilder ordnen   ----------------------
		//-------------------------------------------------	
		ArrayList<Bestenliste> bestenlisteBilderOrdnenAjax = new ArrayList<Bestenliste>();

		// Liste mit Nutzer befüllen, absteigend nach Gesamtpunktezahl Bilder ordnen
		bestenlisteBilderOrdnenAjax = readPunkteBilderOrdnen(bestenlisteBilderOrdnenAjax);

		// Für jeden Spieler Anzahl der Spiele und durchschnittliche Spielzeiten (je nach Schwierigkeitsgrad) auslesen 
		for (Bestenliste b : bestenlisteBilderOrdnenAjax) {
			spieleInsgesamtBilderOrdnen(b);
		}

		// Infos werden nur für diesen Request speichern
		request.setAttribute("bestenlisteBilderOrdnenAjax", bestenlisteBilderOrdnenAjax);

		//-------------------------------------------------
		//---------- 4 Bilder 1 Wort   --------------------
		//-------------------------------------------------	
		ArrayList<Bestenliste> bestenlisteBilderWortAjax = new ArrayList<>();

		// Liste mit Nutzer befüllen, absteigend nach Gesamtpunktezahl 4 Bilder 1 Wort
		bestenlisteBilderWortAjax = readPunkteBilderBilderWort(bestenlisteBilderWortAjax);

		// Für jeden Spieler Anzahl der Spiele und durchschnittliche Spielzeiten (je nach Schwierigkeitsgrad) auslesen 
		for (Bestenliste b : bestenlisteBilderWortAjax) {
			spieleInsgesamtBilderWort(b);
		}

		// Infos werden nur für diesen Request speichern
		request.setAttribute("bestenlisteBilderWortAjax", bestenlisteBilderWortAjax);

		//-------------------------------------------------
		//---------- Mathe   ------------------------------
		//-------------------------------------------------	
		ArrayList<Bestenliste> bestenlisteMatheAjax = new ArrayList<>();

		// Liste mit Nutzer befüllen, absteigend nach Gesamtpunktezahl Mathe
		bestenlisteMatheAjax = readPunkteMathe(bestenlisteMatheAjax);

		// Für jeden Spieler Anzahl der Spiele und durchschnittliche Spielzeiten (je nach Schwierigkeitsgrad) auslesen 
		for (Bestenliste b : bestenlisteMatheAjax) {
			spieleInsgesamtMathe(b);
		}

		// Infos werden nur für diesen Request speichern
		request.setAttribute("bestenlisteMatheAjax", bestenlisteMatheAjax);

		//-------------------------------------------------
		//---------- Jump n run   -------------------------
		//-------------------------------------------------	
		ArrayList<Bestenliste> bestenlisteJumpnrunAjax = new ArrayList<>();

		// Liste mit Nutzer befüllen, absteigend nach Gesamtpunktezahl Jump n run
		bestenlisteJumpnrunAjax = readPunkteJumpnrun(bestenlisteJumpnrunAjax);

		// Für jeden Spieler Anzahl der Spiele und durchschnittliche Spielzeiten (je nach Schwierigkeitsgrad) auslesen 
		for (Bestenliste b : bestenlisteJumpnrunAjax) {
			spieleInsgesamtJumpnrun(b);
		}

		// Infos werden nur für diesen Request speichern
		request.setAttribute("bestenlisteJumpnrunAjax", bestenlisteJumpnrunAjax);

		// Weiterleiten an JSP
		final RequestDispatcher dispatcher = request.getRequestDispatcher("html/hauptseiten/bestenliste.jsp");
		dispatcher.forward(request, response);

	}

	// Anzahl der Bildermemorie-Spiele und durchschnittliche Spielzeiten (je nach Schwierigkeitsgrad) auslesen
	private void spieleInsgesamtBilderMemorie(Bestenliste b) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT COUNT(*) AS spiele, "
						+ "(SELECT (SUM(zeit)/COUNT(zeit)) FROM bildermemorie WHERE schwierigkeit = 'leicht' AND nutzer = ?) as zeitLeicht, "
						+ "(SELECT (SUM(zeit)/COUNT(zeit)) FROM bildermemorie WHERE schwierigkeit = 'mittel' AND nutzer = ?) as zeitMittel, "
						+ "(SELECT (SUM(zeit)/COUNT(zeit)) FROM bildermemorie WHERE schwierigkeit = 'schwer' AND nutzer = ?) as zeitSchwer "
						+ "FROM bildermemorie WHERE nutzer = ? AND isGelistet = 'gewertetAn' "
						+ "ORDER BY zeitLeicht ASC, zeitMittel ASC, zeitSchwer ASC;")) {

			pstmt.setString(1, b.getNutzer());
			pstmt.setString(2, b.getNutzer());
			pstmt.setString(3, b.getNutzer());
			pstmt.setString(4, b.getNutzer());
			// pstmt.setString(5, "bildermemorie") -> geht nicht

			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs != null && rs.next()) {

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

	// Anzahl der Bilder ordnen-Spiele und durchschnittliche Spielzeiten (je nach Schwierigkeitsgrad) auslesen
	private void spieleInsgesamtBilderOrdnen(Bestenliste b) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT COUNT(*) AS spiele, "
						+ "(SELECT (SUM(zeit)/COUNT(zeit)) FROM bilderordnen WHERE schwierigkeit = 'leicht' AND nutzer = ?) as zeitLeicht, "
						+ "(SELECT (SUM(zeit)/COUNT(zeit)) FROM bilderordnen WHERE schwierigkeit = 'mittel' AND nutzer = ?) as zeitMittel, "
						+ "(SELECT (SUM(zeit)/COUNT(zeit)) FROM bilderordnen WHERE schwierigkeit = 'schwer' AND nutzer = ?) as zeitSchwer "
						+ "FROM bilderordnen WHERE nutzer = ? AND isGelistet = 'gewertetAn' "
						+ "ORDER BY zeitLeicht ASC, zeitMittel ASC, zeitSchwer ASC;")) {

			pstmt.setString(1, b.getNutzer());
			pstmt.setString(2, b.getNutzer());
			pstmt.setString(3, b.getNutzer());
			pstmt.setString(4, b.getNutzer());
			// pstmt.setString(5, "bilderordnen") -> geht nicht

			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs != null && rs.next()) {

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

	// Anzahl der 4 Bilder 1 Wort-Spiele und durchschnittliche Spielzeiten (je nach Schwierigkeitsgrad) auslesen
	private void spieleInsgesamtBilderWort(Bestenliste b) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT COUNT(*) AS spiele, "
						+ "(SELECT (SUM(versuche)/COUNT(versuche)) FROM bilderwort WHERE schwierigkeit = 'leicht' AND nutzer = ?) as zeitLeicht, "
						+ "(SELECT (SUM(versuche)/COUNT(versuche)) FROM bilderwort WHERE schwierigkeit = 'mittel' AND nutzer = ?) as zeitMittel, "
						+ "(SELECT (SUM(versuche)/COUNT(versuche)) FROM bilderwort WHERE schwierigkeit = 'schwer' AND nutzer = ?) as zeitSchwer "
						+ "FROM bilderwort WHERE nutzer = ? AND isGelistet = 'gewertetAn' "
						+ "ORDER BY zeitLeicht ASC, zeitMittel ASC, zeitSchwer ASC;")) {

			pstmt.setString(1, b.getNutzer());
			pstmt.setString(2, b.getNutzer());
			pstmt.setString(3, b.getNutzer());
			pstmt.setString(4, b.getNutzer());
			// pstmt.setString(5, "bildermemorie") -> geht nicht

			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs != null && rs.next()) {

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

	// Anzahl der Mathe-Spiele und durchschnittliche Spielzeiten (je nach Schwierigkeitsgrad) auslesen
	private void spieleInsgesamtMathe(Bestenliste b) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT COUNT(*) AS spiele, "
						+ "(SELECT (SUM(versuche)/COUNT(versuche)) FROM mathe WHERE schwierigkeit = 'leicht' AND nutzer = ?) as zeitLeicht, "
						+ "(SELECT (SUM(versuche)/COUNT(versuche)) FROM mathe WHERE schwierigkeit = 'mittel' AND nutzer = ?) as zeitMittel, "
						+ "(SELECT (SUM(versuche)/COUNT(versuche)) FROM mathe WHERE schwierigkeit = 'schwer' AND nutzer = ?) as zeitSchwer "
						+ "FROM mathe WHERE nutzer = ? AND isGelistet = 'gewertetAn' "
						+ "ORDER BY zeitLeicht ASC, zeitMittel ASC, zeitSchwer ASC;")) {

			pstmt.setString(1, b.getNutzer());
			pstmt.setString(2, b.getNutzer());
			pstmt.setString(3, b.getNutzer());
			pstmt.setString(4, b.getNutzer());
			// pstmt.setString(5, "bildermemorie") -> geht nicht

			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs != null && rs.next()) {

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

	// Anzahl der Jump n run-Spiele und durchschnittliche Spielzeiten (je nach Schwierigkeitsgrad) auslesen
	private void spieleInsgesamtJumpnrun(Bestenliste b) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT COUNT(*) AS spiele, "
						+ "(SELECT (SUM(zeit)/COUNT(zeit)) FROM jumpnrun WHERE schwierigkeit = 'leicht' AND nutzer = ?) as zeitLeicht, "
						+ "(SELECT (SUM(zeit)/COUNT(zeit)) FROM jumpnrun WHERE schwierigkeit = 'mittel' AND nutzer = ?) as zeitMittel, "
						+ "(SELECT (SUM(zeit)/COUNT(zeit)) FROM jumpnrun WHERE schwierigkeit = 'schwer' AND nutzer = ?) as zeitSchwer "
						+ "FROM jumpnrun WHERE nutzer = ? AND isGelistet = 'gewertetAn' "
						+ "ORDER BY zeitLeicht ASC, zeitMittel ASC, zeitSchwer ASC;")) {

			pstmt.setString(1, b.getNutzer());
			pstmt.setString(2, b.getNutzer());
			pstmt.setString(3, b.getNutzer());
			pstmt.setString(4, b.getNutzer());
			// pstmt.setString(5, "bildermemorie") -> geht nicht

			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs != null && rs.next()) {

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

	// Erreichte Gesamtpunke Bildermemorie auslesen
	private ArrayList<Bestenliste> readPunkteBilderMemorie(ArrayList<Bestenliste> bestenlisteAjax)
			throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT name, punkteBilderMemorie FROM nutzer WHERE admin = 0 ORDER BY punkteBilderMemorie DESC, name ASC;")) {

			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs != null && rs.next()) {
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

	// Erreichte Gesamtpunke Bilder ordnen auslesen
	private ArrayList<Bestenliste> readPunkteBilderOrdnen(ArrayList<Bestenliste> bestenlisteAjax)
			throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT name, punkteBilderOrdnen FROM nutzer WHERE admin = 0 ORDER BY punkteBilderOrdnen DESC, name ASC;")) {

			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs != null && rs.next()) {
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

	// Erreichte Gesamtpunke 4 Bilder 1 Wort auslesen
	private ArrayList<Bestenliste> readPunkteBilderBilderWort(ArrayList<Bestenliste> bestenlisteAjax)
			throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT name, punkteBilderBilderWort FROM nutzer WHERE admin = 0 ORDER BY punkteBilderBilderWort DESC, name ASC;")) {

			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs != null && rs.next()) {
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

	// Erreichte Gesamtpunke Mathe auslesen
	private ArrayList<Bestenliste> readPunkteMathe(ArrayList<Bestenliste> bestenlisteAjax) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT name, punkteMathe FROM nutzer WHERE admin = 0 ORDER BY punkteMathe DESC, name ASC;")) {

			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs != null && rs.next()) {
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

	// Erreichte Gesamtpunke Jump n run auslesen
	private ArrayList<Bestenliste> readPunkteJumpnrun(ArrayList<Bestenliste> bestenlisteAjax) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT name, punkteJumpnrun FROM nutzer WHERE admin = 0 ORDER BY punkteJumpnrun DESC, name ASC;")) {

			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs != null && rs.next()) {
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)    
	 *
	 *
	 *	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	 *		doGet(request, response);
	 *	}
	 */

}
