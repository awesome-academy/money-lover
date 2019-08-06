$(document).on('turbolinks:load', function() {
  $('#search1').on('keyup', function () {
    $.ajax({
      url: '/admin/users',
      data: {search: $(this).val()}
    });
  });

  $('#search2').on('keyup', function() {
    $.ajax({
      url: '/admin/savings',
      data: {search: $(this).val()}
    });
  })
});
