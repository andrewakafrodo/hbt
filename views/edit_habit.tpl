%include ('head.tpl')

%include ('navbar.tpl')

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

%include ('tail.tpl')