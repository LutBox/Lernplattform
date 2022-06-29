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
 * @author Merlin Servlet implementation class ProfilAktualisierenServlet
 */
@WebServlet("/ProfilAktualisierenServlet")
@MultipartConfig(location = "/tmp", fileSizeThreshold = 1024 * 32, maxFileSize = 1024 * 64, maxRequestSize = 1024 * 1024
		* 5 * 5)
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

		response.setCharacterEncoding("UTF-8");
		if (neuesProfilbild != null && neuesProfilbild.getSize() > 0) {
			try {
				NutzerSQLDienst.aktualisiereProfilbildDesNutzers(neuesProfilbild, alterName);
			} catch (Exception ex) {
				session.setAttribute(infotextname, "Ihr Profilbild ist zu Gro� (Max. 1024x1024).");
				response.sendRedirect("./html/nutzerseiten/profilbearbeiten.jsp");
			}
		}
		if (neuesPasswort != null && !neuesPasswort.equals(nutzer.getPasswort())) {
			NutzerSQLDienst.aktualisiereDasPasswortDesNutzers(neuesPasswort, alterName);
		}
		if (neueEmail != null && !neueEmail.equals(nutzer.getEmail())) {
			NutzerSQLDienst.aktualisiereEmailDesNutzers(neueEmail, alterName);
			nutzerView.setEmail(neueEmail);
		}
		session.setAttribute(NutzerViewBean.attributname, nutzerView);
		if (neuerName != null && !neuerName.equals(alterName)) {
			if (!NutzerSQLDienst.istNutzernameVergeben(neuerName)) {
				NutzerSQLDienst.aktualisiereDenNutzernamen(neuerName, alterName);
				nutzerView.setName(neuerName);
				session.setAttribute(NutzerViewBean.attributname, nutzerView);
				response.sendRedirect("./html/nutzerseiten/nutzerHauptseite.jsp");
			} else {
				session.setAttribute(infotextname,
						"Der von Ihnen gew�hlte Nutzername ist leider bereits vergeben! Weitere �nderungen wurden durchgef�hrt.");
				response.sendRedirect("./html/nutzerseiten/profilbearbeiten.jsp");
			}
		} else {
			response.sendRedirect("./html/nutzerseiten/nutzerHauptseite.jsp");
		}

	}

}
