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
 * Servlet implementation class ProfilAktualisierenServlet
 */
@WebServlet("/ProfilAktualisierenServlet")
public class ProfilAktualisierenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final HttpSession session = request.getSession();
		NutzerViewBean nutzerView = (NutzerViewBean) session.getAttribute("nutzer");
		NutzerBean nutzer = NutzerSQLDienst.gebeMirNutzerMitDemNamen(nutzerView.getName());

		String neuerName = request.getParameter("neuerName");
		String neueEmail = request.getParameter("neueEmail");
		String neuesPasswort = request.getParameter("neuesPasswort");

		nutzer.setName(neuerName);
		nutzer.setEmail(neueEmail);
		nutzer.setPasswort(neuesPasswort);

		NutzerSQLDienst.nutzerSpeichern(nutzer);
		NutzerSQLDienst.loescheNutzerMitDemNamen(nutzerView.getName());

		nutzerView.setName(neuerName);
		nutzerView.setEmail(neueEmail);

		session.setAttribute(NutzerViewBean.attributname, nutzerView);
		response.sendRedirect("./html/nutzerseiten/nutzerhauptseite.jsp");
	}

}
