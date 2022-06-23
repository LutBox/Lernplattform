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
 * @see Servlet implementation class UngelesenMarkierenServlet
 */
@WebServlet("/UngelesenMarkierenServlet")
public class UngelesenMarkierenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Integer kanr = Integer.parseInt(request.getParameter("kanr"));
		KontaktanfragenSQLDienst.alsUngelesenMarkieren(kanr);
		final RequestDispatcher dispatcher = request.getRequestDispatcher("UngeleseneNachrichtenLadenServlet");
		dispatcher.forward(request, response);
	}

}
