package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class CompanyRegister
 */
@WebServlet("/CompanyRegister")
@MultipartConfig
public class CompanyRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email= request.getParameter("email");
		String name=request.getParameter("name");
		String reg_no=request.getParameter("reg_no");
		String phone=request.getParameter("phone");
		Part p=request.getPart("logo");
		InputStream logo=p.getInputStream();
		String password=request.getParameter("password");
		String address=request.getParameter("address");
		int cid=(int)(Math.random()*100000);
		
		
		try {
			HttpSession session=request.getSession();
			dao.DbConnect db=new dao.DbConnect();
			HashMap<String,Object> company=new HashMap();
			company.put("email", email);
			company.put("name", name);
			company.put("reg_no", reg_no);
			company.put("phone", phone);
			company.put("logo", logo);
			company.put("password", password);
			company.put("address", address);
			company.put("cid", cid);
			boolean result=db.addCompany(company);
			if(result) {
				
				String r=mailcode.MailSendCode.sendMail(email, "Company Registration", 
						"Your Company successfully Registered with us. Your Company id is "+cid+" . Use this id for login. ");
				session.setAttribute("msg", "Company registered successfully. "+r);
				response.sendRedirect("Company.jsp");
			}else {
				session.setAttribute("msg", "Company Already Registered!");
				response.sendRedirect("Company.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			
			
		}
		
		
	}


