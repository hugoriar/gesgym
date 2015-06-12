<%@ page import="java.text.SimpleDateFormat; org.joda.time.DateTime" %>
<%
    List lista = new ArrayList()
    pagoMapList.groupBy{ it."$concepto" }.each { it, resultados ->
        lista.add([
                titulo    : (!booleano)?(it?(it.toString().toLowerCase().capitalize()):"Sin informar"):(it==true?(tituloVerdadero):(it==false?tituloFalso:"Sin informar")),
                cantidad  : resultados.size(),
                porcentaje: resultados.monto?.sum() ? Math.round(resultados.monto?.sum() / pagoMapList.monto.sum()*100) : 0,
                monto     : resultados?(resultados.monto?.sum()):0
        ])
    }
%>
<h1 class="center" style="font-size: 55px;">$${String.format("%,d", pagoMapList.monto?pagoMapList.monto.sum():0)}</h1>
<g:render template="/graficos/pieVisita" model="[seriesName: seriesName, prefijoDiv: prefijoDiv, pagoMapList: lista, cont: cont, concepto: concepto, cantidad: cantidad]"/>
<table class="table table-bordered table-hover table-condensed">
    <thead>
        <tr class="odd" style="font-weight: bold;">
            <td style="text-align: center;"></td>
            <td style="text-align: center;"><tooltip:tip value="Cantidad de operaciones">Cantidad</tooltip:tip></td>
            <td style="text-align: center;" colspan="2"><tooltip:tip value="Cantidad de operaciones">Monto</tooltip:tip></td>
        </tr>
    </thead>
    <tbody style="text-align: right;">
        <% lista.each { %>
            <tr class=${"odd"} >
                <td style="font-weight: bold; text-align: right;">${it.titulo}</td>
                <td style="text-align: center;">${it.cantidad}</td>
                <td>$</td>
                <td style="font-weight: bold; text-align: right; border-left: none;">${String.format("%,d", it.monto)}</td>
            </tr>
        <% } %>
    </tbody>
</table>
<table class="table table-bordered table-condensed">
    <thead>
        <tr class="odd" style="font-weight: bold;">
            <td style="text-align: center;">#</td>
            <td style="text-align: center;">Hora</td>
            <td style="text-align: center;">${seriesName}</td>
            <td style="text-align: center;" colspan="2">Monto</td>
        </tr>
    </thead>
    <tbody style="text-align: right;">
    <% pagoMapList.sort{ -it.fechaDeCreacion }.eachWithIndex { it, index -> %>
        <% def getColor = [
                'Erika'              : '#71AADE',
                'Andrea'             : '#454548',
                /*----------------------------------*/
                'Efectivo'           : '#71AADE',
                'Tarjeta de crédito' : '#454548',
                'Cheque(s)'          : '#80DA6D',
                'Otro'               : '#lighblue',
                'Tarjeta de débito'  : '#pink'
        ]
        def elconcepto = (it."$concepto").toString().toLowerCase().capitalize()
        %>
        <tr style="background-color: ${getColor."$elconcepto"}; color: white;">
            <td style="text-align: center;">${pagoMapList.size()-index}</td>
            <td style="text-align: center;">${new SimpleDateFormat("HH:mm").format(it.fechaDeCreacion)}</td>
            <td style="text-align: center;">${elconcepto}</td>
            <td>$</td>
            <td style="text-align: right; border-left: none;">${String.format("%,d", it.monto)}</td>
        </tr>
    <% } %>
    </tbody>
</table>