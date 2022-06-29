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

/**
 * @author Merlin
 * @source https://www.youtube.com/watch?v=yOhmJ497EWs START
 */

@jakarta.servlet.annotation.WebFilter(
	urlPatterns = {
		"/html/nutzerseiten/nutzerHauptseite.jsp",
		"/html/nutzerseiten/profilbearbeiten.jsp"},
	servletNames = "servlets.nutzerservlets.ProfilAktualisierenServlet",
	filterName = "NutzerFilter",
	description = "Dieser Filter pr�ft ob jemand als Admin angemeldet ist bevor er eine Adminfunktin aufrufen kann.")
public class NutzerFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		// falls keine Session vorhanden ist soll auch keine neue erstellt werden
		HttpSession session = httpRequest.getSession(false);

		if (session != null && session.getAttribute(NutzerViewBean.attributname) != null) {
				chain.doFilter(httpRequest, httpResponse);
		} else {
			httpResponse.sendError(403);
		}
	}
}

/**
 * @source https://www.youtube.com/watch?v=yOhmJ497EWs END
 */