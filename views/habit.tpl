%include ('head.tpl')

%include ('navbar.tpl')

	    <div class="container">
	    	<h1 class="text-center">{{title}}</h1>
			<h2><span class="glyphicon glyphicon-header"></span> {{habit['name']}} <small>{{habit['dateCreated']}}</small></h2>
		</div>
		
%include ('tail.tpl')