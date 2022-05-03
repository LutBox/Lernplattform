//
//Erstellt von Lukas Theinert
//

package servlets;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;

import beans.SpielMatheBean;
import beans.SpielStartenBean;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class SpielMatheErgebnisServlet
 */
@WebServlet("/SpielMatheErgebnisServlet")
public class SpielMatheErgebnisServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SpielMatheErgebnisServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());

		//Dateien aus Bean in neues Objekt einfügen
		SpielMatheBean spielMatheBean = (SpielMatheBean) request.getSession().getAttribute("spielMatheBean");
		
		//Nutzerergebnis aufrufen und in Bean speichern
		int temp = Integer.parseInt(request.getParameter("NutzerErgebnis1"));
		spielMatheBean.setNutzerErgebnis1(temp);
		
		//Infos werden nur für mehrere Requests gespeichert innerhalb einer Bean
		final HttpSession session = request.getSession();
		session.setAttribute("spielMatheBean", spielMatheBean);

		//Weiterleiten an JSP
			final RequestDispatcher dispatcher = request.getRequestDispatcher("html/spieleseiten/spiel_mathe_ergebnis.jsp");
			dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
