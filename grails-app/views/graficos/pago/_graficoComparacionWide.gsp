%{--<g:set var="pagoMapSuma" value="${pagoMapSuma?:1}"/>--}%

                <div id="grafico" class="loader">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>


<script type="text/javascript">
    %{--<g:javascript src="hs/highchartsInicio.js" />--}%

    Highcharts.setOptions({
        lang: {
            loading: 'Cargando...',
            months: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octobre', 'Noviembre', 'Diciembre'],
            shortMonths:  ['ene', 'feb', 'mar', 'abr', 'may', 'jun', 'jul', 'ago', 'sep', 'oct', 'nov', 'dic'],
            weekdays: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
            exportButtonTitle: "Exportar",
            printButtonTitle: "Imprimir",
            rangeSelectorFrom: "Zoom del",
            rangeSelectorTo: "al",
            rangeSelectorZoom: "Zoom:",
            downloadPNG: 'Descargar imagen PNG',
            downloadJPEG: 'Descargar imagen JPEG',
            downloadPDF: 'Descargar imagen PDF',
            downloadSVG: 'Descargar imagen SVG',
            resetZoom: "Resetear zoom",
            resetZoomTitle: "Resetear zoom",
            printChart: "Imprimir gráfico",
            thousandsSep: ".",
            decimalPoint: ','
        }
    });


    <% def userToString = { it.toString() }%>

    $(function () {
        $('#grafico').highcharts('StockChart', {
            title: {
                text: 'Monthly Average Temperature',
                x: -20 //center
            },
            subtitle: {
                text: 'Source: WorldClimate.com',
                x: -20
            },
            /*xAxis: {
                categories: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31']
            },*/
            yAxis: {
                title: {
                    text: 'Temperature (°C)'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
                    tooltip: {
                        valueDecimals: 2,
                        valuePrefix: '$',
                        valueSuffix: ' USD'
                    },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle',
                borderWidth: 0
            },
            series : [{
                name : 'Monto',
                data: [
                    <% pagoMapList1.flatten().sort{it.fechaDeCobro}.each { %>
                        <% if (it.fechaDeCobro) { %>
                            <%  def fecha = new Date(it.fechaDeCobro) %>
                            [ Date.UTC(${fecha?.year+1900}, ${fecha?.month}, ${fecha?.date}), ${it?.monto} ],
                        <% } %>
                    <% } %>
                ],
                stickyTracking: false,
                dataGrouping: {
                    approximation: "sum",
                    enabled: true,
                    forced: true,
                    units: [['day',[1]]]
                }

            }]
        });
    });

</script>