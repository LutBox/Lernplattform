package servlets.nutzerservlets;

import java.io.IOException;

import dienste.sqldienste.KontaktanfragenSQLDienst;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author Merlin Servlet implementation class KontaktanfrageServlet
 */
@WebServlet("/KontaktanfrageServlet")
public class KontaktanfrageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("E-mail");
		String nachricht = request.getParameter("Use_angabe");
		System.out.println(email + ": "+nachricht);
		String dest = "./html/hauptseiten/kontaktformular.jsp";
		if (email != null && nachricht != null) {
			KontaktanfragenSQLDienst.anfrageSpeichern(email, nachricht);
			dest = "./html/hauptseiten/dankeFuerDieAnfrage.jsp";
		}
		response.sendRedirect(dest);
	}

}
