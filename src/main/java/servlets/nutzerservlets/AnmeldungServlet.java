package servlets.nutzerservlets;

import java.io.IOException;

import beans.NutzerBean;
import beans.NutzerViewBean;
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
		request.setCharacterEncoding("UTF-8");

		NutzerBean nutzer = NutzerSQLDienst.gebeMirNutzerMitDemNamen(request.getParameter("name"));
		HttpSession session = request.getSession();

		if (nutzer.getName() != null) {
			if (nutzer.getPasswort().equals(request.getParameter("passwort"))) {
				NutzerViewBean nutzerAnzeige = NutzerSQLDienst.gebeMirNutzeranzeigeMitDemNamen(nutzer.getName());
				session.setAttribute(NutzerViewBean.attributname, nutzerAnzeige);
				if (nutzer.getAdmin() == 1) {
					response.sendRedirect("./index.jsp");
				} else {
					response.sendRedirect("./html/nutzerseiten/nutzerHauptseite.jsp");
				}
			} else {
				session.setAttribute("forminfotext", "Bitte prüfen sie ihr Passwort.");
				response.sendRedirect("./html/nutzerseiten/anmeldung.jsp");
			}
		} else {
			session.setAttribute("forminfotext", "Nutzer existiert nicht.");
			response.sendRedirect("./html/nutzerseiten/anmeldung.jsp");
		}
	}
}
