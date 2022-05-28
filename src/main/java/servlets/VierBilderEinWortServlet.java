package servlets;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import beans.SpielVierBilderEinWortBean;
import beans.VierBilderEinWortScoreBean;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
//select * from bild where wortId=( Select id from wort order by Rand() Limit 1);
/**
 * Servlet implementation class VierBilderEinWortServlet
 */
@WebServlet("/VierBilderEinWortServlet")
public class VierBilderEinWortServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(lookup = "java:jboss/datasources/MySqlThidbDS")
	private DataSource ds;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VierBilderEinWortServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String  kategorie;
		// 1) zufälliges Wort aus der Datenbank laden
		//Order by Rand() Limt 1//
		      try( Connection con = ds.getConnection();
		    		  PreparedStatement pstmt= con.prepareStatement("Select kategorie from wort order by Rand() limit 1")){
		    	  
		    	      ResultSet rs = pstmt.executeQuery();
		    	      rs.next();
		    	      kategorie = rs.getString(1);
		      } catch (SQLException ex) {
				// TODO Auto-generated catch block
				ex.printStackTrace();
				throw new ServletException(ex);
			}	
		      
		      int[] imageIds = new int[4];
		      
		      try( Connection con = ds.getConnection();
		    		  PreparedStatement pstmt= con.prepareStatement("select id from bild where kategorie=?")){
		    	      pstmt.setString(1, kategorie);
		    	      ResultSet rs = pstmt.executeQuery();
		    	      for(int i = 0; i < 4; i++) {
		    	    	  rs.next();

		    	    	  imageIds[i] = rs.getInt(1);
		    	      }
		      } catch (SQLException ex) {
				// TODO Auto-generated catch block
				ex.printStackTrace();
				throw new ServletException(ex);
			}	
		    // 3) Ids in die Bean schreiben (z.B. als Attribute, Array, etc)
		    SpielVierBilderEinWortBean bean = new SpielVierBilderEinWortBean();
		    bean.setWort(kategorie);
		    bean.setBild1(imageIds[0]);
		    bean.setBild2(imageIds[1]);
		    bean.setBild3(imageIds[2]);
		    bean.setBild4(imageIds[3]);
		    
		   //  4) in request legen
		    request.setAttribute("spielVierBilderEinWortBean", bean);
		    // 5) forward to jsp, damit die Bilder angezeig werden können
		    request.getRequestDispatcher("html/spieleseiten/spiel_bilderWort_spielen.jsp").forward(request, response);	      
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession  session =   request.getSession(); // Gibt eine Session
	// 
	VierBilderEinWortScoreBean  score =(VierBilderEinWortScoreBean) session.getAttribute("vierBilderEinWort");
	score.setVersuche(score.getVersuche()+1);
	if (request.getParameter("userEingabe").equalsIgnoreCase(request.getParameter("loesung"))) {
		score.setRichtigeErgebnis(score.getRichtigeErgebnis()+1);
		
		// Die Zeit  in die Bean liegen
         
		// Zeit auslesen
		//Zeit jetzt und vergangenen Zeit vergleichen 
		
		
	}
	
	// Wenn Zeit abgelaufen ist stattdessen auf Ergebnisseite
		response.sendRedirect("VierBilderEinWortServlet");
	}

}
