package servlets.adminservlets.neuigkeitenservlets;

import java.io.IOException;

import beans.Neuigkeit;
import dienste.sqldienste.NeuigkeitSQLDienst;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * @author Merlin
 * Servlet implementation class NeuigkeitEditierenServlet
 */
@WebServlet("/NeuigkeitEditierenServlet")
public class NeuigkeitEditierenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Neuigkeit neuigkeit = NeuigkeitSQLDienst.neuigkeitMitNrXLaden(Integer.parseInt(request.getParameter("zennr")));
		HttpSession session = request.getSession();
		session.setAttribute("zueditierendeNeuigkeit", neuigkeit);
		final RequestDispatcher dispatcher = request.getRequestDispatcher("./html/verwaltungsseiten/newsroom.jsp");
		dispatcher.forward(request, response);
	}
}
