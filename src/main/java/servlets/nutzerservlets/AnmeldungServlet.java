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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * @author Merlin
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NutzerBean nutzer = NutzerSQLDienst.gebeMirNutzerMitDemNamen(request.getParameter("name"));
		HttpSession session = request.getSession();

		if (nutzer.getName() != null) {

			// Ueberpruefung ob das Passwort des Nutzers mit dem Passwort aus dem
			// Anmeldeformular uebereinstimmt
			if (nutzer.getPasswort().equals(request.getParameter("passwort"))) {

				// Nutzer in den Sessionscope legen und so verfuegbar machen
				NutzerViewBean nutzerAnzeige = NutzerSQLDienst.gebeMirNutzeranzeigeMitDemNamen(nutzer.getName());
				session.setAttribute(NutzerViewBean.attributname, nutzerAnzeige);

				// Entscheidung welchen Funktionsumfang der Nutzer bekommt
				if (nutzer.getAdmin() == 1) {

					// Nutzer ist Admin
					response.sendRedirect("./html/verwaltungsseiten/adminkonsole.jsp");
				} else {

					// Nutzer ist kein Admin
					response.sendRedirect("./html/nutzerseiten/nutzerhauptseite.jsp");
				}
			} else {
				session.setAttribute("anmeldunginfotext", "Bitte prüfen sie ihr Passwort.");
				response.sendRedirect("./html/nutzerseiten/anmeldung.jsp");
			}
		} else {
			session.setAttribute("anmeldunginfotext", "Nutzer existiert nicht.");
			response.sendRedirect("./html/nutzerseiten/anmeldung.jsp");
		}
	}
}
