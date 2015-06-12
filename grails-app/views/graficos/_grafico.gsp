%{--<%@ page import="org.joda.time.Period; org.joda.time.format.PeriodFormatter; org.joda.time.format.PeriodFormatterBuilder; org.joda.time.ReadableInterval; org.joda.time.Interval; groovy.time.TimeCategory; org.joda.time.LocalDate; org.joda.time.DateTime; agrosmart_web.HomeService" %>--}%
%{--<div class="col-md-10 col-sm-10 mb">
    <!-- REVENUE PANEL -->
    <div class="white-panel pn">

        <div  class="chart mt">--}%

            <div id="grafico" class="loader">
            %{--<div id="grafico" style="height: 400px; width: 100%" class="loader">--}%
                <span></span>
                <span></span>
                <span></span>
                %{--<img src="${resource(dir: 'images/login', file: 'back.jpg')}" height="400px">--}%
            </div>

            %{--<div class="col-md-3">
                <h4>Parámetros Sensor </h4>
            </div>
            <div class="col-md-3">
                <ul class="list-group ">

                    <li class="list-group-item">
                        <span class="badge">${sensorHasComponente?.valorMinimo}${abreviacionMedida}</span>
                        Mínima
                    </li>
                </ul>
            </div>
            <div class="col-md-3">
                <ul class="list-group ">

                    <li class="list-group-item ">
                        <span class="badge">${sensorHasComponente?.valorMaximo}${abreviacionMedida}</span>
                        Máxima
                    </li>
                </ul>
            </div>
            <div class="col-md-3">
                <ul class="list-group ">

                    <li class="list-group-item ">
                        <span class="badge">${sensorHasComponente?.valorDeseado}${abreviacionMedida}</span>
                        Deseado
                    </li>
                </ul>
            </div>--}%
        %{--</div>
    </div>
</div>--}%

%{--<div class="col-md-2 col-sm-6 mb">
    <div style="margin-bottom:5px;" class="panel panel-default text-center" id="divValorMedicionYFecha">
        <div class="panel-body" style="background: ${sensorHasComponente?.estado?.color} !important;">
            <% if (ultimaMedicion) { %>
            <h1>${(ultimaMedicion?.valor)?(ultimaMedicion?.valor+""+(abreviacionMedida?:"")):"Sin datos"}</h1>
            <%
                    LocalDate today = new DateTime().toLocalDate()
                    String fecha = /*"Hoy a las "+*/ fechaUltimaMedicion?.format("HH:mm:ss")
                    if (!fechaUltimaMedicion.equals(today)){
                        fecha = fechaUltimaMedicion?.format("EEEE dd/MM/yy")+" a las " + fechaUltimaMedicion?.format("HH:mm:ss")
                    }
            %>
            <tooltip:tip value="${fecha}">
                <div id="fechaUltimaMedicion">
                    <prettytime:display date="${fechaUltimaMedicion}" capitalize="true"/>
                </div>
            </tooltip:tip>
            <% } %>
        </div>
        <div class="panel-footer">${nombreTipoSensor} actual</div>
    </div>
    <div class="panel panel-default text-center" id="divValorMedicionMaximo">
        <div class="panel-body">
            <h4><strong> ${max?(max+""+(abreviacionMedida?:"")):"Sin datos"} </strong>Máxima</h4>
        </div>
    </div>
    <div class="panel panel-default text-center" id="divValorMedicionMinimo">
        <div class="panel-body">
            <h4><strong> ${min?(min+""+(abreviacionMedida?:"")):"Sin datos"} </strong>Mínima</h4>
        </div>
    </div>
    <div class="panel panel-default text-center" id="divValorMedicionPromedio">
        <div class="panel-body">
            <h4><strong> ${promedio?.intValue()?(promedio?.intValue()+""+(abreviacionMedida?:"")):"Sin datos"} </strong>Promedio</h4>
        </div>
    </div>
</div>--}%

<script type="text/javascript">

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
            thousandsSep: "",
            decimalPoint: ','
        }
    });




    $(function () {

        // Create the chart
        $('#grafico').highcharts('StockChart', {
            rangeSelector : {
                selected : 1
            },

            /*title : {
                text : 'Recaudación'
            },*/
            xAxis: {
                type: 'datetime',
                dateTimeLabelFormats: { // don't display the dummy year
                    /*minute: '%d-%m-%Y<br/>%H:%M',
                    hour: '%d-%m-%Y<br/>%H:%M',*/
                    day: '%d-%m<br/>%Y'/*,
                    week: '%Y<br/>%m-%d',
                    month: '%Y-%m',
                    year: '%Y'*/
                }/*,
                title: {
                    text: 'Fecha'
                }*/
            },
            yAxis: {
                title: {
                    text: 'Recaudación ($)'
                },
                min: 0
            },
            series : [{
                name : 'Monto',
                data: [
                    <% pagoInstanceList.flatten().sort{it.fechaDeCobro}.each { %>
                        <% if (it.fechaDeCobro) { %>
                        <%  def fecha = new Date(it.fechaDeCobro) %>
                            [ Date.UTC(${fecha?.year+1900}, ${fecha?.month}, ${fecha?.date}, ${fecha?.hours}, ${fecha?.minutes}), ${it?.monto} ],
                        <% } %>
                    <% } %>
                ],
                tooltip: {
//                    valueDecimals: 0
                    pointFormat: "Monto: $"+"{point.y:,.0f}"
                }
            }]
        });

    });

</script>