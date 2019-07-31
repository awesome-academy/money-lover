function drawChartMonth(year, hash) {
  console.log(hash);
  var chart = new CanvasJS.Chart('adStatMonthChart', {
    animationEnabled: true,
    theme: "light2",
    title: {
      text: I18n.t('admin.title.year_stats_2') + year
    },
    axisX: {
      title: I18n.t('admin.stats_by_year._x'),
      titleFontSize: 24
    },
    axisY: {
      title: I18n.t('admin.stats_by_year._y'),
      titleFontSize: 24
    },
    data: [{
      type: "column",
      dataPoints: hash
    }]
  });

  chart.render();
}
