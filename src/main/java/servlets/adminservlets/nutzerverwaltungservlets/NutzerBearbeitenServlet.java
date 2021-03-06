package servlets.adminservlets.nutzerverwaltungservlets;

import java.io.IOException;

import beans.NutzerBean;
import dienste.sqldienste.NutzerSQLDienst;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * @author Merlin
 * @see MerlinServlet implementation class NutzerBearbeitenServlet
 */
@WebServlet("/NutzerBearbeitenServlet")
public class NutzerBearbeitenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		NutzerBean zuverwaltendernutzer = NutzerSQLDienst.gebeMirNutzerMitDemNamen(request.getParameter("nn"));
		final HttpSession session = request.getSession();
		session.setAttribute("zuverwaltendernutzer", zuverwaltendernutzer);
		session.setAttribute("forminfotext", "Bitte geben Sie die neuen Nutzerdaten an.");
		response.sendRedirect("./html/verwaltungsseiten/nutzeraktualisieren.jsp");
	}

}
