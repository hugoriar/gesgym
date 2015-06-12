<%@ page contentType="text/html;charset=UTF-8" %>
<html>

<script type="text/javascript">
    $(function () {
        $('#container').highcharts({
            title: {
                text: 'Visitas mensuales',
                x: -20 //center
            },
            subtitle: {
                text: '',
                x: -20
            },
            xAxis: {
                categories: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic']
            },
            yAxis: {
                title: {
                    text: 'Cantidad de Visitas'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                valueSuffix: ''
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle',
                borderWidth: 0
            },
            series: [
                {
                    name: 'Hombres',
                    data: [
                        <% listVisitasAnualesHombres.each { %>
                        [${it}],
                        <% } %>
                    ]
                }, {
                    name: 'Mujeres',
                    data: [
                        <% listVisitasAnualesMujeres.each { %>
                        [${it}],
                        <% } %>
                    ]
                }]
        });
    });
</script>
<body>
<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
</body>
</html>