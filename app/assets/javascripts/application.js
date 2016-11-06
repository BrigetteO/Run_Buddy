// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require chosen-jquery
//= require jquery-ui
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function() {

  // $('body').on('click', 'ul.tabs li', function(){
  // 	console.log("What the fuck");
  //   var tab_id = $(this).attr('data-tab');

  //   $('ul.tabs li').removeClass('current');
  //   $('.tab-content').removeClass('current');

  //   $(this).addClass('current');
  //   $("#"+tab_id).addClass('current');
  // });

  $('.container').on('click', '.fa-thumbs-up', function(event){
  	event.preventDefault();
    var form = $(this).closest('form');
    var url = form.attr('action');
    $.ajax({
      method: 'POST',
      url: url,
      dataType: 'JSON',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      success: function(response){
        form.closest('.run-index').find('.kudos').html(response.kudos)
      }
    });
  });

  $('.container').on('click', '.fa-comments', function(event){
  	event.preventDefault();
  	var new_comment = $(this)
    var url = $(this).closest('a').attr('href');
    console.log(url)
    $.ajax({
      method: 'GET',
      url: url,
      dataType: 'HTML',
      success: function(response){
        new_comment.closest('.run-index').append(response)
      }
    });
  });

});
