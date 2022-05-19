//
//Erstellt von Lukas Theinert
//

package servlets;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import javax.sql.DataSource;

import beans.SpielBilderMemorieBean;
import beans.SpielStartenBean;
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
	
	@Resource(lookup="java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpielStartenServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());

		//Parameter holen und als String speichern
		String spielartServlet = request.getParameter("Spielart");
		String schwierigkeitServlet = request.getParameter("Schwierigkeit");

		//---------- SERVLET ------------------------------
		//Attribute (Schwierigkeit & Spieleart) von gaming_main_page.jsp abholen
		//Infos werden nur für den einen Request gespeichert
		request.setAttribute("schwierigkeitServlet", schwierigkeitServlet);
		request.setAttribute("spielartServlet", spielartServlet);
		
		//----------  BEAN   ------------------------------
		//Neues Bean-Objekt erstellen und Informationen speichern
		SpielStartenBean spielStartenBean = new SpielStartenBean();
		spielStartenBean.setSchwierigkeit(request.getParameter("Schwierigkeit"));
		spielStartenBean.setSpielart(request.getParameter("Spielart"));
		spielStartenBean.setTimer(request.getParameter("Timer"));
		spielStartenBean.setGewertet(request.getParameter("Gewertet"));
		
		//Infos werden nur für den einen Request gespeichert innerhalb einer Bean
		//request.setAttribute("spielStartenBean", spielStartenBean);

		//Infos werden nur für mehrere Requests gespeichert innerhalb einer Bean
		final HttpSession session = request.getSession();
		session.setAttribute("spielStartenBean", spielStartenBean);

		//Weiterleiten an JSP
		//-------------------------------------------------
		//---------- Mathe   ------------------------------
		//-------------------------------------------------
		if (spielartServlet.equals("mathe")) {
			final RequestDispatcher dispatcher = request.getRequestDispatcher("html/spieleseiten/spiel_mathe_starten.jsp");
			dispatcher.forward(request, response);
			
		//-------------------------------------------------
		//---------- 4 Bilder 1 Wort   --------------------
		//-------------------------------------------------	
		} else if(spielartServlet.equals("bilderWort")) {
			final RequestDispatcher dispatcher = request.getRequestDispatcher("html/spieleseiten/spiel_bilderWort_starten.jsp");
			dispatcher.forward(request, response);
			
		//-------------------------------------------------
		//---------- Bilder ordnen   ----------------------
		//-------------------------------------------------
		} else if(spielartServlet.equals("bilderOrdnen")) {
			final RequestDispatcher dispatcher = request.getRequestDispatcher("html/spieleseiten/spiel_bilderOrdnen_starten.jsp");
			dispatcher.forward(request, response);
			
		//-------------------------------------------------
		//---------- Bildermemorie   ----------------------
		//-------------------------------------------------
		} else if(spielartServlet.equals("bilderMemorie")) {
			//8 Zufällige Bilder in Bean speichern
			SpielBilderMemorieBean spielBilderMemorieBean = new SpielBilderMemorieBean();
			spielBilderMemorieBean = spielBilderMemorie();
			
			//Infos werden nur für mehrere Requests gespeichert innerhalb einer Bean
			session.setAttribute("spielBilderMemorieBean", spielBilderMemorieBean);
			
			//Weiterleiten an JSP
			final RequestDispatcher dispatcher = request.getRequestDispatcher("html/spieleseiten/spiel_bilderMemorie_starten.jsp");
			dispatcher.forward(request, response);	
			
		//-------------------------------------------------
		//---------- Zufall   -----------------------------
		//-------------------------------------------------
		} else {
			int min = 1;
			int max = 3;
			Random random = new Random();
			int value = random.nextInt(max + min) + min;
			if(value == 1) {
				final RequestDispatcher dispatcher = request.getRequestDispatcher("html/spieleseiten/spiel_bilderWort_starten.jsp");
				dispatcher.forward(request, response);
			} else if (value == 2) {
				final RequestDispatcher dispatcher = request.getRequestDispatcher("html/spieleseiten/spiel_bilderOrdnen_starten.jsp");
				dispatcher.forward(request, response);
			} else {
				final RequestDispatcher dispatcher = request.getRequestDispatcher("html/spieleseiten/spiel_bilderMemorie_starten.jsp");
				dispatcher.forward(request, response);
			}
		}
		
        //Alternativ:
        //request.getRequestDispatcher("html/gaming_pages/quick_game.jsp").forward(request, response);
		
		//Direktes Senden an Seite:
		//response.sendRedirect("html/gaming_pages/quick_game.jsp"); 
	}
	
	public void spielMathe() {
		
	}
	
	public void spielBilderWort() {
		
	}
	
	public void spielBilderOrdnen() {
		
	}
	
	private SpielBilderMemorieBean spielBilderMemorie() throws ServletException {
		int durchlauf = 0;
		SpielBilderMemorieBean spielBilder = new SpielBilderMemorieBean();
		
		//DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT * FROM bild ORDER BY RAND() LIMIT 16")) {

			try(ResultSet rs = pstmt.executeQuery()) {
				while (rs!= null && rs.next()) {
					durchlauf++;
					
					if(durchlauf ==1) {
						spielBilder.setBild1ID(rs.getLong("id"));
					} else if(durchlauf ==2) {
						spielBilder.setBild2ID(rs.getLong("id"));
					} else if(durchlauf ==3) {
						spielBilder.setBild3ID(rs.getLong("id"));
					} else if(durchlauf ==4) {
						spielBilder.setBild4ID(rs.getLong("id"));
					} else if(durchlauf ==5) {
						spielBilder.setBild5ID(rs.getLong("id"));
					} else if(durchlauf ==6) {
						spielBilder.setBild6ID(rs.getLong("id"));
					} else if(durchlauf ==7) {
						spielBilder.setBild7ID(rs.getLong("id"));
					} else if(durchlauf ==8){
						spielBilder.setBild8ID(rs.getLong("id"));
					} else if(durchlauf ==9) {
						spielBilder.setBild9ID(rs.getLong("id"));
					} else if(durchlauf ==10) {
						spielBilder.setBild10ID(rs.getLong("id"));
					} else if(durchlauf ==11) {
						spielBilder.setBild11ID(rs.getLong("id"));
					} else if(durchlauf ==12) {
						spielBilder.setBild12ID(rs.getLong("id"));
					} else if(durchlauf ==13) {
						spielBilder.setBild13ID(rs.getLong("id"));
					} else if(durchlauf ==14) {
						spielBilder.setBild14ID(rs.getLong("id"));
					} else if(durchlauf ==15) {
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
