package edu.thi.demo;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Uhrzeit
 */
@WebServlet("/Uhrzeit")
public class Uhrzeit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		log("init() in Demo01Servlet reached");
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		super.destroy();
		log("destroy() in Demo01Servlet reached");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Erstes Servlet antwortet mit dem aktuellen Datum
		log("doGet() in Demo01Servlet reached");
		final PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<body>");
		out.println("<h3>Servlet zur Ausgabe des aktuellen Datums und der aktuellen Uhrzeit</h3>");
		out.println("Datum: <b>" + new Date() + "</b>");
		out.println("</body>");
		out.println("</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
