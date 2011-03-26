$(document).ready(function() {
	$('#toggle_short').click(function() {
	  $("#long").slideDown(2500);
	  $("#short").slideUp(800);
	  $('#toggle_long').slideDown(2300);
	});
	$('#toggle_long').click(function() {
	  $("#long").slideUp(1700);
	  $("#short").slideDown(1200);
	  $('#toggle_long').slideUp(800);
	});
	$("#twitter").fadeIn(1200);
	$.getJSON('http://search.twitter.com/search.json?callback=?&q=taucw&rpp=10', function(json) {
		$.each(json.results, function(i,tweet){
			var post = tweet.text;
			var user = tweet.from_user;
			var user_link = "http://twitter.com/#!/" + user;
			var post_link = user_link + "/statuts/" + tweet.id_str;
			var item = "<p><a href='"+ user_link +"'>@"+user+"</a> : "+post+"</p>";
		  $("#twitter").append(item);
		});
	});
	
});