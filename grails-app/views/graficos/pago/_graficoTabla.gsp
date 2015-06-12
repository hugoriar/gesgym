<g:render template="/graficos/pago/grafico4" model="[seriesName: seriesName, prefijoDiv: prefijoDiv, pagoMapList: pagoMapList, cont: cont, concepto: concepto, booleano: booleano]"/>

<table class="table table-bordered table-hover table-condensed">
    <thead>
    <tr class="odd" style="font-weight: bold;">
        <td style="text-align: center;"></td>
        <td style="text-align: center;"><tooltip:tip value="Cantidad de operaciones">Cantidad</tooltip:tip></td>
        <td style="text-align: center;"><tooltip:tip value="Porcentaje redondeado (p.e. 0.123% = 0%)">%</tooltip:tip></td>
        <td style="text-align: center;" colspan="2">Monto</td>
    </tr>
    </thead>
    <tbody style="text-align: right;">
        <g:render template="/pago/templates/itemGastoBuscador" model="[concepto: concepto, pagoMapList: pagoMapList, booleano: booleano]"/>
    </tbody>
</table>
