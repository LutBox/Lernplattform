package servlets.aufrufservlets;

import java.io.IOException;

import dienste.regdienst.Anmeldungsvalidator;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * @author Merlin
 * Servlet implementation class AufrufSpielekonfiguratorServlet
 */
@WebServlet("/AufrufSpielekonfiguratorServlet")
public class AufrufSpielekonfiguratorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @author Merlin 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * @see Nutzer wird ueberpruft und dann auf den Konfigurator weitergeleitet
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final HttpSession session = request.getSession();
		Anmeldungsvalidator.nutzerIstAngemeldet(session);
		Anmeldungsvalidator.nutzerIstAdmin(session);
		response.sendRedirect("./html/spielekonfigurator.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
