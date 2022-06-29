package servlets.adminservlets.neuigkeitenservlets;

import java.io.IOException;

import dienste.sqldienste.NeuigkeitSQLDienst;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author Merlin
 * @see Servlet implementation class NeuigkeitLoeschenServlet
 */
@WebServlet("/NeuigkeitLoeschenServlet")
public class NeuigkeitLoeschenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Integer zlnnr = Integer.parseInt(request.getParameter("zlnnr"));
		NeuigkeitSQLDienst.neugigkeitMitNrXLoeschen(zlnnr);
		final RequestDispatcher dispatcher = request.getRequestDispatcher("./NeuigkeitenAktualisierenServlet");
		dispatcher.forward(request, response);
	}

}
