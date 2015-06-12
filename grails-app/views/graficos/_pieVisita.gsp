<div id="${prefijoDiv}"></div>
%{--<div id="${prefijoDiv+"_"+concepto}" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>--}%

<script>
    $(function () {
        var getColor = {
            'Masculino'         : 'lightblue',
            'Femenino'          : 'pink',
            /*----------------------------------*/
            'Erika'             : '#71AADE',
            'Andrea'            : '#454548',
            /*----------------------------------*/
            'Efectivo'          : '#71AADE',
            'Tarjeta de crédito': '#454548',
            'Cheque(s)'         : '#80DA6D',
            'Otro'              : '#lighblue',
            'Tarjeta de débito' : '#pink'
        };
        $(${prefijoDiv}).highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: 0,
                plotShadow: false,
                width: 369/*,
                height: 300*/
            },
            title: {
                text: '${seriesName}',
//                text: 'Visitas por<br>género',
                align: 'center',
                verticalAlign: 'middle',
                y: 50
            },
            /*tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },*/
            tooltip: {
                useHTML: true,
                formatter: function() {
                    var conta = ${cont?:0};
                    var s = '<small>'+this.key+'</small>' +
                            '<table>'+
                            '<tr><td style="color: {series.color}">'+this.series.name+': </td><td style="text-align: right"><b>'+Math.round(this.y * 100)+'%</b></td></tr>' +
                            '<tr><td style="color: {series.color}">Total: </td><td style="text-align: right"><b>$'+Highcharts.numberFormat(this.y*conta, 0)+'</b></td></tr>' +
                            '</table>';
                    return s;
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
                name: 'Porcentaje',
                innerSize: '50%',
                data: [
                    <% pagoMapList.each { %>
                        {
                            name : '${it.titulo}',
                            <% if(!cantidad){ %>
                                y    : ${it.monto?it.monto/cont:0},
                            <% } else { %>
                                %{--${System.out.println(it.titulo+" - "+it.cantidad/cont)}--}%
                                y    : ${it.cantidad?(it.cantidad/cont):0},
                            <% } %>
                            color: getColor['${it.titulo}']
                        },
                    <% } %>
                ]
            }]
        });
    });
</script>