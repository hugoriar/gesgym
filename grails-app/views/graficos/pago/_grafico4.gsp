<div id="${prefijoDiv+"_"+concepto}"></div>

<script type="text/javascript">

    $(function () {

        $(${prefijoDiv+"_"+concepto}).highcharts({
            chart: {
                %{--plotBackgroundColor: '${cont>0?'#EEFFAA':(cont<0?'#FF3366':'')}',--}%
//                plotBackgroundColor: null,
//                plotBorderWidth: 1,
//                plotShadow: true
                    /*width: 567,
                    height: 400*/
            },
            title: {
                text: '${seriesName}',
                align: 'center',
                verticalAlign: 'middle',
                y: 50
            },
            tooltip: {
                useHTML: true,
                formatter: function() {
                    var s = '<small>'+this.key+'</small>' +
                            '<table>'+
                            '<tr><td style="color: {series.color}">'+this.series.name+': </td><td style="text-align: right"><b>'+Math.round(this.y * 100)+'%</b></td></tr>' +
                            '<tr><td style="color: {series.color}">Total: </td><td style="text-align: right"><b>$'+Highcharts.numberFormat(this.y*${cont}, 0)+'</b></td></tr>' +
                            '</table>';
                    return s;
                }
            },
            /* useHTML: true,
               headerFormat: '<small>{point.key}</small><table>',
               pointFormat: '<tr>' +
                 '<td style="color: {series.color}">{series.name}: </td><td style="text-align: right"><b>{point.percentage:.1f}%</b></td>' +
                 '</tr>',
                 footerFormat: '</table>',
                 valueDecimals: 2*/
            /*legend: {
                layout: 'vertical',
                align: 'center',
                verticalAlign: 'bottom',*/
//                backgroundColor: '#f3f3f3',
               /* borderWidth: 0,
                useHTML: true,
                itemMarginBottom: 10,
                labelFormatter: function () {
                    return '<div style="width:200px">' +
                                '<span style="float:left">' + this.name + '</span>' +
                                '<span style="float:right">' + this.percentage.toFixed(0) + '%</span>' +
                                '<span style="float:right; margin-right:15%">$' + Highcharts.numberFormat(this.y*${cont}, 0) + '</span>' +
                            '</div>';*/
//                    return '<table class="table table-hover table-condensed" style="border: none;">' +
                                /*'<thead>' +
                                    '<tr class="odd" style="font-weight: bold;">' +
                                    '<td style="text-align: center;"></td>' +
                                    '<td style="text-align: center;">Cantidad</td>' +
                                    '<td style="text-align: center;">%</td>' +
                                    '<td style="text-align: center;" colspan="2">Monto</td>' +
                                    '</tr>' +
                                '</thead>' +*/
                                /*'<tbody style="text-align: right;">' +
                                        '<tr class="even" >' +
                                            '<td style="font-weight: bold; text-align: right;">' + this.name + '</td>' +
                                            '<td style="text-align: center;"></td>' +
                                            '<td style="text-align: center;">' + this.percentage.toFixed(0) + '%</td>' +
                                            '<td>$</td>' +
                                            '<td style="font-weight: bold; text-align: right; border-left: none;">' + Highcharts.numberFormat(this.y*${cont}, 0) + '</td>' +
                                        '</tr>' +
                                '</tbody>' +
                            '</table>';*/
//                }

//            },
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
                    showInLegend: true,
                    startAngle: -90,
                    endAngle: 90,
                    center: ['50%', '75%'],
                    events: {
                        legendItemClick: function () {
                            alert('I am an alert');
                            //return false; // <== returning false will cancel the default action
                        }
                    }

                }
            },
            exporting: {
                enabled: false
            },
            series: [{
                type: 'pie',
                name: '${seriesName}',
                id: '${seriesName}',
                %{--id: '${prefijoDiv+"_"+concepto}',--}%
                innerSize: '50%',
                data: [
                    <% pagoMapList.groupBy{ it."$concepto" }.each { it, resultados -> %>
                        <% if(!booleano){ %>
                            [ '${it.toString().toLowerCase().capitalize()?:"Sin informar"}',  ${resultados.monto?.sum() ? (resultados.monto?.sum() / pagoMapList.monto.sum()) : 0} ],
                        <% } else { %>
                            [ '${it==true?"Socio Nuevo":(it==false?"Renovación":"Sin informar")}',  ${resultados.monto?.sum() ? (resultados.monto?.sum() / pagoMapList.monto.sum()) : 0} ],
                        <% } %>
                    <% } %>

                    %{--<% def userToString = { it.toString() } %>
                <% def pagoBymedioDePago = pagoMapList.groupBy{ it.medioDePago } %>
                <% pagoBymedioDePago.each { autorizadoPorNombre, resultados -> %>
                [ '${autorizadoPorNombre}',  ${(pagoBymedioDePago[autorizadoPorNombre] .collect(userToString).size())?( pagoBymedioDePago[autorizadoPorNombre] .collect(userToString).size() / pagoMapList.size()):0} ],
                <% } %>--}%
                ]
            }]
        });

        /*$('.highcharts-legend text').each(function(index, element) {
            $(element).hover(function() {
                console.log('Legend mouseOver');
                chart.tooltip.refresh(chart.series[0].data[index]);
            },function() {
                console.log('2');
                chart.tooltip.hide();
            })
        });*/

    });


</script>