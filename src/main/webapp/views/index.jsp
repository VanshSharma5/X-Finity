<!doctype html>
<html lang="en">
  <head>
  	<title>Login 01</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="style.css">

</head>
<body>
	<form style="background-color:lightblue" class="ftco-section" method="post" action="login">
		<div class="container">
			<div class="row justify-content-center"> 
				<div class="col-md-7 col-lg-5">
					<div class="login-wrap p-4 p-md-5">
						<c:if test="${not empty Msg}">
								<h5 style="background-color:pink;color:red">${Msg}</h5>
						<!-- sdfg -->
							</c:if>
                        <div class="icon d-flex align-items-center justify-content-center">
		      		        <span class="fa fa-user-o"></span>
		      	        </div>
		      	        <h3 class="text-center mb-4">Sign In</h3>
		      		<div class="form-group">
		      			<input type="text" name="name" class="form-control rounded-left" placeholder="Username" required>
		      		</div>
	            
                    <div class="form-group d-flex">
                    <input type="password" name="password" class="form-control rounded-left" placeholder="Password" required>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="form-control btn btn-primary rounded submit px-3">Login</button>
                    </div>
	                </div>	         
				</div>
			</div>
		</div>
	</form>
</body>
</html>

