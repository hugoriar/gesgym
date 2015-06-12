<div class="tabbable" style="width: 602px;">
    <ul class="nav nav-pills">
        <li class="active"><a href="#tablaResumen" data-toggle="tab"><span class="glyphicon glyphicon-home">Resumen</span></a></li>
        <li><a href="#grafico_plan" data-toggle="tab">Plan</a></li>
        <li><a href="#grafico_concepto" data-toggle="tab">Concepto</a></li>
        <li><a href="#grafico_esNuevo" data-toggle="tab">Antigüedad</a></li>
        <li><a href="#grafico_medioDePago" data-toggle="tab">Medio de Pago</a></li>
        <li><a href="#grafico_autorizadoPorNombre" data-toggle="tab">Operador</a></li>
        <li><a href="#grafico_sexo" data-toggle="tab">Sexo</a></li>
    </ul>

    <div class="tab-content">
        <div class="tab-pane fade in active" id="tablaResumen">
            <table class="table table-bordered table-hover table-condensed">
                <thead>
                    <tr class="odd" style="font-weight: bold;">
                        <td></td>
                        <td style="text-align: center;"><tooltip:tip value="Cantidad de operaciones">Cantidad</tooltip:tip>
                        </td><td style="text-align: center;"><tooltip:tip value="Porcentaje redondeado (p.e. 0.123% = 0%)">%</tooltip:tip></td>
                        <td style="text-align: center;" colspan="2">Monto</td>
                    </tr>
                </thead>
                <tbody style="text-align: right;">
                    <g:render template="/pago/templates/totalIngresoBuscador" model="[titulo: 'Total ingreso', clase: 'even', cantidad: pagoMapList.size(), porcentaje: 100, monto: pagoMapSuma?:0]"/>
                    <g:render template="/pago/templates/itemGastoBuscador"    model="[titulo: 'Plan',          concepto: 'plan',                pagoMapList: pagoMapList]"/>
                    <g:render template="/pago/templates/itemGastoBuscador"    model="[titulo: 'Concepto',      concepto: 'concepto',            pagoMapList: pagoMapList]"/>
                    <g:render template="/pago/templates/itemGastoBuscador"    model="[titulo: 'Antigüedad',    concepto: 'esNuevo',             pagoMapList: pagoMapList, booleano: true, tituloVerdadero: 'Socio Nuevo', tituloFalso: 'Renovación']"/>
                    <g:render template="/pago/templates/itemGastoBuscador"    model="[titulo: 'Medio de Pago', concepto: 'medioDePago',         pagoMapList: pagoMapList]"/>
                    <g:render template="/pago/templates/itemGastoBuscador"    model="[titulo: 'Operadores',    concepto: 'autorizadoPorNombre', pagoMapList: pagoMapList]"/>
                    <g:render template="/pago/templates/itemGastoBuscador"    model="[titulo: 'Sexo',          concepto: 'sexo',                pagoMapList: pagoMapList]"/>
                    <g:render template="/pago/templates/totalIngresoBuscador" model="[titulo: 'Total ingreso', clase: 'odd', cantidad: pagoMapList.size(), porcentaje: 100, monto: pagoMapSuma?:0]"/>
                </tbody>
            </table>
        </div>
        %{--<div class="tab-pane fade in" id="1" style="border: 1px solid #ddd; border-bottom: none; border-radius:3px;">
            <div>
                <div id="grafico" class="loader">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>--}%
        <div class="tab-pane fade in" style="border: 1px solid #ddd;" id="grafico_plan">               <g:render template="/graficos/pago/graficoTabla" model="[seriesName: 'Plan',          prefijoDiv: 'grafSup', pagoMapList: pagoMapList, cont: pagoMapSuma, concepto: 'plan']"/></div>
        <div class="tab-pane fade in" style="border: 1px solid #ddd;" id="grafico_concepto">           <g:render template="/graficos/pago/graficoTabla" model="[seriesName: 'Concepto',      prefijoDiv: 'grafSup', pagoMapList: pagoMapList, cont: pagoMapSuma, concepto: 'concepto']"/></div>
        <div class="tab-pane fade in" style="border: 1px solid #ddd;" id="grafico_esNuevo">            <g:render template="/graficos/pago/graficoTabla" model="[seriesName: 'Antigüedad',    prefijoDiv: 'grafSup', pagoMapList: pagoMapList, cont: pagoMapSuma, concepto: 'esNuevo', booleano: true, tituloVerdadero: 'Socio Nuevo', tituloFalso: 'Renovación']"/></div>
        <div class="tab-pane fade in" style="border: 1px solid #ddd;" id="grafico_medioDePago">        <g:render template="/graficos/pago/graficoTabla" model="[seriesName: 'Medio de Pago', prefijoDiv: 'grafSup', pagoMapList: pagoMapList, cont: pagoMapSuma, concepto: 'medioDePago']"/></div>
        <div class="tab-pane fade in" style="border: 1px solid #ddd;" id="grafico_autorizadoPorNombre"><g:render template="/graficos/pago/graficoTabla" model="[seriesName: 'Operador',      prefijoDiv: 'grafSup', pagoMapList: pagoMapList, cont: pagoMapSuma, concepto: 'autorizadoPorNombre']"/></div>
        <div class="tab-pane fade in" style="border: 1px solid #ddd;" id="grafico_sexo">               <g:render template="/graficos/pago/graficoTabla" model="[seriesName: 'Sexo',          prefijoDiv: 'grafSup', pagoMapList: pagoMapList, cont: pagoMapSuma, concepto: 'sexo']"/></div>
    </div>
</div>

<script type="text/javascript">
/*
    $(function () {

        // Create the chart
        $('#grafico').highcharts('StockChart', {
            chart: {
                width: 567,
                height: 400
            },
            */
/*rangeSelector : {
             selected : 1
             },*//*



            rangeSelector: {
                */
/*buttonTheme: { // styles for the buttons
                 fill: 'none',
                 stroke: 'none',
                 'stroke-width': 0,
                 width: 40,
                 r: 8,
                 style: {
                 color: '#332C28'
                 },
                 states: {
                 hover: {
                 },
                 select: {
                 fill: '#332C28',
                 style: {
                 color: 'white'
                 }
                 }
                 }
                 },*//*

                inputDateFormat: '%e-%b-%Y',
                inputEditDateFormat: '%d-%m-%Y',
                inputBoxBorderColor: 'gray',
                inputBoxHeight: 18,
                inputStyle: {
                    color: '#332C28'
                },
                labelStyle: {
                    color: 'silver'
                },
                buttons: [*/
/*{
                 type: 'hour',
                 count: 1,
                 text: '1h'
                 },*//*
 {
                    type: 'day',
                    count: 1,
                    text: '1d'
                }, {
                    type: 'month',
                    count: 1,
                    text: '1M'
                }, {
                    type: 'month',
                    count: 6,
                    text: '6M'
                }, */
/*{
                 type: 'ytd',
                 text: 'YTD'
                 }, {
                 type: 'year',
                 count: 1,
                 text: '1y'
                 }, *//*
{
                    type: 'all',
                    text: 'Todo'
                }],
                inputEnabled: true,
                selected: 4
            },


            */
/*title : {
             text : 'Recaudación'
             },*//*

            xAxis: {
                type: 'datetime',
                dateTimeLabelFormats: {
                    day: '%d-%m<br/>%Y'
                }*/
/*,
                 title: {
                 text: 'Fecha'
                 }*//*

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
                    <% pagoMapList.flatten().sort{it.fechaDeCobro}.each { %>
                    <% if (it.fechaDeCobro) { %>
                    <%  def fecha = new Date(it.fechaDeCobro) %>
                    [ Date.UTC(${fecha?.year+1900}, ${fecha?.month}, ${fecha?.date}, ${fecha?.hours}, ${fecha?.minutes}), ${it?.monto} ],
                    <% } %>
                    <% } %>
                ],
                stickyTracking: false,
                dataGrouping: {
                    approximation: "sum",
                    enabled: true,
                    forced: true,
                    units: [['day',[1]]]
                },
                tooltip: {
                    pointFormat: "Monto: $"+"{point.y:,.0f}"
                }
            }]
        });
    });
*/

</script>