package servlets.adminservlets;

import java.io.IOException;
import java.util.ArrayList;

import beans.KontaktanfrageBean;
import dienste.sqldienste.KontaktanfragenSQLDienst;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class UngeleseneNachrichtenLadenServlet
 */
@WebServlet("/UngeleseneNachrichtenLadenServlet")
public class UngeleseneNachrichtenLadenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		final HttpSession session = request.getSession();
		ArrayList<KontaktanfrageBean> ungelesene = KontaktanfragenSQLDienst.gibAlleAnfragen_gelesen(false);
		ArrayList<KontaktanfrageBean> archivierte = KontaktanfragenSQLDienst.gibAlleAnfragen_gelesen(true);
		session.setAttribute("ungelesene", ungelesene);
		session.setAttribute("anzahlungelesene", ungelesene.size());
		session.setAttribute("archiviert", archivierte);
		session.setAttribute("anzahlarchivierte", archivierte.size());
		response.sendRedirect("./html/verwaltungsseiten/kontaktanfragen.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
