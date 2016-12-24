# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = 
$ ->
  $('.card-img').click -> 
  	size = $('.deck-size').val()
  	$('.deck-size').val(+size + +1)
  	input = $('.card-list').val()
  	if input.length != 0
  		$('.card-list').val(input + ', ' + $(this).attr("alt"))
  	else
  		$('.card-list').val($(this).attr("alt"))

$(document).ready(ready)
$(document).on('page:load', ready)