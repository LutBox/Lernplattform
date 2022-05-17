package servlets.filter;

import java.io.IOException;

import beans.viewbeans.NutzerViewBean;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@WebFilter(
		servletNames = "AnmeldungServlet"
		)
public class AnmeldungsFilter implements Filter {
	private static final String[] protectedURL = { "./index.jsp" };

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;

		HttpSession session = req.getSession(false);

		boolean auth = (session != null && session.getAttribute(NutzerViewBean.attributname) != null);
		boolean anmeldungsAnfrage = req.getRequestURI().equals("./AnmeldungServlet");
		boolean anmeldungsSeite = req.getRequestURI().endsWith("./anmeldung.jsp");

		RequestDispatcher dispatcher = null;
		
		if (!auth && protectedURL(req)) {
			dispatcher = request.getRequestDispatcher("./html/nutzerseiten/anmeldung.jsp");
			dispatcher.forward(request, response);
		
		} else if (auth && (anmeldungsAnfrage || anmeldungsSeite)) {
			dispatcher = request.getRequestDispatcher("./html/index.jsp");
			dispatcher.forward(request, response);

			// Authentithication erneut durchführen
		} else {
			chain.doFilter(request, response);
		}
	}

	private boolean protectedURL(HttpServletRequest req) {
		String reqURL = req.getRequestURL().toString();
		for (int i = 0; i < protectedURL.length; i++) {
			if (reqURL.contains(protectedURL[i])) {
				return true;
			}
		}
		return false;
	}

}
