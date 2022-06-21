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
 * Servlet implementation class NutzerBearbeitenServlet
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
		NutzerBean zuverwaltendernutzer = NutzerSQLDienst.gebeMirNutzerMitDemNamen(request.getParameter("nn"));
		HttpSession session = request.getSession();
		session.setAttribute("zuverwaltendernutzer", zuverwaltendernutzer);
		response.sendRedirect("./html/verwaltungsseiten/nutzeraktualisieren.jsp");
	}

}
