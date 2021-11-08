<%@ page import="java.util.HashMap" %>
<%
String c_email=(String)session.getAttribute("c_email");
String c_name=(String)session.getAttribute("c_name");


if(c_email!=null){
	
%>
<html>
    <head>
        <title>Auto Insurance</title>
        <link rel="icon" href="resource/autoinsurance-icon.png"/>
        
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
        
        <!-- AOS css and JS -->
        <link rel="stylesheet" href="resource/aos/aos.css">
        <script src="resource/aos/aos.js"></script>
        <!-- AOS css and JS END-->

        <!-- fontawesome -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" >
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <!-- fontawesome END -->

        <!-- Lightbox CSS & Script -->
        <script src="resource/lightbox/ekko-lightbox.js"></script>
        <link rel="stylesheet" href="resource/lightbox/ekko-lightbox.css"/>

        

        <!-- custom css-->
        <link rel="stylesheet" href="resource/custom.css"/>
        <!-- custom css END-->

        <meta name="author" content="vishant sharma"/>
        <meta name="description" content="This is a Auto Insurance website"/>
        <meta name="keywords" content="best Insurance comapny in noida"/>
    </head>
    <body>
    
    <%
			String m=(String)session.getAttribute("msg");
			if(m!=null){
		%>
			<%
			if(m.contains("success")){
			%>
			<div class="alert alert-success text-center">
			<%	
			}else{
			%>
			<div class="alert alert-danger text-center">
			<%		
			}
			%>
			  <%=m %>
			</div>
 
		<%
			session.setAttribute("msg",null);
			}
		%>
        <nav class="navbar navbar-expand-sm sticky-top bg-light">
            <a class="navbar-brand c-font" href="">
              <img src='resource/autoinsurance-icon.png' width="30px"/> <span class="text-danger font-weight-bold ">Auto</span><span class="text-muted">Insurance</span>
            </a>
            <button class="navbar-toggler bg-light" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <!-- <span class="navbar-toggler-icon text-dark"> <i class="fas fa-sort-down"></i> </span> -->
                <span class="fa fa-bars"></span> Menu
            </button>
            <div class="collapse navbar-collapse " id="collapsibleNavbar"  >
              <ul class="navbar-nav mx-auto ">
               <li class="nav-item">
                  <a class="nav-link text-secondary" href="CompanyHome.jsp">HOME</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link text-secondary" href="CompanyPolicies.jsp">All Policies</a>
                </li>
                <li class="nav-item">
                	<label class="nav-link"> Welcome: <b><%=c_name %></b> </label>
                </li>
                <li class="nav-item">
                  <a class="nav-link text-secondary" href="Logout">Logout</a>
                </li>    
              </ul>
              <div >
                  <a class="text-danger h5 mr-3" href="tel:+91-9997871677">CALL US TODAY: +91-9997871677</a>
              </div>
            </div>
        </nav>
        
         <section class='container p-4'>
        		<div class='bg-warning p-3'>
	        		<%
	        		dao.DbConnect db=new dao.DbConnect();
	        		HashMap<String, String> company_details=db.getCompanyDetails(c_email);
	        		db.disconnect();
	        		String status=company_details.get("status");
	        		%>
        			<p>Company Status: <%=status %> </p>
        		</div>
        		<%
        		if(!status.equalsIgnoreCase("pending") && !status.equalsIgnoreCase("deactivate")){
        		%>
        			<br/><br/>
        			<h2>Add Policy</h2>
        			<form action='AddPolicy' method="post">
        				<div class="form-group">
		                  <label >Policy Name:</label>
		                  <input type="text" class="form-control" placeholder="Enter name" id="p_name" name="p_name" required>
		                </div>
		                <div class="form-group">
		                  <label >SumInsured Amount:</label>
		                  <input type="number" class="form-control" placeholder="Enter amount" id="p_si_amt" name="p_si_amt" required>
		                </div>
		                <div class="form-group">
		                  <label >Category:</label><br>
		                 <b> Car</b> <input type="radio" class="form-control" name="category" value='Car' checked>
		                 <b> Bike</b> <input type="radio" class="form-control" name="category" value='Bike' checked>
		                </div>
		                <div class="form-group">
		                  <label >Policy Description:</label>
		                  <textarea rows='3' class="form-control" placeholder="Enter Policy Description" name="p_desc" required></textarea>
		                </div>
		                <button type="submit" class="btn btn-primary">ADD</button>
        			</form>
        			
        		<%	
        		}
        		%>
        </section>
        
        
        <footer class="bg-dark p-4">
          <p class="text-white">
            Design by vishantsharma <a href="#" target="_blank"></a> &copy; Rights reserved
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Social Media: 
            <a href="https://www.facebook.com/realvishant "><i class="fab fa-facebook"></i></a>
            &nbsp;
            <a href="https://www.instagram.com/vishantpanditofficial/"><i class="fab fa-instagram"></i></a>
          </p>
        </footer>

      
    </body>
    <script>
      AOS.init();

      //script for light box
      $(document).on('click', '[data-toggle="lightbox"]', function(event) {
          event.preventDefault();
          $(this).ekkoLightbox();
      });

      //Script for Scroll to Top button for hide and show
      $(window).scroll(function() {
          if ($(this).scrollTop()) {
              $('#myTopBtn').fadeIn();
          } else {
              $('#myTopBtn').fadeOut();
          }
      });
      //script for scroll to top
      $("#myTopBtn").click(function () {
        $("html, body").animate({scrollTop: 0}, 1000);
      });

      
    </script>
</html>
<%
}else{
	session.setAttribute("msg","Plz login!");
	response.sendRedirect("Company.jsp");
}
%>