package filter;

import java.io.IOException;

import beans.NutzerViewBean;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//@WebFilter(urlPatterns = {"/*"})

/**
 * @author Merlin
 * @source https://www.youtube.com/watch?v=yOhmJ497EWs START
 */
@jakarta.servlet.annotation.WebFilter(
		urlPatterns = "/html/verwaltungsseiten/*",
		servletNames = {
				"servlets.adminservlets.kontaktanfragenservlets.GelesenMarkierenServlet",
				"servlets.adminservlets.kontaktanfragenservlets.KontaktanfrageLoeschenServlet",
				"servlets.adminservlets.nutzerverwaltungservlets.NutzerSucheServlet",
				"servlets.adminservlets.nutzerverwaltungservlets.NutzerAktualisierenServlet",
				"servlets.adminservlets.nutzerverwaltungservlets.NutzerBearbeitenServlet",
				"servlets.adminservlets.nutzerverwaltungservlets.NutzerLoeschenServlet",
				"servlets.adminservlets.kontaktanfragenservlets.UngeleseneNachrichtenLadenServlet",
				"servlets.adminservlets.kontaktanfragenservlets.UngelesenMarkierenServlet",
				"servlets.adminservlets.neuigkeitenservlets.NeuigkeitAktualisierenServlet",
				"servlets.adminservlets.neuigkeitenservlets.NeuigkeitEditierenServlet",
				"servlets.adminservlets.neuigkeitenservlets.NeuigkeitEinstellenServlet",
				"servlets.adminservlets.neuigkeitenservlets.NeuigkeitenAktualisierenServlet",
				"servlets.adminservlets.neuigkeitenservlets.NeuigkeitLoeschenServlet"},		
		filterName = "AdminFilter",
		description = "Dieser Filter pr�ft ob jemand als Admin angemeldet ist bevor er eine Adminfunktin aufrufen kann."
		)
public class AdminFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		// falls keine Session vorhanden ist soll auch keine neue erstellt werden
		HttpSession session = httpRequest.getSession(false); 
		
		if (session != null && session.getAttribute(NutzerViewBean.attributname) != null) {
			NutzerViewBean nutzer = (NutzerViewBean) session.getAttribute(NutzerViewBean.attributname);
			if (nutzer.getAdmin() == 1) {
				chain.doFilter(httpRequest, httpResponse);
			} else {
				httpResponse.sendError(403);
			}
		} else {
			httpResponse.sendError(403);
		}
	}
}

/**
 * @source https://www.youtube.com/watch?v=yOhmJ497EWs END
 */
