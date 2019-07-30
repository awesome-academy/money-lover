$(document).on('turbolinks:load', function() {
  var cleave = new Cleave('.f_number1', {
      numeral: true,
      numeralThousandsGroupStyle: 'thousand'
  });
});
