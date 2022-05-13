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
 * Servlet implementation class AufrufAdminseiteServlet
 */
@WebServlet("/AufrufAdminseiteServlet")
public class AufrufAdminseiteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @author Merlin
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * @see Methode preuft ob Nutzer zugriff haben darf und leitet ihn dann auf die "Admin-landig-page"
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final HttpSession session = request.getSession();
		Anmeldungsvalidator.nutzerIstAngemeldet(session);
		Anmeldungsvalidator.nutzerIstAdmin(session);
		response.sendRedirect("./html/admin/admin_startseite.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
