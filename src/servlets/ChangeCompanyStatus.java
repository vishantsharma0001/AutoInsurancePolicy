package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ChangeCompanyStatus")
public class ChangeCompanyStatus extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cemail=request.getParameter("cemail");
		String status=request.getParameter("status");
		try {
			HttpSession session=request.getSession();
			dao.DbConnect db=new dao.DbConnect();
			String m=db.updateComapnyStatus(cemail, status);
			session.setAttribute("msg",m);
			response.sendRedirect("adminHome.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
