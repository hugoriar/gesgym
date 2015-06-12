<% if(titulo){%>
    <tr class="odd" ><td style="font-weight: bold;" colspan="5">${titulo}</td></tr>
<% }
    List lista = new ArrayList()
    pagoMapList.groupBy{ it."$concepto" }.each { it, resultados ->
        lista.add([
                titulo    : (!booleano)?(it?(it.toString().toLowerCase().capitalize()):"Sin informar"):(it==true?(tituloVerdadero):(it==false?tituloFalso:"Sin informar")),
                cantidad  : resultados.size(),
                porcentaje: resultados.monto?.sum() ? Math.round(resultados.monto?.sum() / pagoMapList.monto.sum()*100) : 0,
                monto     : resultados?(resultados.monto?.sum()):0
            ])
    }
    lista.sort{ -it.monto }.each { %>
        <g:render template="/pago/templates/totalIngresoBuscador" model="[titulo: it.titulo?:'Sin informar', clase: 'even', cantidad: it.cantidad, porcentaje: it.porcentaje, monto: it.monto?:0]"/>
    <% } %>