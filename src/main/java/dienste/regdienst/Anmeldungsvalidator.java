package dienste.regdienst;

import beans.viewbeans.NutzerViewBean;
import dienste.sqldienste.NutzerSQLDienst;
import exceptions.KeinAdminException;
import exceptions.NichtAngemeldetException;
import jakarta.servlet.http.HttpSession;

/**
 * 
 * @author Merlin
 * @see This calss checks with two methods wether a user is signed in or wether
 *      he is a admin.
 */
public class Anmeldungsvalidator {

	/**
	 * @author Merlin
	 * @param request
	 * @throws KeinAdminException
	 */
	public static void nutzerIstAdmin(HttpSession session) throws KeinAdminException {
		NutzerViewBean tmp = (NutzerViewBean) session.getAttribute(NutzerViewBean.attributName);
		NutzerViewBean potAdmin = NutzerSQLDienst.gebeMirNutzeranzeigeMitDemNamen(tmp.getName());
		if (potAdmin.getAdmin() != 1) {
			throw new KeinAdminException();
		}
	}

	/**
	 * @author Merlin
	 * @param request
	 * @throws NichtAngemeldetException
	 */
	public static void nutzerIstAngemeldet(HttpSession session) throws NichtAngemeldetException {
		NutzerViewBean potNutzer = (NutzerViewBean) session.getAttribute(NutzerViewBean.attributName);
		if (potNutzer.getName() == null) {
			throw new NichtAngemeldetException();
		}
	}

	public static HttpSession nutzerAbmelden(HttpSession session) {
		session.removeAttribute(NutzerViewBean.attributName);
		return session;
	}
}
