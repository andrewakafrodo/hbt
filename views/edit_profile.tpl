%include ('head.tpl', title=title, css='hbt')

%include ('navbar.tpl', logged_in=True)

	    <div class="container">
	    	<h1 class="text-center">edit profile</h1>
	    	<div class="row">
				<h1 class="pull-left"><span class="glyphicon glyphicon-user"></span> {{username}}</h1>
			</div>
			<div class="row">
				<div class="col-md-3">
			        <a href="#"><button class="btn btn-default">change password</button></a>
				</div>
			</div>
		</div>

%include ('tail.tpl')