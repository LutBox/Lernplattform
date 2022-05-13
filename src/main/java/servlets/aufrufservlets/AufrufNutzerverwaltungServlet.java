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
 * Servlet implementation class AufrufNutzerverwaltungServlet
 */
@WebServlet("/AufrufNutzerverwaltungServlet")
public class AufrufNutzerverwaltungServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @author Merlin
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final HttpSession session = request.getSession();
		Anmeldungsvalidator.nutzerIstAngemeldet(session);
		Anmeldungsvalidator.nutzerIstAdmin(session);
		response.sendRedirect("./html/admin/nutzerverwaltung.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
