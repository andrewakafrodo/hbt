
<div class="row" style="position: relative">
	<h1 class="text-center">{{title}}</h1>
	<div style="position: absolute; top: 20px; right: 0px;">
		<a id="add-habit" type="button" href="/newhabit" class="btn btn-success btn-sm">new habit</a>
	</div>		
</div>

<div class="text-center">
	%if interval == "daily":
		<a href="/habits/daily" role="button" class="btn btn-default active">daily</a>
		<a href="/habits/weekly" role="button" class="btn btn-default">weekly</a>
		<a href="/habits/monthly" role="button" class="btn btn-default">monthly</a>
	%elif interval == "weekly":
		<a href="/habits/daily" role="button" class="btn btn-default">daily</a>
		<a href="/habits/weekly" role="button" class="btn btn-default active">weekly</a>
		<a href="/habits/monthly" role="button" class="btn btn-default">monthly</a>
	%elif interval == "monthly":
		<a href="/habits/daily" role="button" class="btn btn-default">daily</a>
		<a href="/habits/weekly" role="button" class="btn btn-default">weekly</a>
		<a href="/habits/monthly" role="button" class="btn btn-default active">monthly</a>
</div>