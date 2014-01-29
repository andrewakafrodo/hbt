use hbt



var habitNames =["fuck", "shit", "wow", "this is weird", "howdy", "wow", "can't", "believe it", "hahaha"

for (var i = 0; i < habitNames.length; i++) {
	db.habits.insert({
		"_id" : habitNames[i],
		"categories" : [
			"asdf"
		],
		"completedIntervals" : {
			"0" : false
		},
		"dateCreated" : "2013-11-23",
		"interval" : "daily",
		"occurence" : "once",
		"reminders" : "asdf",
		"username" : "frodosamoa"
	})
}