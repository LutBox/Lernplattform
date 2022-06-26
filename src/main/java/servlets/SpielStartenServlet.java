//
//Erstellt von Lukas Theinert und Zohal
//

package servlets;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import java.util.Random;

import javax.sql.DataSource;

import beans.SpielBilderMemorieBean;
import beans.SpielBilderOrdnenBean;
import beans.SpielStartenBean;
import beans.SpielVierBilderEinWortBean;
import beans.VierBilderEinWortScoreBean;
import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class SpielStartenServlet
 */

@WebServlet("/SpielStartenServlet")
public class SpielStartenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	
	public SpielStartenServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response) 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());

		// Parameter aus Request holen und als String speichern
		String spielartServlet = request.getParameter("Spielart");
		String schwierigkeitServlet = request.getParameter("Schwierigkeit");

		// ---------- SERVLET ------------------------------
		// Attribute (Schwierigkeit & Spieleart) von gaming_main_page.jsp abholen
		// Infos werden nur für einen Request gespeichert
		request.setAttribute("schwierigkeitServlet", schwierigkeitServlet);
		request.setAttribute("spielartServlet", spielartServlet);

		// ---------- BEAN ------------------------------
		// Neues Bean-Objekt erstellen und Informationen speichern
		SpielStartenBean spielStartenBean = new SpielStartenBean();
		spielStartenBean.setSchwierigkeit(request.getParameter("Schwierigkeit"));
		spielStartenBean.setSpielart(request.getParameter("Spielart"));
		spielStartenBean.setTimer(request.getParameter("Timer"));
		spielStartenBean.setGewertet(request.getParameter("Gewertet"));

		// Infos werden für mehrere Requests in einer Session gespeichert 
		final HttpSession session = request.getSession();
		session.setAttribute("spielStartenBean", spielStartenBean);

		// Je nach ausgewählter Spielart an jeweilige JSP weiterleiten
		// -------------------------------------------------
		// ---------- Mathe ------------------------------
		// -------------------------------------------------
		if (spielartServlet.equals("mathe")) {
			final RequestDispatcher dispatcher = request.getRequestDispatcher("html/spieleseiten/spiel_mathe_starten.jsp");
			dispatcher.forward(request, response);

		// -------------------------------------------------
		// ---------- 4 Bilder 1 Wort --------------------
		// -------------------------------------------------
		} else if (spielartServlet.equals("bilderWort")) {
			// Clean up, damit die Punkte aus dem Spiel
			VierBilderEinWortScoreBean bean = new VierBilderEinWortScoreBean();
			//
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			bean.setSchwierigkeit(schwierigkeitServlet);
			bean.setGewertet(request.getParameter("Gewertet"));

			int sekunden = 60;
			if (schwierigkeitServlet.equals("mittel")) {
				sekunden = 45;
			}
			if (schwierigkeitServlet.equals("schwer")) {
				sekunden = 30;
			}
			// Formatierungsstring wird hier angepasst
			bean.setZeit(format.format(addSecondsToJavaUtilDate(new Date(), sekunden)));

			session.setAttribute("vierBilderEinWort", bean);

			// Aufruf von VierBilderEinWortServlet --> alles zurueckgesetzt
			response.sendRedirect("VierBilderEinWortServlet");

		// -------------------------------------------------
		// ---------- Bilder ordnen ----------------------
		// -------------------------------------------------
		} else if (spielartServlet.equals("bilderOrdnen")) {
			// 8 - 16 Zufällige Bilder in Bean speichern
			SpielBilderOrdnenBean spielBilderOrdnen;
			// Bilder aus Datenbank auslesen
			spielBilderOrdnen = spielBilderOrdnen();

			session.setAttribute("spielBilderOrdnen", spielBilderOrdnen);

			final RequestDispatcher dispatcher = request.getRequestDispatcher("html/spieleseiten/spiel_bilderOrdnen_starten.jsp");
			dispatcher.forward(request, response);

		// -------------------------------------------------
		// ---------- Bildermemorie ----------------------
		// -------------------------------------------------
		} else if (spielartServlet.equals("bilderMemorie")) {
			// 8 - 16 Zufällige Bilder in Bean speichern
			SpielBilderMemorieBean spielBilderMemorieBean;
			// Bilder aus Datenbank auslesen
			spielBilderMemorieBean = spielBilderMemorie();

			session.setAttribute("spielBilderMemorieBean", spielBilderMemorieBean);

			final RequestDispatcher dispatcher = request.getRequestDispatcher("html/spieleseiten/spiel_bilderMemorie_starten.jsp");
			dispatcher.forward(request, response);

		// -------------------------------------------------
		// ---------- Jump n run -------------------------
		// -------------------------------------------------
		} else if (spielartServlet.equals("jumpnrun")) {
			final RequestDispatcher dispatcher = request.getRequestDispatcher("html/spieleseiten/spiel_jumpnrun_starten.jsp");
			dispatcher.forward(request, response);

		// -------------------------------------------------
		// ---------- Zufall -----------------------------
		// -------------------------------------------------
		} else {
			int min = 2;
			int max = 5;
			Random random = new Random();
			int value = random.nextInt(max + min) + min;
			
			// Spiel: 4 Bilder 1 Wort -> Aus Zufallsgenerator ausgeschlossen, weil noch nicht fertig
			if (value == 1) {
				VierBilderEinWortScoreBean bean = new VierBilderEinWortScoreBean();
				DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				int sekunden = 60;
				if (schwierigkeitServlet.equals("mittel")) {
					sekunden = 45;
				}
				if (schwierigkeitServlet.equals("schwer")) {
					sekunden = 30;
				}

				bean.setZeit(format.format(addSecondsToJavaUtilDate(new Date(), sekunden)));

				session.setAttribute("vierBilderEinWort", bean);

				response.sendRedirect("VierBilderEinWortServlet");

			// Spiel: Mathe	
			} else if (value == 2) {
				final RequestDispatcher dispatcher = request.getRequestDispatcher("html/spieleseiten/spiel_mathe_starten.jsp");
				dispatcher.forward(request, response);

			// Spiel: Bilder ordnen	
			} else if (value == 3) {
				// 8 - 16 Zufällige Bilder in Bean speichern
				SpielBilderOrdnenBean spielBilderOrdnen;
				// Bilder aus der Datenbank auslesen
				spielBilderOrdnen = spielBilderOrdnen();

				session.setAttribute("spielBilderOrdnen", spielBilderOrdnen);

				final RequestDispatcher dispatcher = request.getRequestDispatcher("html/spieleseiten/spiel_bilderOrdnen_starten.jsp");
				dispatcher.forward(request, response);

			// Spiel: Bildermemorie	
			} else if (value == 4) {
				// 8 - 16 Zufällige Bilder in Bean speichern
				SpielBilderMemorieBean spielBilderMemorieBean;
				// Bilder aus der Datenbank auslesen
				spielBilderMemorieBean = spielBilderMemorie();

				session.setAttribute("spielBilderMemorieBean", spielBilderMemorieBean);

				final RequestDispatcher dispatcher = request.getRequestDispatcher("html/spieleseiten/spiel_bilderMemorie_starten.jsp");
				dispatcher.forward(request, response);

			// Spiel: Jump n run
			} else {
				final RequestDispatcher dispatcher = request.getRequestDispatcher("html/spieleseiten/spiel_jumpnrun_starten.jsp");
				dispatcher.forward(request, response);
			}
		}

	}

	// Quelle: https://www.baeldung.com/java-add-hours-date
	// Abgewandelt
	private Date addSecondsToJavaUtilDate(Date zeit, int seconds) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(zeit);
		calendar.add(Calendar.SECOND, seconds);
		return calendar.getTime();
	}

	public void spielMathe() {

	}

	// Bilder aus Datenbank auslesen
	public SpielBilderOrdnenBean spielBilderOrdnen() throws ServletException {
		int durchlauf = 0;
		SpielBilderOrdnenBean spielBilder = new SpielBilderOrdnenBean();

		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con
						.prepareStatement("SELECT * FROM bild GROUP BY(kategorie) ORDER BY RAND() LIMIT 16")) {

			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs != null && rs.next()) {
					durchlauf++;

					if (durchlauf == 1) {
						spielBilder.setBild1ID(rs.getLong("id"));
						spielBilder.setBild1Kategorie(rs.getString("kategorie"));
					} else if (durchlauf == 2) {
						spielBilder.setBild2ID(rs.getLong("id"));
						spielBilder.setBild2Kategorie(rs.getString("kategorie"));
					} else if (durchlauf == 3) {
						spielBilder.setBild3ID(rs.getLong("id"));
						spielBilder.setBild3Kategorie(rs.getString("kategorie"));
					} else if (durchlauf == 4) {
						spielBilder.setBild4ID(rs.getLong("id"));
						spielBilder.setBild4Kategorie(rs.getString("kategorie"));
					} else if (durchlauf == 5) {
						spielBilder.setBild5ID(rs.getLong("id"));
						spielBilder.setBild5Kategorie(rs.getString("kategorie"));
					} else if (durchlauf == 6) {
						spielBilder.setBild6ID(rs.getLong("id"));
						spielBilder.setBild6Kategorie(rs.getString("kategorie"));
					} else if (durchlauf == 7) {
						spielBilder.setBild7ID(rs.getLong("id"));
						spielBilder.setBild7Kategorie(rs.getString("kategorie"));
					} else if (durchlauf == 8) {
						spielBilder.setBild8ID(rs.getLong("id"));
						spielBilder.setBild8Kategorie(rs.getString("kategorie"));
					} else if (durchlauf == 9) {
						spielBilder.setBild9ID(rs.getLong("id"));
						spielBilder.setBild9Kategorie(rs.getString("kategorie"));
					} else if (durchlauf == 10) {
						spielBilder.setBild10ID(rs.getLong("id"));
						spielBilder.setBild10Kategorie(rs.getString("kategorie"));
					} else if (durchlauf == 11) {
						spielBilder.setBild11ID(rs.getLong("id"));
						spielBilder.setBild11Kategorie(rs.getString("kategorie"));
					} else if (durchlauf == 12) {
						spielBilder.setBild12ID(rs.getLong("id"));
						spielBilder.setBild12Kategorie(rs.getString("kategorie"));
					} else if (durchlauf == 13) {
						spielBilder.setBild13ID(rs.getLong("id"));
						spielBilder.setBild13Kategorie(rs.getString("kategorie"));
					} else if (durchlauf == 14) {
						spielBilder.setBild14ID(rs.getLong("id"));
						spielBilder.setBild14Kategorie(rs.getString("kategorie"));
					} else if (durchlauf == 15) {
						spielBilder.setBild15ID(rs.getLong("id"));
						spielBilder.setBild15Kategorie(rs.getString("kategorie"));
					} else {
						spielBilder.setBild16ID(rs.getLong("id"));
						spielBilder.setBild16Kategorie(rs.getString("kategorie"));
					}
				}
			}
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		return spielBilder;
	}

	// Bilder aus Datenbank auslesen
	private SpielBilderMemorieBean spielBilderMemorie() throws ServletException {
		int durchlauf = 0;
		SpielBilderMemorieBean spielBilder = new SpielBilderMemorieBean();

		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM bild ORDER BY RAND() LIMIT 16")) {

			try (ResultSet rs = pstmt.executeQuery()) {
				while (rs != null && rs.next()) {
					durchlauf++;

					if (durchlauf == 1) {
						spielBilder.setBild1ID(rs.getLong("id"));
					} else if (durchlauf == 2) {
						spielBilder.setBild2ID(rs.getLong("id"));
					} else if (durchlauf == 3) {
						spielBilder.setBild3ID(rs.getLong("id"));
					} else if (durchlauf == 4) {
						spielBilder.setBild4ID(rs.getLong("id"));
					} else if (durchlauf == 5) {
						spielBilder.setBild5ID(rs.getLong("id"));
					} else if (durchlauf == 6) {
						spielBilder.setBild6ID(rs.getLong("id"));
					} else if (durchlauf == 7) {
						spielBilder.setBild7ID(rs.getLong("id"));
					} else if (durchlauf == 8) {
						spielBilder.setBild8ID(rs.getLong("id"));
					} else if (durchlauf == 9) {
						spielBilder.setBild9ID(rs.getLong("id"));
					} else if (durchlauf == 10) {
						spielBilder.setBild10ID(rs.getLong("id"));
					} else if (durchlauf == 11) {
						spielBilder.setBild11ID(rs.getLong("id"));
					} else if (durchlauf == 12) {
						spielBilder.setBild12ID(rs.getLong("id"));
					} else if (durchlauf == 13) {
						spielBilder.setBild13ID(rs.getLong("id"));
					} else if (durchlauf == 14) {
						spielBilder.setBild14ID(rs.getLong("id"));
					} else if (durchlauf == 15) {
						spielBilder.setBild15ID(rs.getLong("id"));
					} else {
						spielBilder.setBild16ID(rs.getLong("id"));
					}
				}
			}
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		return spielBilder;
	}

	private SpielVierBilderEinWortBean spielBilderWort() throws ServletException {

		String kategorie;
		// 1) zufälliges Wort aus der Datenbank laden
		// Order by Rand() Limt 1
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("Select kategorie from wort order by Rand() limit 1")) {

			ResultSet rs = pstmt.executeQuery();
			rs.next();
			kategorie = rs.getString(1);
		} catch (SQLException ex) {
			ex.printStackTrace();
			throw new ServletException(ex);
		}

		int[] imageIds = new int[4];

		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement("select id from bild where kategorie=?")) {
			pstmt.setString(1, kategorie);
			ResultSet rs = pstmt.executeQuery();
			for (int i = 0; i < 4; i++) {
				rs.next();

				imageIds[i] = rs.getInt(1);
				log("Kategorie-ID: " + imageIds[i]);
			}
		} catch (SQLException ex) {
			// TODO Auto-generated catch block
			ex.printStackTrace();
			throw new ServletException(ex);
		}
		// 3) Ids in die Bean schreiben (z.B. als Attribute, Array, etc)
		SpielVierBilderEinWortBean bean = new SpielVierBilderEinWortBean();
		bean.setBild1(imageIds[0]);
		bean.setBild2(imageIds[1]);
		bean.setBild3(imageIds[2]);
		bean.setBild4(imageIds[3]);

		return bean;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)   
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

}
