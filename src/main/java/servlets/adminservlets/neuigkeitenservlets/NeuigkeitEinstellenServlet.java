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
 * @see Servlet implementation class NeuigkeitEinstellenServlet
 */
@WebServlet("/NeuigkeitEinstellenServlet")
public class NeuigkeitEinstellenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String nachricht = request.getParameter("neuigkeitNeu");
		NeuigkeitSQLDienst.neuigkeitSpeichern(nachricht);
		final RequestDispatcher dispatcher = request.getRequestDispatcher("./NeuigkeitenAktualisierenServlet");
		dispatcher.forward(request, response);
	}

}
