%include ('head.tpl', title=title, css='hbt')

%include ('navbar.tpl', logged_in=True)

	    <div class="container text-center">
	    	<h1>edit profile</h1>
	    	<div class="row">
				<h2><span class="glyphicon glyphicon-user"></span> {{username}}</h2>
		        <a href="#"><button class="btn btn-default">change password</button></a>
		        <br>
		        <br>
		        <a href="#"><button class="btn btn-default">change username</button></a>
			</div>
		</div>

%include ('tail.tpl')