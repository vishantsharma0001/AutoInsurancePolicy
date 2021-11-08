package dao;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

public class DbConnect {
    private Connection c;
    public DbConnect() throws Exception {
    Class.forName("com.mysql.cj.jdbc.Driver");
    c=DriverManager.getConnection("jdbc:mysql://localhost:3306/autoinsurancedb","root","vishant1997");
    
    }
    
    public void  disconnect() throws Exception{
    	if(c !=null && !c.isClosed() ) {
    		c.close();
    	}
    }

    public String getAdminLogin(String email,String password) throws Exception{
		PreparedStatement p=c.prepareStatement("select name from admin where email=? and password=?");
		p.setString(1, email);
		p.setString(2, password);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			return rs.getString("name");
		}else {
			return null;
		}
	}

    
	public boolean addCompany(HashMap<String, Object> company) throws Exception {
		try {
			PreparedStatement p=c.prepareStatement("insert into company (email,name,reg_no,phone,logo,password,address,status,cid) values (?,?,?,?,?,?,?,?,?)");
			p.setString(1, (String)company.get("email"));
			p.setString(2, (String)company.get("name"));
			p.setString(3, (String)company.get("reg_no"));
			p.setString(4, (String)company.get("phone"));
			p.setBinaryStream(5, (InputStream)company.get("logo"));
			p.setString(6, (String)company.get("password"));
			p.setString(7, (String)company.get("address"));
			p.setString(8, "pending");
			p.setInt(9, (int)company.get("cid"));
			p.executeUpdate();
			return true;
		}catch(SQLIntegrityConstraintViolationException e) {
			return false;
		}
	}
	
	public HashMap<String,String> getAdminDetails() throws Exception{
		PreparedStatement p=c.prepareStatement("select * from admin");
		ResultSet rs=p.executeQuery();
		rs.next();
		HashMap<String,String> h=new HashMap();
		h.put("email", rs.getString("email"));
		h.put("password", rs.getString("password"));
		return h;
	}

	public String getCompanyLogin(int cid, String email, String password) throws SQLException {
		PreparedStatement p=c.prepareStatement("select name from company  where cid=? and email=? and password=?");
		p.setInt(1, cid);
		p.setString(2, email);
		p.setString(3, password);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			return rs.getString("name");
		}else {
			return null;
		}
	}
	
	
	public HashMap<String, String>  getCompanyDetails(String email) throws Exception{
		PreparedStatement p=c.prepareStatement("select * from company where email=?");
		p.setString(1, email);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			HashMap<String, String> company_details=new HashMap<String, String>();
			company_details.put("email", rs.getString("email"));
			company_details.put("name", rs.getString("name"));
			company_details.put("phone", rs.getString("phone"));
			company_details.put("address", rs.getString("address"));
			company_details.put("reg_no", rs.getString("reg_no"));
			company_details.put("status", rs.getString("status"));
			
			return company_details;
		}else {
			return null;
		}
	}

	
	public ArrayList<HashMap<String, String>>  getCompaniesByStatus(String status) throws Exception{
		PreparedStatement p=c.prepareStatement("select * from company where status=?");
		p.setString(1, status);
		ResultSet rs=p.executeQuery();
		ArrayList<HashMap<String, String>> companies=new ArrayList();
		while(rs.next()) {
			HashMap<String, String> company_details=new HashMap<String, String>();
			company_details.put("email", rs.getString("email"));
			company_details.put("name", rs.getString("name"));
			company_details.put("phone", rs.getString("phone"));
			company_details.put("address", rs.getString("address"));
			company_details.put("reg_no", rs.getString("reg_no"));
			company_details.put("status", rs.getString("status"));
			
			companies.add(company_details);
		}
		return companies;
	}

	public String updateComapnyStatus(String cemail,String status) throws Exception{
		PreparedStatement p=c.prepareStatement("update company set status=? where email=?");
		p.setString(1, status);
		p.setString(2, cemail);
		int x=p.executeUpdate();
		if(x==0) {
			return "Updation Failed!";
		}else {
			return "Updation Success!";
		}
	}

	public boolean addPolicy(HashMap<String, Object> policy) throws Exception {
		PreparedStatement p1=c.prepareStatement("select * from policy where c_email=? and p_name=?");
		p1.setString(1, (String)policy.get("c_email"));
		p1.setString(2, (String)policy.get("p_name"));
		ResultSet rs=p1.executeQuery();
		if(rs.next()) {
			return false;
		}else {
			PreparedStatement p=c.prepareStatement("insert into policy (p_name,p_si_amt,p_desc,c_email,status,category) values (?,?,?,?,'active',?)");
			p.setString(1, (String)policy.get("p_name"));
			p.setInt(2, (int)policy.get("p_si_amt"));
			p.setString(3, (String)policy.get("p_desc"));
			p.setString(4, (String)policy.get("c_email"));
			p.setString(5, (String)policy.get("category"));
			p.executeUpdate();
			return true;
		}
		
	}

	public boolean addUser(HashMap<String, Object> user) throws Exception{
		try {
			PreparedStatement p=c.prepareStatement("insert into users(email,name,phone,address,photo,password) values(?,?,?,?,?,?)");
			p.setString(1, (String)user.get("email"));
			p.setString(2, (String)user.get("name"));
			p.setString(3, (String)user.get("phone"));
			p.setString(4, (String)user.get("address"));
			p.setBinaryStream(5, (InputStream)user.get("photo"));
			p.setString(6, (String)user.get("password"));
			p.executeUpdate();
			return true;
		}catch(SQLIntegrityConstraintViolationException e) {
			return false;
		}
		
	}

	
	
	
}

	
