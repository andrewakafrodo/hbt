%include ('head.tpl', title=title, css='hbt')

%include ('navbar.tpl', logged_in=True)

	    <div class="container">
	    	<div class="col-sm-2"></div>
			<div class="col-sm-10"><h2>new habit</h2></div>
			<form class="form-horizontal" role="form" action="/newhabit" method="POST">
			  <div class="form-group">
			    <label for="name" class="col-sm-2 control-label">name</label>
			    <div class="col-sm-10">
			      <input type="text" name="name" id="name" size="120" value="{{name}}" class="form-control" placeholder="take vitamins, beef up resume, floss, etc.">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="interval" class="col-sm-2 control-label">interval</label>
			    <div class="col-sm-10">
					<select name="interval" id="interval" class="form-control">
						<option>daily</option>
						<option>weekly</option>
						<option>monthly</option>
					</select>
			    </div>
			  </div>
  			  <div class="form-group">
			    <label for="categories" class="col-sm-2 control-label">categories</label>
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