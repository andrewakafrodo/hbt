%include ('head.tpl')


		<div class="navbar navbar-default navbar-fixed-top" role="navigation">
		  <div class="container">
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="/">hbt</a>
		    </div>
		    <div class="navbar-collapse collapse">
		      <ul class="nav navbar-nav">
		        <li><a href="/habits">habits</a></li>
		        <li><a href="/categories">categories</a></li>
		        <li><a href="/graphs">graphs</a></li>
		      </ul>
		      <ul class="nav navbar-nav navbar-right">
		      	<li><a></a></li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{user['username']}}<b class="caret"></b></a>
		          <ul class="dropdown-menu">
		            <li><a href="/profile">profile</a></li>
		           	<li><a href="/logout">logout</a></li>
		          </ul>
		        </li>
		      </ul>
		    </div>
		  </div>
		</div>

	    <div class="container">
	    	<h1 class="text-center">{{title}}</h1>
			<h2><span class="glyphicon glyphicon-header"></span> {{habit['name']}} <small>{{habit['dateCreated']}}</small></h2>
		</div>

		<script src="//code.jquery.com/jquery.js"></script>
		<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>
		<script src="/static/js/habits.js"></script>
	</body>
</html>