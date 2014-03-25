%include ('head.tpl')

%include ('navbar.tpl')

	    <div class="container">
	    	<div class"row">
		    	<h1 class="text-center">{{title}}</h1>
				<h2><span class="glyphicon glyphicon-user"></span> {{user['username']}} <small>{{user['dateJoined']}}</small></h2>
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