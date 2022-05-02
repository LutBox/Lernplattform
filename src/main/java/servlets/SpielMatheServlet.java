//
//Erstellt von Lukas Theinert
//
package servlets;

import jakarta.servlet.http.HttpServlet;

import java.io.IOException;
import java.util.Random;

import beans.SpielMatheBean;
import beans.SpielStartenBean;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class SpielMatheServlet
 */
@WebServlet("/SpielMatheServlet")
public class SpielMatheServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpielMatheServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());

		//Attribute definieren d=Durchlauf z=Zahl
		int [] zufallszahlen = new int[6];
		
		SpielMatheBean spielMatheBean = new SpielMatheBean();
		SpielStartenBean spielStartenBean = (SpielStartenBean) request.getSession().getAttribute("spielStartenBean");
		
		//6 Durchläufe
		//Schwierigkeit Leicht
		if (spielStartenBean.getSchwierigkeit().equals("leicht")) {
			for(int i = 0; i < 6; i++) {
				Random r = new Random();
				int low = 1;
				int high = 10;
				int zahl = r.nextInt(high-low) + low;
				
				zufallszahlen[i] = zahl; 
			}
		} else if (spielStartenBean.getSchwierigkeit().equals("mittel")){
			for(int i = 0; i < 6; i++) {
				Random r = new Random();
				int low = 10;
				int high = 100;
				int zahl = r.nextInt(high-low) + low;
				
				zufallszahlen[i] = zahl; 
			}
		} else if (spielStartenBean.getSchwierigkeit().equals("schwer")){
			for(int i = 0; i < 6; i++) {
				Random r = new Random();
				int low = 100;
				int high = 1000;
				int zahl = r.nextInt(high-low) + low;
				
				zufallszahlen[i] = zahl; 
			}
		}
		
		
		spielMatheBean.setZahl1(zufallszahlen[0]); 
		spielMatheBean.setZahl2(zufallszahlen[1]); 
		spielMatheBean.setZahl3(zufallszahlen[2]); 
		spielMatheBean.setZahl4(zufallszahlen[3]); 
		spielMatheBean.setZahl5(zufallszahlen[4]); 
		spielMatheBean.setZahl6(zufallszahlen[5]); 
	
		spielMatheBean.setErgebnis1(zufallszahlen[0] + zufallszahlen[1]); 
		spielMatheBean.setErgebnis2(zufallszahlen[2] + zufallszahlen[3]); 
		spielMatheBean.setErgebnis3(zufallszahlen[4] + zufallszahlen[5]); 
		
		String spielartServlet = request.getParameter("Spielart");
		String schwierigkeitServlet = request.getParameter("Schwierigkeit");

		
		//----------  BEAN   ------------------------------
		//Infos werden nur für den einen Request gespeichert innerhalb einer Bean
		//request.setAttribute("spielMatheBean", spielMatheBean);
	
		//Infos werden nur für mehrere Requests gespeichert innerhalb einer Bean
		final HttpSession session = request.getSession();
		session.setAttribute("spielMatheBean", spielMatheBean);

		//Weiterleiten an JSP
			final RequestDispatcher dispatcher = request.getRequestDispatcher("html/gaming_pages/spiel_mathe_spielen.jsp");
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

