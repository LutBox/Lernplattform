package servlets.adminservlets.neuigkeitenservlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import beans.Neuigkeit;
import dienste.regulaeredienste.NachZeitstempelSortieren;
import dienste.sqldienste.NeuigkeitSQLDienst;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author Merlin
 * @see implementation class NeuigkeitenAktualisierenServlet
 */
@WebServlet(urlPatterns = "/NeuigkeitenAktualisierenServlet", loadOnStartup = 2)
public class NeuigkeitenAktualisierenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() {
		ArrayList<Neuigkeit> neuigkeiten = new ArrayList<Neuigkeit>();
		try {
			neuigkeiten = NeuigkeitSQLDienst.neuigkeitenLaden();
			Collections.sort(neuigkeiten, new NachZeitstempelSortieren());
		} catch (ServletException e) {
			e.printStackTrace();
		}
		ServletContext app = getServletContext();
		app.setAttribute(NeuigkeitSQLDienst.ListBeanName, neuigkeiten);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ArrayList<Neuigkeit> neuigkeiten = null;
		try {
			neuigkeiten = NeuigkeitSQLDienst.neuigkeitenLaden();
			Collections.sort(neuigkeiten, new NachZeitstempelSortieren());
			ServletContext app = getServletContext();
			app.setAttribute(NeuigkeitSQLDienst.ListBeanName, neuigkeiten);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		final RequestDispatcher dispatcher = request.getRequestDispatcher("./html/verwaltungsseiten/newsroom.jsp");
		dispatcher.forward(request, response);
	}

}
