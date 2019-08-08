$( document ).on('turbolinks:load', function() {
  $(function () {
    $('[data-toggle="tooltip"]').tooltip()
  });

  // Initialize popover component
  $(function () {
    $('[data-toggle="popover"]').popover()
  });

  $(function () {
    $('#datetimepicker1').datetimepicker({
      format: 'LL'
    });
    $('#datetimepicker2').datetimepicker({
      format: 'LL'
    });
    $('#datetimepicker3').datetimepicker({
      format: 'LL'
    });

  });

  //Bar Chart
  var barChart = new CanvasJS.Chart('barChartContainer_month', {
    animationEnabled: true,
    exportEnabled: true,
    theme: 'light1', // 'light1', 'light2', 'dark1', 'dark2'
    title:{
      text: I18n.t('month_report.title.columnChart')
    },
    data: [{
      type: 'column', //change type to bar, line, area, pie, etc
      //indexLabel: '{y}', //Shows y value on all Data Points
      indexLabelFontColor: 16,
      indexLabelPlacement: 'outside',
      dataPoints: [
        { y: gon.hash_gon.income_amout, label: I18n.t('month_report.name_chart.income') },
        { y: gon.hash_gon.expense_amout, label: I18n.t('month_report.name_chart.expense') }
      ]
    }]
  });
  barChart.render();

  //Pie Chart
  var total = gon.hash_gon.income_amout + gon.hash_gon.expense_amout
  var percentIncome = gon.hash_gon.income_amout/total*100
  var percentExpense = 100 - percentIncome
  var percentIncomeString = percentIncome.toFixed(2)
  var percentExpenseString = percentExpense.toFixed(2)
  var chart = new CanvasJS.Chart('chartContainer_month', {
    theme: 'light2', // 'light1', 'light2', 'dark1', 'dark2'
    exportEnabled: true,
    animationEnabled: true,
    title: {
      text: I18n.t('month_report.title.pieChart')
    },
    data: [{
      type: 'pie',
      startAngle: 25,
      toolTipContent: '<b>{label}</b>: {y}%',
      showInLegend: 'true',
      legendText: '{label}',
      indexLabelFontSize: 16,
      indexLabel: '{label} - {y}%',
      dataPoints: [
        { y: percentIncomeString, label: I18n.t('month_report.name_chart.income') },
        { y: percentExpenseString, label: I18n.t('month_report.name_chart.expense') },
      ]
    }]
  });
  chart.render();


  $("#select-old-report").change(function(){
    var selectedMonth = $(this).children("option:selected").val();

    $.ajax({
      type: 'get',
      url: '/month_report',
      data: {
        mydata: selectedMonth,
        this_month_page: $('#old_month_report-btn').attr('data-this-month'),
        from_date: $('#old_month_report-btn').attr('data-from-date')
      }
      }).fail(function() {
        alert( I18n.t('month_report.other.not_found'));
      });
  });

  $('#search_time_picker').click(function(){
    var from_date = $('#datetimepicker1').data('date');
    var to_date = $('#datetimepicker2').data('date');

    if(from_date != '' && to_date != '')
    {
      $.ajax({
        url:"/month_report",
        method:"GET",
        data: {
          from_date: from_date,
          to_date: to_date
        }
      }).fail(function() {
        alert(I18n.t('month_report.other.not_found'));
      });
    }
    else
    {
      alert(I18n.t('month_report.other.select_date'));
    }
  });
});
