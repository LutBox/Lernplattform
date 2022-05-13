package servlets.nutzerservlets;

import java.io.IOException;

import beans.modelbeans.NutzerBean;
import beans.viewbeans.NutzerViewBean;
import dienste.sqldienste.NutzerSQLDienst;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * @author Merlin Servlet implementation class AnmeldungServlet
 */
@WebServlet("/AnmeldungServlet")
public class AnmeldungServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @author Merlin
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * @see Diese Methode preuft ob der Nutzer aus dem Anmeldeformular existiert und
	 *      ob die Passworteingabe mit dem Datenbankeinstrag uebereinstimmt. Des
	 *      weiteren wird entschieden, ob ein Nutzer die Adminfuktionen bekommnt
	 *      oder als normaler nutze angemeldet wird.
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Was erwarte ich
		request.setCharacterEncoding("UTF-8");

		// Was sende ich zurueck
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");

		// Nutzer zu Nutzernamen aus der Datenbank holen
		NutzerBean nutzer = NutzerSQLDienst.gibMirNutzerMitDemNamen(request.getParameter("name"));
		HttpSession session = request.getSession();

		if (nutzer.getName() != null) {

			// Ueberpruefung ob das Passwort des Nutzers mit dem Passwort aus dem
			// Anmeldeformular uebereinstimmt
			if (nutzer.getPasswort().equals(request.getParameter("passwort"))) {

				// Nutzer in den Sessionscope legen und so verfuegbar machen
				NutzerViewBean nutzerAnzeige = new NutzerViewBean();
				nutzerAnzeige.setName(nutzer.getName());
				nutzerAnzeige.setEmail(nutzer.getEmail());
				nutzerAnzeige.setAdmin(nutzer.getAdmin());
				session.setAttribute(NutzerViewBean.attributName, nutzerAnzeige);

				// Entscheidung welchen Funktionsumfang der Nutzer bekommt
				if (nutzer.getAdmin() == 1) {

					// Nutzer ist Admin
					response.sendRedirect("./AufrufAdminseiteServlet");
				} else {

					// Nutzer ist kein Admin
					response.sendRedirect("./html/nutzerseiten/nutzerHaupseite.jsp");
				}
			} else {
				session.setAttribute("anmeldunginfotext", "Bitte prüfen sie ihr Passwort.");
				response.sendRedirect("./html/anmeldung.jsp");
			}
		} else {
			session.setAttribute("anmeldunginfotext", "Nutzer existiert nicht.");
			response.sendRedirect("./html/anmeldung.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * @author Merlin
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
