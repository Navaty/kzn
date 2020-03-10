// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require_tree ./boots/


$(document).on('turbolinks:load', function () {
	$(document).on("click",".paginator a", function() {
		$.getScript(this.href);
		return false;
	});
$(document).on("click",".cat-sort a", function() {
		$.getScript(this.href);
		return false;
	});

  $("#places_search input").on("keyup change",function() {
    $.get($("#places_search").attr("action"), $("#places_search").serialize(), null, "script");
    $(".map-cat-btn").attr("href", "/maps/?type=P&"+ $("#places_search").serialize());
    console.log($("#places_search").serialize());
    return false;
  });

});