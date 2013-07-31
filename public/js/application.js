$(document).ready(function(){
	$('form').submit(function(e){
		if($('#type-field').val().length==0){
			e.preventDefault();
			$('#errors').text('Please enter a Tumblr handle.');
		}
	});
});
