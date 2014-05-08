%include ('head.tpl', css='hbt')

%include ('navbar.tpl', logged_in=True)

	    <div class="container text-center">
			<h2>delete habit: {{habit['name']}}</h2>
		    <button id="{{habit['name']}}" class="btn btn-danger btn-lg">delete habit</button>
		</div>

%include ('tail.tpl')