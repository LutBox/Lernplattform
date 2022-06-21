package servlets.adminservlets.kontaktanfragenservlets;

import java.io.IOException;

import dienste.sqldienste.KontaktanfragenSQLDienst;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class KontaktanfrageLoeschenServlet
 */
@WebServlet("/KontaktanfrageLoeschenServlet")
public class KontaktanfrageLoeschenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		KontaktanfragenSQLDienst.loescheKontaktanfrageMitDerNummer(Integer.parseInt(request.getParameter("kanr")));
		final RequestDispatcher dispatcher = request.getRequestDispatcher("./UngeleseneNachrichtenLadenServlet");
		dispatcher.forward(request, response);
	}

}
