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

import beans.SpielBilderMemorieBean;
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

@WebServlet("/BildHochladenServlet")
@MultipartConfig(maxFileSize = 128 * 128 * 4, maxRequestSize = 128 * 128 * 4 * 4, location = "/tmp", fileSizeThreshold = 128 * 128)

public class BildHochladenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)   
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());

		// Neues Objekt erstellen, um Bild zu speichern
		SpielBilderMemorieBean spielBilderMemorieBean = new SpielBilderMemorieBean();

		// Kategorie aus Request entgegennehmen
		String kategorie = request.getParameter("kategorieWahl");
		spielBilderMemorieBean.setBild1Kategorie(kategorie);

		// Logausgabe über empfangene Parts
		for (Part part : request.getParts()) {
			log("Part received: " + part.getName());
			if (part.getSubmittedFileName() != null)
				log("Filename written via BinaryStream: " + part.getSubmittedFileName());
		}

		// Filebehandlung
		Part filepart = request.getPart("image");
		spielBilderMemorieBean.setBild1Stream(filepart.getSubmittedFileName());

		// Abfrage, ob Kategorie bereits vorhanden ist
		boolean kategorieVorhanden;
		kategorieVorhanden = read(spielBilderMemorieBean);

		// Wenn Kategorie vorhanden: Bild in Datenbank speichern
		if (kategorieVorhanden) {
			bildSpeichern(spielBilderMemorieBean, filepart);
		// Wenn Kategorie nicht vorhanden: Neue Kategorie anlegen und Bild in Datenbank speichern	
		} else {
			kategorieSpeichern(spielBilderMemorieBean, filepart);
			bildSpeichern(spielBilderMemorieBean, filepart);
		}

		// Infos werden für mehrere Requests innerhalb einer Bean gespeichert
		final HttpSession session = request.getSession();
		session.setAttribute("kategorie", kategorie);
		session.setAttribute("datenDB", spielBilderMemorieBean);

		// Weiterleiten an JSP
		final RequestDispatcher dispatcher = request.getRequestDispatcher("html/verwaltungsseiten/spielekonfigurator.jsp");
		dispatcher.forward(request, response);

	}

	// Auslesen, ob Kategorie bereits vorhanden ist
	private boolean read(SpielBilderMemorieBean spielBilderMemorieBean) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("Select kategorie from wort where kategorie = (?)")) {

			pstmt.setString(1, spielBilderMemorieBean.getBild1Kategorie());
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs != null && rs.next()) {
					return true;
				}
				return false;
			}

		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}

	}

	// Neue Kategorie in der Datenbank anlegen
	private void kategorieSpeichern(SpielBilderMemorieBean spielBilderMemorieBean, Part filepart) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("INSERT INTO wort (kategorie) VALUES (?)")) {

			pstmt.setString(1, spielBilderMemorieBean.getBild1Kategorie());
			pstmt.executeUpdate();

		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}

	}

	// Bild in der Datenbank speichern
	private void bildSpeichern(SpielBilderMemorieBean spielBilderMemorieBean, Part filepart) throws ServletException {
		// DB-Zugriff
		
		// Name der Spalte, der automatisch generiert wird
		String[] generatedKeys = new String[] { "id" }; 

		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(

						"INSERT INTO bild (kategorie, image) VALUES (?,?)", generatedKeys)) {

			pstmt.setString(1, spielBilderMemorieBean.getBild1Kategorie());
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)   
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
