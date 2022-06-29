package servlets.nutzerservlets;

import java.io.IOException;

import beans.NutzerBean;
import beans.NutzerViewBean;
import dienste.sqldienste.NutzerSQLDienst;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 * @author Merlin Servlet
 * @see implementation class RegistrierungServlet
 */
@WebServlet("/RegistrierungServlet")
@MultipartConfig(location = "/tmp", fileSizeThreshold = 1024 * 32, maxFileSize = 1024 * 64, maxRequestSize = 1024 * 1024
		* 5 * 5)
public class RegistrierungServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String infotextname = "forminfotext";

	/**
	 * @author Merlin
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		NutzerBean anfrage = new NutzerBean();
		anfrage.setName(request.getParameter("name"));
		anfrage.setEmail(request.getParameter("email"));
		anfrage.setPasswort(request.getParameter("passwort"));

		Part profilbild = request.getPart("neuesProfilbild");

		final HttpSession session = request.getSession();

		if (NutzerSQLDienst.istNutzernameVergeben(anfrage.getName())) {
			session.setAttribute(infotextname, "Der von ihnen angegebene Nutzername ist bereits vergeben.");
			session.setAttribute("anfrage", anfrage);
			response.sendRedirect("./html/nutzerseiten/registrierung.jsp");
		} else {
			try {
				NutzerSQLDienst.nutzerSpeichern(anfrage, profilbild);
				session.setAttribute(NutzerViewBean.attributname,
						NutzerSQLDienst.gebeMirNutzeranzeigeMitDemNamen(anfrage.getName()));
				response.sendRedirect("./html/nutzerseiten/nutzerHauptseite.jsp");
			} catch (Exception ex) {
				session.setAttribute(infotextname, "Ihr Profilbild ist zu Gro� (Max. 1024x1024).");
				session.setAttribute("anfrage", anfrage);
				response.sendRedirect("./html/nutzerseiten/registrierung.jsp");
			}
		}
	}

}
