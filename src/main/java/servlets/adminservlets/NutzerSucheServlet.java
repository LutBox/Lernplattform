package servlets.adminservlets;

import java.io.IOException;
import java.util.ArrayList;

import beans.modelbeans.NutzerBean;
import dienste.sqldienste.NutzerSQLDienst;
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fragment = request.getParameter("fragment");
		int anzahlErgebnisse = Integer.parseInt(request.getParameter("anzahlErgebnisse"));
		ArrayList<NutzerBean> suchergebnisse = NutzerSQLDienst.gibMirXNutzerMitNamenWie(anzahlErgebnisse, fragment);
		final HttpSession session = request.getSession();
		session.setAttribute("suchergebnisse", suchergebnisse);
		response.sendRedirect("./html/verwaltungsseiten/suchergebnisse.jsp");
	}

}
