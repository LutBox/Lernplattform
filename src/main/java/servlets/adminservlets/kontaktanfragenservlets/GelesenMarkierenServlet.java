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
 * @author Merlin
 * Servlet implementation class GelesenMarkierenServlet
 */
@WebServlet("/GelesenMarkierenServlet")
public class GelesenMarkierenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Integer kanr = Integer.parseInt(request.getParameter("kanr"));
		KontaktanfragenSQLDienst.alsGelesenMarkieren(kanr);
		final RequestDispatcher dispatcher = request.getRequestDispatcher("UngeleseneNachrichtenLadenServlet");
		dispatcher.forward(request, response);
	}

}
