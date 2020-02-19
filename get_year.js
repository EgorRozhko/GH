var year;
$(document).ready(function() {
	$(".years").bind("mouseenter", function(){
	year = this.textContent;
	$.ajax({
		url: 'php/show_items.php',
		type: 'POST',
		dataType: 'html',
		data: {year: year},
		success: success_query
		});
		$('#events').css({
			visibility: 'collapse'
		});			
	});
	$('#events').bind('mouseleave', function(){
		$('#events').empty();
		$('#events').css({
			visibility: 'collapse'
		});
	});
});

function success_query(data)
{
	$('#events').empty();
	$("#events").append(data);
	if ($('#events').children().length != 0) { 
		$('#events').css({ 
			visibility: 'visible' 
		}); 
	}
};