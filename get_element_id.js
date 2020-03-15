$(document).ready(function(){
	$('body').on('mouseover','.monument',function(){
		$('#tooltip').remove();
		var x = ($(this).position()).top+40;
		var y = ($(this).position()).left+40;
		var z = this.id;
		window.timerId = window.setInterval(function(){
			$.ajax({
				url: 'php/monument_info.php',
				type: 'POST',
				dataType: 'text',
				data: {m_id: z, top:x, left:y},
				success: success_get_info
			});
			window.clearInterval(window.timerId);
		},1000);
	});
	$('body').on('mouseleave','.monument',function() {
		$('#tooltip').remove();
		window.clearInterval(window.timerId);
	});

	$('body').on('mouseenter','.sl',function(){		
		var item_id = this.id;
		$.ajax({
			url: "php/ssd.php",
			type: "POST",
			data: ({i_id: item_id}),
			dataType: "text",
			success: func_success
		});
	});

	$('body').on('click','.sl',function(){		
		var item_id = this.id;
		$.ajax({
			url: "php/show_region.php",
			type: "POST",
			data: ({i_id: item_id}),
			dataType: "text",
			success: func_success2
		});
	});

	$('body').on('click','.icon', function(){
		$(location).attr('href','event_page/event_page.php/?type=icon_anim&id='+this.id);	
	});

	$('body').on('click','.monument', function(){
		$(location).attr('href','monument_page/monument_page.php/?type=monument&id='+this.id);	
	});


	$('#search').bind('click',function() {
		$('.monument').remove();
		$('.icon').remove();
		var text = $('#search_text').val();
		$.ajax({
			url: 'php/search.php',
			type: 'POST',
			dataType: 'text',
			data: {text: text},
			success: success_search
		});
	});
});









    
function success_get_info(data)
{
	$('#map-container').append(data);
};
function success_search(data)
{
	$('#map-container').append(data);
	$('.icon').addClass('b');
};
function func_success2(data)
{
	$('body').append(data);
};
function func_success(data)
{
	$('.icon').remove();
	$('#map-container').append(data);
	$('.icon').addClass('b');
};
function func_2(data)
{
	$('#tooltip').remove();
	$('#map-container').append(data);
};