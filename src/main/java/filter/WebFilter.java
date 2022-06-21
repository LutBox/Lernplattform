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
 * @source https://www.youtube.com/watch?v=yOhmJ497EWs
 */
@jakarta.servlet.annotation.WebFilter(
		urlPatterns = "/html/verwaltungsseiten/*",
		servletNames = {
				"servlets.adminservlets.GelesenMarkierenServlet",
				"servlets.adminservlets.KontaktanfrageLoeschenServlet",
				"servlets.adminservlets.NutzerSucheServlet",
				"servlets.adminservlets.NutzerAktualisierenServlet",
				"servlets.adminservlets.NutzerBearbeitenServlet",
				"servlets.adminservlets.NutzerLoeschenServlet",
				"servlets.adminservlets.UngeleseneNachrichtenLadenServlet",
				"servlets.adminservlets.UngelesenMarkierenServlet",
				"servlets.nutzerservlets.ProfilAktualisierenServlet"},		
		filterName = "WebFilter",
		description = "Dieser Filter prüft ob jemand als Admin angemeldet ist bevor er eine Adminfunktin aufrufen kann."
		)
public class WebFilter implements Filter {

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
