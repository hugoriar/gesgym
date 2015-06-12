<div id="${seriesName}"></div>

<script type="text/javascript">

    $(function () {

        $(${seriesName}).highcharts({
            chart: {
                plotBackgroundColor: '${cont>0?'#EEFFAA':(cont<0?'#FF3366':'')}',
                plotBorderWidth: 1,
                plotShadow: true
            },
            title: {
                text: '${seriesName}',
                align: 'center',
                verticalAlign: 'middle',
                y: 50
            },
            tooltip: {
                formatter: function() {
                    return this.series.name+': <b>' + '${monto?"\$":""}' + Highcharts.numberFormat(this.y, 0) + '</b>';
                }
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
                    allowPointSelect: true,
                    cursor: 'pointer',
//                    showInLegend: true,
                    startAngle: -90,
                    endAngle: 90,
                    center: ['50%', '75%']
                }
            },
            exporting: {
                enabled: false
            },
            series: [{
                type: 'pie',
                name: '${seriesName}',
                innerSize: '50%',
                data: [
                        [ '${mesPrimero} ${anioPrimero}',  ${cont1} ],
                        [ '${mesSegundo} ${anioSegundo}',  ${cont2} ]
                ]
            }]
        });

    });


</script>