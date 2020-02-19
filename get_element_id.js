$(document).ready(function(){
	var item_id;	
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
		},500);
	});


	$('body').on('mouseleave','.sl',function(){
		$('#this_obl').remove();
	});

	$('body').on('click','.sl',function(){
		$('.this_obl').remove();
		item_id = this.id;
		$.ajax({
			url: 'php/show_obl_picture.php',
			type: 'POST',
			dataType: 'html',
			data: ({i_id: item_id}),
			success: func2_success
		});
	});
	
	$('body').on('mouseleave','.monument',function() {
		$('#tooltip').remove();
		window.clearInterval(window.timerId);
	});

	$('body').on('mouseenter','.sl',function(){	 //ПРИ НАВЕДЕНИИ НА ПУНКТ С СОБЫТИЕМ	
		$('.this_obl').remove();
		item_id = this.id;
		$.ajax({
			url: "php/ssd.php",
			type: "POST",
			data: ({i_id: item_id}),
			dataType: "text",
			success: func_success
		});
	});

	$('body').on('click','.icon, .read_', function(){
		$(location).attr('href','event_page.php/?type=event&id='+this.id);	
	});

	$('body').on('click','.monument', function(){
		$(location).attr('href','monument_page.php/?type=monument&id='+this.id);	
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
};
function func_success(data)
{
	$('.icon').remove();
	$('#this_obl').remove();
	var array_data = data.split(' ');
	$('#map-container').append('<img src='+array_data[0]+' class="this_obl" id='+array_data[3]+' style="position:absolute; top:'+array_data[1]+'px; left:'+array_data[2]+'px">');
};

function func_2(data)
{
	$('#tooltip').remove();
	$('body').append(data);
};
function func2_success(data)
{
	$('.icon').remove();
	$('#this_obl').remove();
	$('#map-container').append(data);
};