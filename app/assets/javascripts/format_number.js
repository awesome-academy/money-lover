function format_number(str_id){
  if($(str_id).length > 0) {
    var cleave = new Cleave(str_id, {
      numeral: true,
      numeralThousandsGroupStyle: 'thousand'
    });
  }
}

$(document).on('turbolinks:load', function() {
  format_number('.f_number1');
  format_number('#search2');
  format_number('.f_number2')
});
