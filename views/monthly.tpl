%include ('head.tpl', title=title, css='hbt')

	%include ('navbar.tpl', logged_in=True)

		<div class="container">

			%include('habit_header.tpl', title=title, interval=interval)

			<br>

			%today = datetime.datetime.now()

			<div class="visible-xs visible-sm">
				%for habit in myhabits:

					%active = datetime.datetime.strptime(habit['dateCreated'], "%Y-%m-%d")

					%if habit['completedIntervals'][str((today.year - active.year) * 12 + today.month - active.month)]:
						<div class="habit-row bg-success">
							<i class="fa fa-check-circle-o fa-3x habit-check" style="position:absolute; top:5px; right:20px;"></i>
							<h3 class="text-left habit-row-name">{{habit['name']}}</h3>
							<p class="text-left"> months in a row</p>
						</div>
					%else:
						<div class="habit-row bg-danger">
							<i class="fa fa-circle-o fa-3x habit-check" style="position:absolute; top:5px; right:20px;"></i>
							<h3 class="text-left habit-row-name">{{habit['name']}}</h3>
							<p class="text-left"> months since</p>
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

				%current_month = today.date()

				%for x in range((today.year - earliest_date.year) * 12 + today.month - earliest_date.month + 1):

					<div class="row">

							%if len(myhabits) % 2 == 0:
								<div class="habit-column col-md-1 text-center col-md-offset-{{((12-len(myhabits))/2)-1}}">
									<p>{{current_month.strftime('%Y-%m')}}</p>
								</div>
							%else:
								<div class="habit-column col-md-1 text-center col-md-offset-{{((12-len(myhabits))/2)}}">
									<p>{{current_month.strftime('%Y-%m')}}</p>
								</div>
							%end

							%for (i, habit) in enumerate(myhabits):
								<div class="habit-column col-md-1 text-center">
									%months_between = today.date()

									%for i in range (0, x):
										%months_between = months_between - datetime.timedelta(days=months_between.day)
										%months_between = months_between - datetime.timedelta(days=1)
										%months_between = months_between - datetime.timedelta(days=months_between.day-1)
									%end

									%active = datetime.datetime.strptime(habit['dateCreated'], "%Y-%m-%d")
									%active = active - datetime.timedelta(days=active.day-1)

									%if months_between >= active.date():
										%habit_id = habit['name'].replace(' ', '-').replace('\'', '') + "-" + str((months_between.year - active.year) * 12 + months_between.month - active.month)
										%if habit['completedIntervals'][str((months_between.year - active.year) * 12 + months_between.month - active.month)]:
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
								<p>{{current_month.strftime('%b')}}</p>
							</div>
						%end

						%current_month = current_month - datetime.timedelta(days=current_month.day)
						%current_month = current_month - datetime.timedelta(days=1)
						%current_month = current_month - datetime.timedelta(days=current_month.day-1)

					</div>
				%end

		</div>


%include ('tail.tpl')