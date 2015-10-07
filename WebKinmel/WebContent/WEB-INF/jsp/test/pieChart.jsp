
    <script type="text/javascript" src="/WebKinmel/resources/js/loader.js"></script>
    <script type="text/javascript">
     /*  google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart); */
      google.charts.load('41', {packages: ['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Work',     11],
          ['Eat',      2],
          ['Commute',  2],
          ['Watch TV', 2],
          ['Sleep',    7]
        ]);

        var options = {
          title: 'My Daily Activities'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechartt'));

        chart.draw(data, options);
      }
    </script>
    <div id="piechartt" style="width: 900px; height: 500px;"></div>
