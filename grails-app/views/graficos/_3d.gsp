<%@ page contentType="text/html;charset=UTF-8" %>
<html>
%{--<head>--}%
    %{--<style>--}%
        %{--#${nombreDiv} {--}%
        %{--height: 400px;--}%
        %{--min-width: 310px;--}%
        %{--max-width: 800px;--}%
        %{--margin: 0 auto;--}%
        %{--}--}%
    %{--</style>--}%
%{--</head>--}%

<script type="text/javascript">
    $(function () {
        $(${nombreDiv}).highcharts({
            chart: {
                type: 'column',
                margin: 75,
                options3d: {
                    enabled: true,
                    alpha: 10,
                    beta: 25,
                    depth: 70
                }
            },
            title: {
                text: 'Visitas mensuales'
            },
            subtitle: {
                text: ''
            },
            tooltip: {
                headerFormat: '<b>{point.key}</b><br>',
                pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
            },
            plotOptions: {
                column: {
                    stacking: '${stacking?:"normal"}',
                    depth: 25
                }
            },
            xAxis: {
                categories: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic']
            },
            yAxis: {
                opposite: true,
                allowDecimals: false,
                min: 0,
                title: {
                    text: 'Cantidad de visitas'
                }
            },
            series: [
                {
                    name: 'Hombres',
                    data: [
                        <% listVisitasHombres.each { %>
                            [${it}],
                        <% } %>
                    ],
                    stack: 'si'
                }, {
                    name: 'Mujeres',
                    data: [
                        <% listVisitasMujeres.each { %>
                            [${it}],
                        <% } %>
                    ],
                    stack: '${stack?:"si"}',
                    color: 'pink'
                }]
        });
    });
</script>
<body>
<div id="${nombreDiv}" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
</body>
</html>