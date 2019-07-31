function toggleDataSeries(e){
  if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
    e.dataSeries.visible = false;
  }
  else{
    e.dataSeries.visible = true;
  }
  chart.render();
}

function generateData(json) {
  var data = [];
  $.each(json, function (key, val) {
    data.push({
      name: key,
      type: 'line',
      showInLegend: true,
      dataPoints: val
    });
  });
  console.log(data);
  return data;
}

function drawChart(hash) {
  var chart = new CanvasJS.Chart('adStatYearChart', {
    animationEnabled: true,
    axisX: {
      title: I18n.t('admin.stats_by_year._x')
    },
    axisY: {
      title: I18n.t('admin.stats_by_year._y'),
      includeZero: false
    },
    legend:{
      cursor: 'pointer',
      fontSize: 16,
      itemclick: toggleDataSeries
    },
    toolTip:{
      shared: true
    },
    data: generateData(hash)
  });

  chart.render();
}

$(document).on('turbolinks:load', function() {
  $(function () {
    $('[data-toggle="tooltip"]').tooltip();
  });

  $(function () {
    $('[data-toggle="popover"]').popover();
  });
});
