package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import beans.SpielBilderMemorieBean;
import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



@WebServlet("/AlleBilderAnzeigenServlet")
public class AlleBilderAnzeigenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	@Resource(lookup="java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());

		List<SpielBilderMemorieBean> bilderListe = new ArrayList<>();
		//List<Integer> bilderListe = new ArrayList<>();
		bilderListe = read();

		
		//System.out.println("LISTE DER BILDER-IDS: " + bilderListe);
		
		//Infos werden nur für mehrere Requests gespeichert innerhalb einer Bean
		final HttpSession session = request.getSession();
		session.setAttribute("bilderListe", bilderListe);

		//Weiterleiten an JSP
			final RequestDispatcher dispatcher = request.getRequestDispatcher("html/verwaltungsseiten/bilderAnzeigen.jsp");
			dispatcher.forward(request, response);

	}
	
	private List<SpielBilderMemorieBean> read() throws ServletException {
		List<SpielBilderMemorieBean> bilderListe = new ArrayList<>();
		
		//DB-Zugriff
		try (Connection con = ds.getConnection();
				PreparedStatement pstmt = con.prepareStatement(
						"SELECT id FROM bild;")) {

			try(ResultSet rs = pstmt.executeQuery()) {
				while (rs!= null && rs.next()) {
					//bilderListe.add(rs.getInt("id"));
					SpielBilderMemorieBean spielBilder = new SpielBilderMemorieBean();
					spielBilder.setBild1ID(rs.getLong("id"));
					bilderListe.add(spielBilder);
				}
			}
			
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}
		return bilderListe;		

	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
