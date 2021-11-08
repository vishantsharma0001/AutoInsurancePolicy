<!DOCTYPE html>
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
                  <a class="nav-link text-secondary" href="index.jsp">HOME</a>
                </li>
                
                <li class="nav-item">
                  <a class="nav-link text-secondary" href="Company.jsp">COMPANY</a>
                </li>
               
              </ul>
              
              <div >
                  <a class="text-danger h5 mr-3" href="tel:+91-9997871677">CALL US TODAY: +91-9997871677</a>
              </div>
            </div>
        </nav>
        
        <div class='container p-4'>
       		<div class='row'>
       			<div class='col-sm-4 bg-light p-4'>
       				<h4>Company Login:</h4>
       				<hr/>
		            <form action="CompanyLogin" method="post">
		              <div class="form-group">
		                <label>Company ID:</label>
		                <input type="text" pattern="[0-9]+" class="form-control" placeholder="Enter company id" id="id" name="cid" required>
		              </div>
		              <div class="form-group">
		                <label>Company Email ID:</label>
		                <input type="email" class="form-control" placeholder="Enter email id" id="email" name="email" required>
		              </div>
		              <div class="form-group">
		                <label>Password:</label>
		                <input type="password" class="form-control" placeholder="Enter password" id="pwd" name="password" required>
		              </div>
		              <button type="submit" class="btn btn-primary">Login</button>
		            </form>
       			</div>
       			<div class='col-sm-2 '>
       			</div>
       			<div class='col-sm-6 bg-light p-4'>
       				<h4>Company Registration:</h4>
       				<hr/>
		            <form action="CompanyRegister" method="post" enctype="multipart/form-data">
		              <div class="form-group">
		                <label>Company Email ID:</label>
		                <input type="email" class="form-control" placeholder="Enter email id" id="email" name="email" required>
		              </div>
		              <div class="form-group">
		                <label>Company Name:</label>
		                <input type="text" class="form-control" pattern="[a-z A-Z]+" placeholder="Enter Company Name" id="name" name="name" required>
		              </div>
		              <div class="form-group">
		                <label>Registration Number:</label>
		                <input type="text" class="form-control" placeholder="Enter Registration Number" id="reg_no" name="reg_no" required>
		              </div>
		              <div class="form-group">
		                <label>Contact Number:</label>
		                <input type="text" maxlength="10" minlength="10" pattern="[0-9]+" class="form-control" placeholder="Contact Number" id="phone" name="phone" required>
		              </div>
		              <div class="form-group">
		                <label>Company Logo:</label>
		                <input type="file" class="form-control" id="logo" name="logo" required>
		              </div>
		              <div class="form-group">
		                <label>Password:</label>
		                <input type="password" class="form-control" placeholder="Enter password" id="pwd" name="password" required>
		              </div>
		              <div class="form-group">
		                <label>Address:</label>
		                <textarea rows='3' class="form-control" placeholder="Enter Company Address" id="address" name="address" required></textarea>
		              </div>
		              <button type="submit" class="btn btn-primary">Register</button>
		            </form>
       			</div>
       		</div>
       	</div>
        
       
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