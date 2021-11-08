package servlets;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.sql.*;
import java.util.HashMap;

import dao.DbConnect;

/**
 * Servlet implementation class UserRegister
 */
@WebServlet("/UserRegister")
@MultipartConfig
public class UserRegister extends HttpServlet {


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String email=request.getParameter("email");
	String name=request.getParameter("name");
	String phone=request.getParameter("phone");
	String address=request.getParameter("address");
	Part p=request.getPart("photo");
	InputStream photo=p.getInputStream();
	String password=request.getParameter("password");
	try {
		HttpSession session=request.getSession();
		dao.DbConnect db=new dao.DbConnect();
		HashMap<String, Object> user=new HashMap();
		user.put("email",email);
		user.put("name",name);
		user.put("phone",phone);
		user.put("address",address);
		user.put("photo",photo);
		user.put("password",password);
		boolean result=db.addUser(user);
		if(result) {
			session.setAttribute("u_email", email);
			session.setAttribute("u_name", name);
			response.sendRedirect("UserHome.jsp");
			
		}else {
			session.setAttribute("msg","User Already Registered!");
			response.sendRedirect("index.jsp");
		}
		
		
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	}
	

}
