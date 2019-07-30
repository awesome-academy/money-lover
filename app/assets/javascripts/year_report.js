function amount(item){
  return item.amout;
}

function sum(prev, next){
  return prev + next;
}

function getThisMonth() {
  var d = new Date();
  var n = d.getMonth();
  return n;
}

function calcute_total(arr) {
  if (typeof arr !== 'undefined' && arr.length > 0) {
    return arr.map(amount).reduce(sum);
  } else {
    return 0;
  }
}

function createChart(income, expense) {
  incomeTotal = calcute_total(income);
  expenseTotal = calcute_total(expense);

  var thisMonth = getThisMonth();
  //Bar Chart
  var barChart = new CanvasJS.Chart("barChartContainer", {
    animationEnabled: true,
    exportEnabled: true,
    theme: "light1", // "light1", "light2", "dark1", "dark2"
    title:{
      text: I18n.t("year_report.title.column_title") + thisMonth + I18n.t("year_report.other.month")
    },
    data: [{
      type: "column", //change type to bar, line, area, pie, etc
      //indexLabel: "{y}", //Shows y value on all Data Points
      indexLabelFontColor: 16,
      indexLabelPlacement: "outside",
      dataPoints: [
        { y: incomeTotal, label: I18n.t("month_report.name_chart.income") },
        { y: expenseTotal, label: I18n.t("month_report.name_chart.expense") }
      ]
    }]
  });
  barChart.render();

  // //Pie Chart
  var total = incomeTotal + expenseTotal
  var percentIncome = (incomeTotal/total*100).toFixed(2);
  var percentExpense = 100 - percentIncome
  var chart = new CanvasJS.Chart("chartContainer", {
    theme: "light2", // "light1", "light2", "dark1", "dark2"
    exportEnabled: true,
    animationEnabled: true,
    title: {
      text: I18n.t("year_report.title.column_title") + thisMonth + I18n.t("year_report.other.month")
    },
    data: [{
      type: "pie",
      startAngle: 25,
      toolTipContent: "<b>{label}</b>: {y}%",
      showInLegend: "true",
      legendText: "{label}",
      indexLabelFontSize: 16,
      indexLabel: "{label} - {y}%",
      dataPoints: [
        { y: percentIncome, label: I18n.t("month_report.name_chart.income") },
        { y: percentExpense, label: I18n.t("month_report.name_chart.expense") },
      ]
    }]
  });
  chart.render();
}

$( document ).on('turbolinks:load', function() {
  var date = new Date();
  var month = date.getMonth();

  $(function () {
    $('[data-toggle="tooltip"]').tooltip()
  })

  // Initialize popover component
  $(function () {
    $('[data-toggle="popover"]').popover()
  })

  $(function () {
    $('#datetimepicker3').datetimepicker({
        format: 'LL'
    });
  });

  createChart(income, expense);
})
