package servlets.nutzerservlets;

import java.io.IOException;
import java.util.HashMap;

import beans.NutzerBean;
import beans.NutzerViewBean;
import dienste.sqldienste.NutzerSQLDienst;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 * @author Merlin Servlet implementation class ProfilAktualisierenServlet
 */
@WebServlet("/ProfilAktualisierenServlet")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5, maxRequestSize = 128 * 128 * 5
		* 4, location = "./tmpbilder", fileSizeThreshold = 1024 * 1024)
public class ProfilAktualisierenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String infotextname = "forminfotext";

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		final HttpSession session = request.getSession();
		NutzerViewBean nutzerView = (NutzerViewBean) session.getAttribute("nutzer");
		NutzerBean nutzer = NutzerSQLDienst.gebeMirNutzerMitDemNamen(nutzerView.getName());

		String alterName = nutzer.getName();
		String neuerName = request.getParameter("neuerName");
		String neueEmail = request.getParameter("neueEmail");
		String neuesPasswort = request.getParameter("passwort");
		Part neuesProfilbild = request.getPart("neuesProfilbild");

		
		if (neuerName != null && !neuerName.equals(alterName) && !NutzerSQLDienst.istNutzernameVergeben(neuerName)) {
			if (neuesProfilbild != null && neuesProfilbild.getSize() > 0) {
				NutzerSQLDienst.aktualisiereProfilbildDesNutzers(neuesProfilbild, alterName);
			}
			if (neuesPasswort != null && !neuesPasswort.equals(nutzer.getPasswort())) {
				NutzerSQLDienst.aktualisiereDasPasswortDesNutzers(neuesPasswort, alterName);
			}
			if (neueEmail != null && !neueEmail.equals(nutzer.getEmail())) {
				NutzerSQLDienst.aktualisiereEmailDesNutzers(neueEmail, alterName);
				nutzerView.setEmail(neueEmail);
			}
			
			NutzerSQLDienst.aktualisiereDenNutzernamen(neuerName, alterName);
			nutzerView.setName(neuerName);
			
			session.setAttribute(NutzerViewBean.attributname, nutzerView);
			response.sendRedirect("./html/nutzerseiten/nutzerHauptseite.jsp");
		} else {
			session.setAttribute(infotextname, "Der von Ihnen gewählte Nutzername ist leider bereits vergeben!");
			final RequestDispatcher dispatcher = request.getRequestDispatcher("./html/nutzerseiten/profilbearbeiten.jsp");
			dispatcher.forward(request, response);
		}

		

	}

}
