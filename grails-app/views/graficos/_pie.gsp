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
                plotBackgroundColor: null,
                plotBorderWidth: 0,
                plotShadow: false
            },
            title: {
                text: 'Visitas por<br>género',
                align: 'center',
                verticalAlign: 'middle',
                y: 50
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    dataLabels: {
                        enabled: true,
                        distance: -50,
                        style: {
                            fontWeight: 'bold',
                            color: 'white',
                            textShadow: '0px 1px 2px black'
                        }
                    },
                    startAngle: -90,
                    endAngle: 90,
                    center: ['50%', '75%']
                }
            },
            series: [{
                type: 'pie',
                name: 'Porcentaje',
                innerSize: '50%',
                data: [
                    ['Hombre',  ${listVisitasHombres.size()/listVisitasDiarias.size()}],
                    ['Mujeres', ${listVisitasMujeres.size()/listVisitasDiarias.size()}],
                    /*{
                        name: 'Others',
                        y: 0.7,
                        dataLabels: {
                            enabled: false
                        }
                    }*/
                ]
            }]
        });
    });
</script>
<body>
<div id="${nombreDiv}" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
</body>
</html>