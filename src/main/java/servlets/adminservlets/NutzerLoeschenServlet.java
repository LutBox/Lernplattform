package servlets.adminservlets;

import java.io.IOException;

import dienste.sqldienste.NutzerSQLDienst;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NutzerLoeschenServlet
 */
@WebServlet("/NutzerLoeschenServlet")
public class NutzerLoeschenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		NutzerSQLDienst.loescheNutzerMitDemNamen(request.getParameter("nutzerMitNameXLoeschen"));
		response.sendRedirect("./html/verwaltungsseiten/nutzerverwaltung.jsp");
	}

}
