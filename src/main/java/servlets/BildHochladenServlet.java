//
//Erstellt von Lukas Theinert
//

package servlets;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import beans.SpielBilderMemorieBean;
import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class BildHochladenServlet
 */
@WebServlet("/BildHochladenServlet")
public class BildHochladenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BildHochladenServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//Kategorie entgegennehmen 
		String kategorie = request.getParameter("kategorie");
		
		// Logausgabe über empfangene Parts
		for (Part part : request.getParts()) {
			log("Part received: " + part.getName());
			if (part.getSubmittedFileName() != null)
				log("Filename written via BinaryStream: " + part.getSubmittedFileName());
		}
		
		// Filebehandlung
		Part filepart = request.getPart("image");
		String fileName =filepart.getSubmittedFileName();
		System.out.println("fileName: " + fileName);

		/*		
		// Bild übertragen
		try (ByteArrayOutputStream baos = new ByteArrayOutputStream();
			 InputStream in = filepart.getInputStream()	){
			int i=0;
			while ((i = in.read()) != -1) {
				baos.write(i);
			}
			form.setImage(baos.toByteArray());
			baos.flush();
		} catch (IOException ex) {
			throw new ServletException(ex.getMessage());
		}
*/
		
		// DB-Zugriff
		persist(kategorie, filepart);
		SpielBilderMemorieBean datenDB = new SpielBilderMemorieBean();
		datenDB = read();
		
		// Infos werden nur für mehrere Requests gespeichert innerhalb einer Bean
		final HttpSession session = request.getSession();
		session.setAttribute("kategorie", kategorie);
		session.setAttribute("datenDB", datenDB);
		
		// Weiterleiten an JSP
		final RequestDispatcher dispatcher = request.getRequestDispatcher("html/verwaltungsseiten/bildHochladenFertig.jsp");
		dispatcher.forward(request, response);
		

	}

	private void persist(String kategorie, Part filepart) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"INSERT INTO wort (kategorie) VALUES (?);" +
						"INSERT INTO bild (kategorie, stream) VALUES (?,?);")) {
			
			// Zugriff über Klasse java.sql.PreparedStatement
			// Prüfuen, ob Kategorie existiert
			boolean kategorieVorhanden = readKategorie(kategorie);
			
			if(kategorieVorhanden) {
				pstmt.setString(1, kategorie);
			} else {
				pstmt.setString(2,kategorie);
				pstmt.setBinaryStream(3, filepart.getInputStream());
			}

			pstmt.executeUpdate();
			
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}

	}
	
	private boolean readKategorie(String kategorie) throws ServletException {
		
		// DB-Zugriff
				try (Connection con = ds.getConnection();
					 PreparedStatement pstmt = con.prepareStatement("SELECT * FROM wort WHERE kategorie = ?")) {
					
					pstmt.setString(1, kategorie);
					try(ResultSet rs = pstmt.executeQuery()) {
						if (rs!= null && rs.next()) {
							return true;
						}
					}				
					
				} catch (Exception ex) {
					throw new ServletException(ex.getMessage());
				}
				
				return false;
			}
	
	private SpielBilderMemorieBean read() throws ServletException {
		SpielBilderMemorieBean spielBilderMemorieBean = new SpielBilderMemorieBean();
		
		//DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT * FROM bild")) {

			try(ResultSet rs = pstmt.executeQuery()) {
				if (rs!= null && rs.next()) {
					spielBilderMemorieBean.setBild1ID(rs.getInt("id"));
					spielBilderMemorieBean.setBild1Kategorie(rs.getString("kategorie"));
					spielBilderMemorieBean.setBild1Stream(rs.getString("stream"));
				}
			}		
			
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		
		return spielBilderMemorieBean;

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
