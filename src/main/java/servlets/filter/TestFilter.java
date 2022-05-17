package servlets.filter;

import java.io.IOException;

import beans.viewbeans.NutzerViewBean;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = { "/*" })
public class TestFilter implements Filter {

	private static final String[] geschuetzteURLs = { "./index.jsp" };

	@Override
	public void init(FilterConfig filterConfig) {
		System.out.println("(TestFilter): Filter initiert!");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("(TestFilter): Filter gestartet!");

		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession(false);

		boolean autentifiziert = (session != null && session.getAttribute(NutzerViewBean.attributname) != null);
		boolean reuqIstAnmeldeanfrage = req.getRequestURI().equals("./html/nutzerseiten/andmeldung.jsp");
		boolean reqKommtVonAnmeldeSeite = req.getRequestURI().endsWith("anmeldung.jsp");

		RequestDispatcher dispatcher;
		if (autentifiziert && enthaeltGeschuetzteURL(req)) {
			System.out.println("(TestFilter): Nutzer ist bereits angemeldet && Anfrage kommt von geschützter url");
			dispatcher = req.getRequestDispatcher("./html/nutzerseiten/anmeldung.jsp");
			dispatcher.forward(request, response);
		} else if (autentifiziert && (reuqIstAnmeldeanfrage || reqKommtVonAnmeldeSeite)){
			System.out.println("(TestFilter): Nutzer ist angemeldet && (Anfrage ist Anmeldeanfrage || Anfrage kommt von Anmeldeseite)");
			dispatcher = req.getRequestDispatcher("./");
		} else {
			chain.doFilter(request, response);
		}
	}

	private boolean enthaeltGeschuetzteURL(HttpServletRequest req) {
		String requestURL = req.getRequestURL().toString();
		for (int i = 0; i < geschuetzteURLs.length; i++) {
			if (requestURL.contains(geschuetzteURLs[i])) {
				return true;
			}
		}
		return false;
	}

	@Override
	public void destroy() {
		System.out.println("(TestFilter): Filter gestorben!");
	}

}
