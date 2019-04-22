/*ABDOUL BACHIR ZABEIROU OUMAROU
 * OO-JAVA PROJECT 3
 */

package prjct3_Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project1.Day;
import project1.Predictor;

/**
 * Servlet implementation class HelloServlet
 */
@WebServlet("/DataServlet")
public class DataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public String name = "uca";
	public String pass = "password";
	private Predictor p;
	private Day d;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DataServlet() {
		super();
		// TODO Auto-generated constructor stub

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("uname");
		String password = request.getParameter("psw");
		String responseLabel = "error";
		String responseLabelValue = "blabla ";

		Predictor p = new Predictor(
				"C:\\Temp\\Spring 2019\\O-O Software Development Java\\Homework\\Assignment\\Project3\\src\\project1\\Data.txt");
		Day d = new Day();

		if (username != null && password != null)
			if (username.equalsIgnoreCase(name) && password.equalsIgnoreCase(pass)) {

				RequestDispatcher rd = request.getRequestDispatcher("/secondPage.jsp");
				rd.forward(request, response); // forwarded to secondPage.jsp

			} else {

				RequestDispatcher dispatcher = request.getRequestDispatcher("/userlogin.jsp");
				dispatcher.forward(request, response);
			}

		if (request.getParameter("predict") != null) {

			String outlook = request.getParameter("outlook");
			String temperature = request.getParameter("temp");
			String humidity = request.getParameter("hum");
			String[] win = request.getParameterValues("wind");
			boolean windy = false;
			for (String value : win) {
				if (value.equals("yes"))
					windy = true;
				else if (value.equals("no"))
					windy = false;
			}

			int temp = Integer.parseInt(temperature);
			int hum = Integer.parseInt(humidity);

			d.setOutlook(outlook);
			d.setTemp(temp);
			d.setHumidity(hum);
			d.setWindy(windy);

			String predi = "";
			if (p.predict(d).equals("yes")) {
				predi = "YES, you can play tennis !";
			} else if (p.predict(d).equals("no")) {
				predi = "NO, don't play tennis !";
			}
			responseLabel = "prediction";
			responseLabelValue = predi;
			request.setAttribute(responseLabel, responseLabelValue);
			RequestDispatcher rd = request.getRequestDispatcher("/thirdPage.jsp");
			rd.forward(request, response);
		}
		if (request.getParameter("done") != null) {
			RequestDispatcher rd = request.getRequestDispatcher("/index.html");
			rd.forward(request, response);

		}
		if (request.getParameter("prd_A") != null) {

			RequestDispatcher rd = request.getRequestDispatcher("/secondPage.jsp");
			rd.forward(request, response);
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