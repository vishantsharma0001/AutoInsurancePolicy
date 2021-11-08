<%@page import="java.util.HashMap" %>
<%@page import="java.util.ArrayList" %>
<%
String n=(String)session.getAttribute("admin_name");
if(n!=null){
	
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
	<%-- 	<div class="alert alert-success text-center">
			
			  Updation Success!
			  </div>
		--%>
		
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
                  <a class="nav-link text-secondary" href="index.jsp">HOME</a>
               </li>
                <li class="nav-item">
                 <label class="nav-link " >Welcome:<b> <%=n %> </b></label>
               </li>
               <li class="nav-item">
                  <a class="nav-link text-secondary" href="Logout">LOGOUT</a>
               </li>
              </ul>
              <div >
                  <a class="text-danger h5 mr-3" href="tel:+91-9997871677">CALL US TODAY: +91-9997871677</a>
              </div>
            </div>
        </nav>
        
        <section class='container p-4'>
       
     <%
        	dao.DbConnect db=new dao.DbConnect();
        	ArrayList<HashMap<String, String>> companies=db.getCompaniesByStatus("pending");
    		db.disconnect();
    		for(HashMap<String, String> companyDetails:companies){
    		%>	
       <div class='bg-light p-2'>
      
       <p>    
     
    <b>Name:</b> <%=companyDetails.get("name") %> <br>
      <b> Email:</b> <%=companyDetails.get("email") %><br>
	 <b>  Phone:</b> <%=companyDetails.get("phone") %> <br>   		
     <b>  Registration no.:</b> <%=companyDetails.get("reg_no") %><br>
     <b> Address:</b>  <%=companyDetails.get("address") %><br><br>
       
       <a href='ChangeCompanyStatus?cemail=<%=companyDetails.get("email") %>&status=activate' class='btn btn-success'>Activate</a>
       <a href='ChangeCompanyStatus?cemail=<%=companyDetails.get("email") %>&status=deactivate' class='btn btn-danger'>DeActivate</a>
			   
       </p>
       
       </div>
       
       
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
	response.sendRedirect("index.jsp");
}
%>