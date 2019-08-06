$(document).on('turbolinks:load', function() {
  var cleave = new Cleave('.f_number1', {
    numeral: true,
    numeralThousandsGroupStyle: 'thousand'
  });

  var cl3 = new Cleave('#search2', {
    numeral: true,
    numeralThousandsGroupStyle: 'thousand'
  });
  var cleave = new Cleave('.f_number2', {
      numeral: true,
      numeralThousandsGroupStyle: 'thousand'
  });
});
