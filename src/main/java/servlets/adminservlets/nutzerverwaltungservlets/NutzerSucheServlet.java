package servlets.adminservlets.nutzerverwaltungservlets;

import java.io.IOException;
import java.util.ArrayList;

import beans.NutzerBean;
import dienste.sqldienste.NutzerSQLDienst;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * @author Merlin Servlet implementation class NutzerSucheServlet
 */
@WebServlet("/NutzerSucheServlet")
public class NutzerSucheServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("-utf-8");
		String fragment = request.getParameter("fragment");
		ArrayList<NutzerBean> suchergebnisse = NutzerSQLDienst.gibMirXNutzerMitNamenWie(fragment);
		final HttpSession session = request.getSession();
		session.setAttribute("suchergebnisse", suchergebnisse);
		session.setAttribute("fragment", fragment);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain");
		final RequestDispatcher dispatcher = request.getRequestDispatcher("./html/verwaltungsseiten/suchergebnis.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
