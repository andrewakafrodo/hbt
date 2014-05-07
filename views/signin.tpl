%include ('head.tpl', title=title, css='welcome')

%include ('navbar.tpl', logged_in=False)

    <div class="container text-center">
		<form class="form-signin" action="/signin" method="post">
			<h2 class="form-signin-heading text-center">sign in</h2>
			<input type="text" class="form-control" placeholder="username" name="username" required="" autofocus="" value="{{username}}">
			<input type="password" class="form-control" placeholder="password" name="password" required=""> 
			<label class="error" for="password"><p class="error">{{login_error}}</p></label>
			<button class="btn btn-lg btn-primary btn-block" type="submit">sign in</button>
		</form>
	</div>

%include ('tail.tpl')