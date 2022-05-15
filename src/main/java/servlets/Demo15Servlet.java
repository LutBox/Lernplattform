package servlets;

import java.io.IOException;

import beans.FormBean_15;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Demo15Servlet
 */
@WebServlet("/demo15servlet")
public class Demo15Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String meterParam = request.getParameter("meter");
		Double meter = Double.valueOf(meterParam == null || meterParam.length() == 0 ? "0" : meterParam);
		Double meilen = meter * 0.0006213711922373339D;
		Double yards = meter * 1.0936133D;
		FormBean_15 form = new FormBean_15();
		form.setMeter(meter);
		form.setMeilen(meilen);
		form.setYards(yards);
		request.setAttribute("form", form);
		RequestDispatcher dispatcher = request.getRequestDispatcher("15_formausgabe.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
