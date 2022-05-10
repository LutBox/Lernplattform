//
//Erstellt von Lukas Theinert
//

package servlets;

import jakarta.servlet.http.HttpServlet;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import beans.SpielBilderMemorieBean;
import beans.SpielMatheBean;
import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class BildHochladenServlet
 */
@WebServlet("/BildHochladenServlet")
@MultipartConfig(
        maxFileSize=128*128*4,
        maxRequestSize=128*128*4*4, 
        location= "/tmp",
        fileSizeThreshold=128*128)



public class BildHochladenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BildHochladenServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		SpielBilderMemorieBean spielBilderMemorieBean = new SpielBilderMemorieBean();
		
		//Kategorie entgegennehmen 
		String kategorie = request.getParameter("kategorie");
		spielBilderMemorieBean.setBild1Kategorie(request.getParameter("kategorie"));
		

		// Logausgabe über empfangene Parts
		for (Part part : request.getParts()) {
			log("Part received: " + part.getName());
			if (part.getSubmittedFileName() != null)
				log("Filename written via BinaryStream: " + part.getSubmittedFileName());
		}

		
		// Filebehandlung
		Part filepart = request.getPart("image");
		spielBilderMemorieBean.setBild1Stream(filepart.getSubmittedFileName());
		
		String fileName = filepart.getSubmittedFileName();
		//System.out.println("fileName: " + fileName);

	/*
		// Bild übertragen
		try (ByteArrayOutputStream baos = new ByteArrayOutputStream();
			 InputStream in = filepart.getInputStream()	){
			int i=0;
			while ((i = in.read()) != -1) {
				baos.write(i);
			}
			spielBilderMemorieBean.setBild1(baos.toByteArray());
			baos.flush();
		} catch (IOException ex) {
			throw new ServletException(ex.getMessage());
		}
		*/

		
		// DB-Zugriff
		//Abfrage, ob Kategorie bereits vorhanden ist
		boolean kategorieVorhanden;
		kategorieVorhanden = read(spielBilderMemorieBean);
		
		if(kategorieVorhanden) {
			persist2(spielBilderMemorieBean, filepart);
		} else {
			persist(spielBilderMemorieBean, filepart);
			persist2(spielBilderMemorieBean, filepart);
		}
		


		
		//datenDB = read();
		
		// Infos werden nur für mehrere Requests gespeichert innerhalb einer Bean
		final HttpSession session = request.getSession();
		session.setAttribute("kategorie", kategorie);
		session.setAttribute("datenDB", spielBilderMemorieBean);
		
		// Weiterleiten an JSP
		final RequestDispatcher dispatcher = request.getRequestDispatcher("html/verwaltungsseiten/bildHochladenFertig.jsp");
		dispatcher.forward(request, response);
		

	}
	
	private boolean read(SpielBilderMemorieBean spielBilderMemorieBean) throws ServletException {
		//SpielBilderMemorieBean spielBilderMemorieBean = new SpielBilderMemorieBean();
		
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"Select kategorie from wort where kategorie = (?)")) {
		
			pstmt.setString(1,spielBilderMemorieBean.getBild1Kategorie());
			try(ResultSet rs = pstmt.executeQuery()) {
				if (rs!= null && rs.next()) {
					//spielBilderMemorieBean.setBild1Kategorie(rs.getString("kategorie"));
					return true;
				}
				return false;
			}
			
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		
	}
	

	private void persist(SpielBilderMemorieBean spielBilderMemorieBean, Part filepart) throws ServletException {
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"INSERT INTO wort (kategorie) VALUES (?)")) {
		
				pstmt.setString(1, spielBilderMemorieBean.getBild1Kategorie());
			pstmt.executeUpdate();
			
			
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}

	}
	
	private void persist2(SpielBilderMemorieBean spielBilderMemorieBean, Part filepart) throws ServletException {
		// DB-Zugriff
		String[] generatedKeys = new String[] {"id"};	// Name der Spalte(n), die automatisch generiert wird(werden)
		
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(

						"INSERT INTO bild (kategorie, image) VALUES (?,?)", generatedKeys)) {
			
				pstmt.setString(1,spielBilderMemorieBean.getBild1Kategorie());
				pstmt.setBinaryStream(2, filepart.getInputStream());

			pstmt.executeUpdate();
			
			try (ResultSet rs = pstmt.getGeneratedKeys()) {
				int i = 1;
				while (rs.next()) {
					if (i++ == 1)
						spielBilderMemorieBean.setBild1ID(rs.getInt(1));
					else
						spielBilderMemorieBean.setBild1ID(rs.getInt(1));
				}
			}
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}

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
