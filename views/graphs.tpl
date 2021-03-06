%include ('head.tpl', css='hbt')

%include ('navbar.tpl', logged_in=True)

	    <div class="container">
			<h1 class="text-center">{{title}}</h1>
	   		<canvas id="canvas" height="300" width="600"></canvas>
	   		<br><br>
	   		<div class="text-center">
			  	<div class="btn-group">
					<button type="button" class="btn btn-default">week</button>
					<button type="button" class="btn btn-default">month</button>
					<button type="button" class="btn btn-default">three months</button>
					<button type="button" class="btn btn-default">six months</button>
					<button type="button" class="btn btn-default">year</button>
				</div>
			</div>
		</div>
		<script src="/static/js/Chart.min.js"></script>


		<script>
			var lineChartData = {
			        labels : ["Jan","Feb","Mar","Apr","May","Jun","Jul"],
			        datasets : [
			                {
			                        fillColor : "rgba(151,187,205,0.5)",
			                        strokeColor : "rgba(151,187,205,1)",
			                        pointColor : "rgba(151,187,205,1)",
			                        pointStrokeColor : "#fff",
			                        data : [28,48,40,19,70,27,60]
			                }
			        ]
			}

			var myLine = new Chart(document.getElementById("canvas").getContext("2d")).Line(lineChartData);
		</script>

%include ('tail.tpl')