%include ('head.tpl', title=title, css='hbt')

%include ('navbar.tpl', logged_in=True)

	    <div class="container">
	    	<div class="row">
				<h1 class="text-center">{{title}}</h1>
			</div>
			<div class="row">
	   		<div class="text-center">
			  	<div class="btn-group">
			  		%for cat in categories:
						<button type="button" class="btn btn-default">{{cat}}</button>
					%end
				</div>
			</div>
			<div>
		</div>

%include ('tail.tpl')