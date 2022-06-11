package servlets.sqlservlets;
import javax.sql.DataSource;

import dienste.sqldienste.SQLDienst;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

/**
 * Servlet implementation class StartUpSQLServiceServlet
 * @author Merlin
 * 
 * Dieses Servlet wird beim Serverstart instanziiert (Siehe Annotation).
 */
@WebServlet(urlPatterns="/StartUpSQLServiceServlet",loadOnStartup = 1)
public class StartUpSQLServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;
	
	/**
	 * @author Merlin
	 * In dieser init() wird gleich nach dem Serverstart die Datenquelle "ds" festgelegt und kann danach genutzt werden.
	 */
	@Override
	public void init() throws ServletException {
		SQLDienst.setDataSource(ds);
	}
}
