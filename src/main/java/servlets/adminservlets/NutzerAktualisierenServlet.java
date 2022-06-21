package servlets.adminservlets;

import java.io.IOException;

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
 * @author Merlin Servlet implementation class NutzerAktualisierenServlet
 */
@WebServlet("/NutzerAktualisierenServlet")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5, maxRequestSize = 128 * 128 * 5
		* 4, location = "./tmpbilder", fileSizeThreshold = 1024 * 1024)
public class NutzerAktualisierenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		try {
			neuesProfilbild = request.getPart("neuesProfilbild");
			neuerSatus = Integer.parseInt(request.getParameter("nutzerart"));
		} catch (Exception e) {

		}

		final HttpSession session = request.getSession();
		NutzerBean zuverwaltendernutzer = (NutzerBean) session.getAttribute("zuverwaltendernutzer");
		String alterName = zuverwaltendernutzer.getName();

		if (neuesProfilbild != null && neuesProfilbild.getSize() > 0) {
			NutzerSQLDienst.aktualisiereProfilbildDesNutzers(neuesProfilbild, alterName);
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
			NutzerSQLDienst.aktualisiereDenNutzernamen(neuerName, alterName);
		}
		response.setCharacterEncoding("UTF-8");
		NutzerBean veranderternutzer = NutzerSQLDienst.gebeMirNutzerMitDemNamen(neuerName);
		session.setAttribute("veranderternutzer", veranderternutzer);
		response.sendRedirect("./html/verwaltungsseiten/nutzerverwaltung.jsp");
	}

}
