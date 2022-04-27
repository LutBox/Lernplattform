//
//Erstellt von Lukas Theinert


package servlets;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;

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
		
		
		//---------- SERVLET ------------------------------
		//Attribute (Schwierigkeit & Spieleart) von gaming_main_page.jsp abholen
		String spielartServlet = request.getParameter("Spielart");
		String schwierigkeitServlet = request.getParameter("Schwierigkeit");
		//Infos werden nur für den einen Request gespeichert
		request.setAttribute("schwierigkeitServlet", schwierigkeitServlet);
		request.setAttribute("spielartServlet", spielartServlet);
		
		//----------  BEAN   ------------------------------

		//Infos in der Bean speichern
		SpielStartenBean spielStartenBean = new SpielStartenBean();
		spielStartenBean.setSchwierigkeit(request.getParameter("Schwierigkeit"));
		spielStartenBean.setSpielart(request.getParameter("Spielart"));
		
		//Infos werden nur für den einen Request gespeichert innerhalb einer Bean
		request.setAttribute("spielStartenBean", spielStartenBean);

	
		//Infos werden nur für mehrere Requests gespeichert innerhalb einer Bean
		//final HttpSession session = request.getSession();
		//session.setAttribute("from", from);
		
		//Weiterleiten an JSP
		final RequestDispatcher dispatcher = request.getRequestDispatcher("html/gaming_pages/spiel1_mathe.jsp");
        dispatcher.forward(request, response);
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
