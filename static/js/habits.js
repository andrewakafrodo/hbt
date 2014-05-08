$(function() {

	$('.habit-day').on('click', function() {
		$(this).toggleClass("bg-danger bg-success");
        $(this).html("<i class=\"fa fa-spinner fa-spin\"></i>");

        // Make the create buttons be unactive.
        $(this).attr('disabled', 'disabled');
        var habitClicked = $(this).attr('id');

        var habit = {}
        habit['_id'] = $(this).attr('id').match(/[a-zA-Z]+([-][a-zA-Z]+)+/)[0].replace(/-/g, ' ');
        habit['completedIntervals.' + $(this).attr('id').match(/\d+/)[0]] = $(this).hasClass("bg-success");

        $.ajax({
            type: 'PUT',
            url: 'http://localhost:8080/habits/put/' + $(this).attr('id').match(/[a-zA-Z]+([-][a-zA-Z]+)+/)[0].replace(/-/g, '%20'),
            data: JSON.stringify(habit),
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                $('#' + habitClicked).attr('disabled', '');
                $('#' + habitClicked).html($('#' + habitClicked).hasClass("bg-success") ? "<i class=\"fa fa-check-circle-o\"></i>"
                                                            : "<i class=\"fa fa-circle-o\"></i>");
            }
        });

	});

    // Check a habit off or on smaller devices.
	$('.habit-row').on('click', function() {
		$(this).find(".habit-check").toggleClass("fa-circle-o fa-check-circle-o");
        $(this).toggleClass("bg-danger bg-success");

        // $.ajax({
        //     type: 'PUT',
        //     url: 'http://localhost:8080/habits/put/' + $(this).attr('id').match(/[a-zA-Z]+([-][a-zA-Z]+)+/)[0].replace(/-/g, '%20'),
        //     data: JSON.stringify(habit),
        //     dataType: 'json',
        //     success: function (data, textStatus, jqXHR) {
        //         $('#' + habitClicked).attr('disabled', '');
        //         $('#' + habitClicked).html($('#' + habitClicked).hasClass("bg-success") ? "<i class=\"fa fa-check-circle-o\"></i>"
        //                                                     : "<i class=\"fa fa-circle-o\"></i>");
        //     }
        // });
	});

    // Delete a habit.
    $('.habit-row').on('click', function() {
        $(this).find(".habit-check").toggleClass("fa-circle-o fa-check-circle-o");
        $(this).toggleClass("bg-danger bg-success");

        // $.ajax({
        //     type: 'PUT',
        //     url: 'http://localhost:8080/habits/put/' + $(this).attr('id').match(/[a-zA-Z]+([-][a-zA-Z]+)+/)[0].replace(/-/g, '%20'),
        //     data: JSON.stringify(habit),
        //     dataType: 'json',
        //     success: function (data, textStatus, jqXHR) {
        //         $('#' + habitClicked).attr('disabled', '');
        //         $('#' + habitClicked).html($('#' + habitClicked).hasClass("bg-success") ? "<i class=\"fa fa-check-circle-o\"></i>"
        //                                                     : "<i class=\"fa fa-circle-o\"></i>");
        //     }
        // });
    });


	$(function () { $("[data-toggle='tooltip']").tooltip(); });
	$(function () { $("[data-toggle='popover']").tooltip(); });

	// Animate the welcome screen.
	$('a').click(function(){
		$('html, body').animate({
			scrollTop: $( $.attr(this, 'href') ).offset().top
		}, 500);
		return false;
	});

});