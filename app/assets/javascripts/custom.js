$(document).on('turbolinks:load', function() {
  $('.caret-custom').on('click', function () {
    var that = $(this);
    that.parent().siblings().slideToggle(300);
    that.toggleClass('glyphicon-minus-sign');
  });
});
