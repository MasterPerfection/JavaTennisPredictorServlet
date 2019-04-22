package project3;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getParameter("doCount") != null) {
			String aWord = request.getParameter("word");

			response.getWriter().append("Data at: ").append(request.getContextPath());

			URL url = new URL("https://stackoverflow.com/");
			URLConnection urlConnection = url.openConnection();
			InputStream result = urlConnection.getInputStream();

			BufferedReader reader = new BufferedReader(new InputStreamReader(result));
			String line = null;
			int linecounter = 0;
			int urlCounter = 0;
			int wordCounter = 0;
			while ((line = reader.readLine()) != null) {
				String[] tokens = line.split(" ");
				for (int i = 0; i < tokens.length; i++) {
					if (tokens[i].contains(aWord)) {
						wordCounter++;
						response.getWriter().append("word line #" + linecounter + " :    " + tokens[i] + "<br>");
					}
					if (tokens[i].contains("href=\"http")) {
						urlCounter++;
						response.getWriter().append("url line #" + linecounter + " :    " + tokens[i] + "<br>");
					}
				}
				linecounter++;
			}
			reader.close();
			response.getWriter().append("<br><br>Number of urls: " + urlCounter + "<br>");
			response.getWriter().append("<br><br>Number of words: " + wordCounter + "<br>");
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/index.html");
			rd.forward(request, response); // forwarded to welcome page

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

