package servlets.adminservlets.nutzerverwaltungservlets;

import java.io.IOException;

import beans.NutzerBean;
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
 * @author Merlin Servlet implementation class NutzerAktualisierenServlet
 */
@WebServlet("/NutzerAktualisierenServlet")
@MultipartConfig(location = "./tmp", fileSizeThreshold = 1024 * 32, maxFileSize = 1024 * 64, maxRequestSize = 1024 * 1024
* 5 * 5)
public class NutzerAktualisierenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String infotextname = "forminfotext";

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String neuerName = request.getParameter("neuerName");
		String neueEmail = request.getParameter("neueEmail");
		String neuesPasswort = request.getParameter("passwort");
		Integer neuerSatus = null;
		Part neuesProfilbild = null;
		response.setCharacterEncoding("UTF-8");
		try {
			neuesProfilbild = request.getPart("neuesProfilbild");
			neuerSatus = Integer.parseInt(request.getParameter("nutzerart"));
		} catch (Exception e) {

		}

		final HttpSession session = request.getSession();
		NutzerBean zuverwaltendernutzer = (NutzerBean) session.getAttribute("zuverwaltendernutzer");
		String alterName = zuverwaltendernutzer.getName();

		if (neuesProfilbild != null && neuesProfilbild.getSize() > 0) {
			try {
				NutzerSQLDienst.aktualisiereProfilbildDesNutzers(neuesProfilbild, alterName);
			} catch (Exception ex) {
				session.setAttribute(infotextname, "Ihr Profilbild ist zu Gro� (Max. 1024x1024).");
				response.sendRedirect("./html/nutzerseiten/profilbearbeiten.jsp");
			}
		}
		if (neuesPasswort != null && !neuesPasswort.equals(zuverwaltendernutzer.getPasswort())) {
			NutzerSQLDienst.aktualisiereDasPasswortDesNutzers(neuesPasswort, alterName);
		}
		if (neueEmail != null && !neueEmail.equals(zuverwaltendernutzer.getEmail())) {
			NutzerSQLDienst.aktualisiereEmailDesNutzers(neueEmail, alterName);
		}
		if (neuerSatus != null && neuerSatus != zuverwaltendernutzer.getAdmin()) {
			NutzerSQLDienst.aktualisiereStatusDesNutzers(neuerSatus, alterName);
		}
		if (neuerName != null && !neuerName.equals(alterName)) {
			if (!NutzerSQLDienst.istNutzernameVergeben(neuerName)) {
				NutzerSQLDienst.aktualisiereDenNutzernamen(neuerName, alterName);
				response.sendRedirect("./html/verwaltungsseiten/nutzerverwaltung.jsp");
			} else {
				NutzerBean veranderternutzer = NutzerSQLDienst.gebeMirNutzerMitDemNamen(neuerName);
				session.setAttribute("veranderternutzer", veranderternutzer);
				session.setAttribute(infotextname,
						"Der von Ihnen gewählte Nutzername ist leider bereits vergeben! Weitere aber Änderungen wurden durchgeführt.");
				response.sendRedirect("./html/verwaltungsseiten/nutzeraktualisieren.jsp");
			}
		} else {
			session.setAttribute(infotextname, "�nderungen wurden durchgef�hrt.");
			response.sendRedirect("./html/verwaltungsseiten/nutzeraktualisieren.jsp");
		}
	}
}
