//
//Erstellt von Lukas Theinert
//

package servlets;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.util.Random;

import beans.SpielStartenBean;
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
		
		//Infos werden nur für den einen Request gespeichert innerhalb einer Bean
		//request.setAttribute("spielStartenBean", spielStartenBean);

		//Infos werden nur für mehrere Requests gespeichert innerhalb einer Bean
		final HttpSession session = request.getSession();
		session.setAttribute("spielStartenBean", spielStartenBean);

		//Weiterleiten an JSP
		if (spielartServlet.equals("mathe")) {
			final RequestDispatcher dispatcher = request.getRequestDispatcher("html/spieleseiten/spiel_mathe_starten.jsp");
			dispatcher.forward(request, response);
		} else if(spielartServlet.equals("bilderWort")) {
			final RequestDispatcher dispatcher = request.getRequestDispatcher("html/spieleseiten/spiel_bilderWort_starten.jsp");
			dispatcher.forward(request, response);
		} else if(spielartServlet.equals("bilderOrdnen")) {
			final RequestDispatcher dispatcher = request.getRequestDispatcher("html/spieleseiten/spiel_bilderOrdnen_starten.jsp");
			dispatcher.forward(request, response);
		} else if(spielartServlet.equals("bilderMemorie")) {
			final RequestDispatcher dispatcher = request.getRequestDispatcher("html/spieleseiten/spiel_bilderMemorie_starten.jsp");
			dispatcher.forward(request, response);
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
