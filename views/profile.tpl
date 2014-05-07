%include ('head.tpl', title=title, css='hbt')

%include ('navbar.tpl', logged_in=True)

	    <div class="container">
	    	<div class"row">
		    	<h1 class="text-center">profile</h1>
		    	<div class="row">
					<p class="lead pull-left"><span class="glyphicon glyphicon-user"></span> {{user['username']}} <small>{{user['dateJoined']}}</small></p>
					<a href="/edit_profile"><button type="button" class="btn btn-default pull-right">edit profile <i class="fa fa-cog"></i></button></a>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<h4>your habits</h4>
					<ol>
						%for habit in habits:
							<li>{{habit['name']}}</li>
						%end
					</ol>
				</div>
				<div class="col-md-3">
					<h4>your categories</h4>
					<ol>
						%for cat in categories:
							<li>{{cat}}</li>
						%end
					</ol>
				</div>
				<div class="col-md-3">
					<h4>best habits</h4>
					<ol>
						%for habit in best_habits:
							<li>{{habit}}</li>
						%end
					</ol>
				</div>
				<div class="col-md-3">
					<h4>worst habits</h4>
					<ol>
						%for habit in worst_habits:
							<li>{{habit}}</li>
						%end
					</ol>
				</div>
		</div>

%include ('tail.tpl')