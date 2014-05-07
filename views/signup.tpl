%include ('head.tpl', title=title, css='welcome')

%include ('navbar.tpl', logged_in=False)

    <div class="container text-center">
		<form class="form-signup" action="/signup" method="post">
			<h2 class="form-signup-heading text-center">sign up</h2>
			<input type="text" class="form-control" placeholder="username" name="username" required="" autofocus="" value="{{username}}">
			<input type="text" class="form-control" placeholder="email" name="email" required="" autofocus="" value="{{email}}">
			<input type="password" class="form-control" placeholder="password" name="password" required="">
			<input type="password" class="form-control" placeholder="reenter password" name="verify" required="">
			<label class="error">{{username_error}}{{email_error}}{{password_error}}{{verify_error}}</label>
			<button class="btn btn-lg btn-primary btn-block" type="submit">sign up</button>
		</form>
	</div>

%include ('tail.tpl')