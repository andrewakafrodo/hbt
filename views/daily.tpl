%include ('head.tpl', title=title, css='hbt')

	%include ('navbar.tpl', logged_in=True)

		<div class="container">
	
			%include('habit_header.tpl', title=title, interval=interval)

			<br>
			<br>

			%today = datetime.datetime.now()

			<div class="visible-xs visible-sm">
				%for habit in myhabits:

					%active = datetime.datetime.strptime(habit['dateCreated'], "%Y-%m-%d")

					%if habit['completedIntervals'][str((today - active).days)]:
						<div class="habit-row bg-success">
							<i class="fa fa-check-circle-o fa-3x habit-check" style="position:absolute; top:5px; right:20px;"></i>
							<h3 class="text-left habit-row-name">{{habit['name']}}</h3>
							<p class="text-left"> days in a row</p>
						</div>
					%else:
						<div class="habit-row bg-danger">
							<i class="fa fa-circle-o fa-3x habit-check" style="position:absolute; top:5px; right:20px;"></i>
							<h3 class="text-left habit-row-name">{{habit['name']}}</h3>
							<p class="text-left"> days since</p>
						</div>
					%end						

				%end
			</div>

			<div class="visible-md visible-lg">

				<div class="row">

					%for (i, habit) in enumerate(myhabits):

						%if i == 0:
							%if len(myhabits) % 2 == 0:
								<div class="habit-column col-md-1 text-center col-md-offset-{{(12-len(myhabits))/2}}">
							%else:
								<div class="habit-column col-md-1 text-center col-md-offset-{{((12-len(myhabits))/2) + 1}}">
							%end
						%else:
							<div class="habit-column col-md-1 text-center">
						%end

							<div class="habit-title dropdown">
								<p id="drop4" role="button" data-toggle='dropdown' href="#">{{habit['name']}}</p>
								<i class="fa fa-cog"></i>
								<ul id="menu1" class="dropdown-menu" role="menu" aria-labelledby="drop4">
									<li role="presentation"><a role="menuitem" tabindex="-1" href="/habit/{{habit['name'].replace(' ', '_').replace('\'', '')}}/edit">edit</a></li>
									<li role="presentation"><a role="menuitem" tabindex="-1" href="/habit/{{habit['name'].replace(' ', '_').replace('\'', '')}}/delete">delete</a></li>
								</ul>
							</div>

						</div>
					%end
				</div>

				<br>


				%for x in range(intervals.days):
					<div class="row">

						%if len(myhabits) % 2 == 0:
							<div class="habit-column col-md-1 text-center col-md-offset-{{((12-len(myhabits))/2)-1}}">
								<p>{{(today - datetime.timedelta(days=x)).date()}}</p>
							</div>
						%else:
							<div class="habit-column col-md-1 text-center col-md-offset-{{((12-len(myhabits))/2)}}">
								<p>{{(today - datetime.timedelta(days=x)).date()}}</p>
							</div>
						%end

							%for habit in myhabits:

								<div class="habit-column col-md-1 text-center">
									%days_between = today - datetime.timedelta(days=x)
									%active = datetime.datetime.strptime(habit['dateCreated'], "%Y-%m-%d")

									%if days_between >= active:
										%habit_id = habit['name'].replace(' ', '-').replace('\'', '') + "-" + str((days_between - active).days)

										%if habit['completedIntervals'][str((days_between - active).days)]:
											<p id="{{habit_id}}" class="habit-day bg-success"><i class="fa fa-check-circle-o"></i></p>
										%else:
											<p id="{{habit_id}}" class="habit-day bg-danger"><i class="fa fa-circle-o"></i></p>
										%end
									%else:
										<p disabled="disabled" class="bg-info active">&nbsp;</p>
									%end
								</div>
							%end

						%if len(myhabits) % 2 == 0:
							<div class="habit-column col-md-1 text-center">
								<p>{{(today - datetime.timedelta(days=x)).strftime('%a')}}</p>
							</div>
						%end

					</div>
				%end

		</div>


%include ('tail.tpl')