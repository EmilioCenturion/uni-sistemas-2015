# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ajax:success", "form#ciudads-form", (ev,data) -> 
	console.log data
	$(this).find("textfield").val("")
	$("#ciudads-box").append("<li>#{ciudads.nombre} - #{}</li>")