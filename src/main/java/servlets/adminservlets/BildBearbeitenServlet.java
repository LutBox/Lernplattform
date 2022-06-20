//
//Erstellt von Lukas Theinert
//
package servlets.adminservlets;

import jakarta.servlet.http.HttpServlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import beans.BilderAnzeigen;
import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class SpielMatheServlet
 */
@WebServlet("/BildBearbeitenServlet")
public class BildBearbeitenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(lookup="java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BildBearbeitenServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		request.getParameter("bildID");
		String bildID = request.getParameter("bildID");
		//log("output text:" + bildID);
		BilderAnzeigen bild = read(bildID);
		List<BilderAnzeigen> kategorieListe  = readKategorie();
		
		
				
		//Infos werden nur für mehrere Requests gespeichert innerhalb einer Bean
		final HttpSession session = request.getSession();
		session.setAttribute("bild", bild);
		session.setAttribute("kategorieListe", kategorieListe);

		//Weiterleiten an JSP
			final RequestDispatcher dispatcher = request.getRequestDispatcher("./html/verwaltungsseiten/bildBearbeiten.jsp");
			dispatcher.forward(request, response); 
	}
	
	private BilderAnzeigen read(String bildID) throws ServletException {
		BilderAnzeigen bild = new BilderAnzeigen();
		
		// DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"Select * from bild where id = (?)")) {
		
			pstmt.setString(1, bildID);
			try(ResultSet rs = pstmt.executeQuery()) {
				if (rs!= null && rs.next()) {
					bild.setBildID(rs.getLong("id"));
					bild.setBildKategorie(rs.getString("kategorie"));
				}
			}			
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		return bild;
	}
	
	private List<BilderAnzeigen> readKategorie() throws ServletException {
		List<BilderAnzeigen> kategorieListe = new ArrayList<>();
		
		//DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT DISTINCT kategorie FROM bild;")) {

			try(ResultSet rs = pstmt.executeQuery()) {
				while (rs!= null && rs.next()) {
					BilderAnzeigen spielBilder = new BilderAnzeigen();
					spielBilder.setBildKategorie(rs.getString("kategorie"));
					kategorieListe.add(spielBilder);
				}
			}
			
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		return kategorieListe;		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

