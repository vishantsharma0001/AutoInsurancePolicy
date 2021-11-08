package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CompanyLogin
 */
@WebServlet("/CompanyLogin")
public class CompanyLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int cid= Integer.parseInt(request.getParameter("cid"));
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	try {
		HttpSession session=request.getSession();
		dao.DbConnect db=new dao.DbConnect();
		String c_name=db.getCompanyLogin(cid,email,password);
		if(c_name!=null) {
			session.setAttribute("c_email", email);
			session.setAttribute("c_name", c_name);
			response.sendRedirect("CompanyHome.jsp");
		}
		else {
			session.setAttribute("msg", "wrong entries!");
			response.sendRedirect("Company.jsp");
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	
	}

}
