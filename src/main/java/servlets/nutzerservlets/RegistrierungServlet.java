package servlets.nutzerservlets;

import java.io.IOException;

import beans.modelbeans.NutzerBean;
import beans.viewbeans.NutzerViewBean;
import dienste.sqldienste.NutzerSQLDienst;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * @author Merlin Servlet implementation class RegistrierungServlet
 */
@WebServlet("/RegistrierungServlet")
public class RegistrierungServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String infotextname = "registrierunginfotext";

	/**
	 * @author Merlin
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Was erware ich
		request.setCharacterEncoding("UTF-8");

		// Was schicke ich zurueck
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		NutzerBean neuerNutzer = new NutzerBean();
		neuerNutzer.setName(request.getParameter("name"));
		neuerNutzer.setEmail(request.getParameter("email"));
		neuerNutzer.setPasswort(request.getParameter("passwort"));
		neuerNutzer.setPunkte(0);
		neuerNutzer.setAdmin(0);
		neuerNutzer.setDateiname(request.getParameter("dateiname"));
		neuerNutzer.setBild(request.getParameter("bild"));

		if (NutzerSQLDienst.istNutzernameVergeben(neuerNutzer.getName())) {

			request.setAttribute(infotextname, "Der von ihnen angegebene Nutzername ist bereits vergeben.");
			final RequestDispatcher dispatcher = request.getRequestDispatcher("./html/nutzerseiten/registrierung.jsp");
			dispatcher.forward(request, response);

		} else {

			final HttpSession session = request.getSession();

			NutzerSQLDienst.nutzerSpeichern(neuerNutzer);

			NutzerViewBean neuerNutzerAnzeige = new NutzerViewBean();
			neuerNutzerAnzeige.setName(neuerNutzer.getName());
			neuerNutzerAnzeige.setEmail(neuerNutzer.getEmail());
			neuerNutzerAnzeige.setPunkte(0);
			neuerNutzerAnzeige.setAdmin(0);
			neuerNutzerAnzeige.setDateiname(neuerNutzer.getDateiname());

			session.setAttribute(NutzerViewBean.attributname, neuerNutzerAnzeige);

			response.sendRedirect("./html/nutzerseiten/nutzerHauptseite.jsp");
		}
	}

}
