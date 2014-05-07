%include ('head.tpl',  title=title, css='hbt')

%include ('navbar.tpl', logged_in=False)

	    <div class="container">
			<h1>error: {{error.status}}
				<small>oops! something did not go as planned.</small>
			</h1>
			<br>
			<p>{{error.body}}</p><br>
			<p>{{error.exception}}</p><br>
			<p>{{error.traceback}}</p><br>
		</div>

%include ('tail.tpl')