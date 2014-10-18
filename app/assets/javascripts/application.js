// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require facebook

$(function(){

  $(document).foundation();

  $('.list-item').on('click', '.list-item-header', function(event) {
    var $listItem = $(event.delegateTarget);
    var $markdown = $listItem.find('.markdown-content');

    $('.list-item-preview-open').each(function() {
      $(this).removeClass('list-item-preview-open');
    });
    if($markdown.hasClass('just-visited')){
      $markdown.removeClass('just-visited');
    }
    else{
      $markdown.addClass('list-item-preview-open');
      $('.list-item-preview-open').each(function() {
        $(this).removeClass('just-visited');
      });
      $markdown.addClass('just-visited');
    }
  });
});
