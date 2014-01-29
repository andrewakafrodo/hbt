<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>hbt</title>
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="/static/css/hbt.css">
	</head>
	<body>

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
	            <li><a href="/">habits</a></li>
	            <li><a href="/categories">categories</a></li>
	            <li><a href="/graphs">graphs</a></li>
	          </ul>
	          <ul class="nav navbar-nav navbar-right">
	          	<li><a></a></li>
	            <li class="dropdown">
	              <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{username}}<b class="caret"></b></a>
	              <ul class="dropdown-menu">
	                <li><a href="/profile">profile</a></li>
    	           	<li><a href="/logout">logout</a></li>
	              </ul>
	            </li>
	          </ul>
	        </div><!--/.nav-collapse -->
	      </div>
	    </div>

	    <div class="container">
	    	<div class="col-sm-2"></div>
			<div class="col-sm-10"><h2>edit habit</h2></div>
			<form class="form-horizontal" role="form" action="/edit_habit" method="POST">
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">name</label>
			    <div class="col-sm-10">
			      <input type="text" name="name" id="name" size="120" value="{{name}}" class="form-control" placeholder="take vitamins, beef up resume, floss, etc.">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputPassword3" class="col-sm-2 control-label">interval</label>
			    <div class="col-sm-10">
			      <input type="text" name="interval" id="interval" class="form-control" placeholder="daily, weekly, monthly, etc.">
			    </div>
			  </div>
  			  <div class="form-group">
			    <label for="inputPassword3" class="col-sm-2 control-label">occurence</label>
			    <div class="col-sm-10">
			      <input type="text" name="occurence" id="occurence" class="form-control" placeholder="once, twice, thrice, etc.">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputPassword3" class="col-sm-2 control-label">reminders</label>
			    <div class="col-sm-10">
			      <input type="text" name="daily" id="daily" class="form-control" placeholder="bring canteen, make sure to check LinkedIn, bring ear plugs, etc.">
			    </div>
			  </div>
  			  <div class="form-group">
			    <label for="inputPassword3" class="col-sm-2 control-label">categories</label>
			    <div class="col-sm-10">
			      <input type="text" name="categories" id="categories" class="form-control" placeholder="body, self-improvement, cleaning, etc.">
			    </div>
			  </div>
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="submit" class="btn btn-success">add habit</button>
			    </div>
			  </div>
			</form>
		</div>



	<script src="//code.jquery.com/jquery.js"></script>
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>
	</body>
</html>