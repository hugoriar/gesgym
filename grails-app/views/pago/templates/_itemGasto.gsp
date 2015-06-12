<tr class="odd" ><td style="font-weight: bold;" colspan="6">${titulo}</td></tr>
<%
    if(itemsList.isEmpty()) {
        listaDeMapLists.each { pagoMap ->
            pagoMap.groupBy{ it."$concepto" }.each { concepto, resultados ->
                if(!itemsList.contains([nombre: concepto])) {
                    itemsList.add([nombre: concepto])
                }
            }
        }
    }

    itemsList.each { item -> %>
        <tr class="even" >
            <td style="text-align: right;" >
                <% if(!booleano){ %>
                    ${item.nombre?(item.nombre.toLowerCase().capitalize()):"Sin informar"}
                <% } else { %>
                    ${item.nombre==true?(tituloVerdadero):(item.nombre==false?tituloFalso:"Sin informar")}
                <% } %>
            </td>
            <%  int monto1 = 0
                int monto2 = 0
                def pasada1 = false
                listaDeMapLists.each { pagoMap ->
                    def encontrado = false
                    monto2 = 0
                    pagoMap.groupBy{ it."$concepto" }.each { itemEspecifico, resultados ->
                        if(itemEspecifico.toString().equals(item.nombre.toString())) {
                            if (!pasada1){ monto1 = resultados?(cantidad?(resultados.size()):(resultados.monto?.sum())):0 }
                            monto2 = resultados?(cantidad?(resultados.size()):(resultados.monto?.sum())):0
                            encontrado = true
                            pasada1 = true  %>
                            <td>${cantidad?"":"\$"}</td><td style="text-align: right; border-left: none;" >${String.format("%,d", monto2)}</td>
                    <% }
                    }
                    if( !encontrado ) {
                         pasada1 = true %>
                        <td>${cantidad?"":"\$"}</td><td style="text-align: right; border-left: none;" >${String.format("%,d", 0)}</td>
                 <% }
                } %>

             <% int dif = monto1 - monto2
                if (dif != 0) { %>
                <td style="text-align: center; color: ${dif<0?"red":"limegreen"};">
                    ${((dif>0)?"+":"-") + String.format((cantidad?"":"\$")+"%,d", Math.abs(dif))}
                    <% if (monto2 != 0) { %>
                        <i class="${dif<0?("icon-arrow-down"):("icon-arrow-up")}" style="color:${dif<0?"red":"limegreen"};"></i>${(dif<0) ? (new Float(100 - ((100*monto1)/(monto2?:1))).round(2)) : (new Float(((100*monto1)/(monto2?:1))-100).round(2))}%
                    <% } else { %>
                        <i class="icon-arrow-up" style="color: limegreen;"></i>
                    <% } %>
                </td>
            <% } else { %>
                <td style="text-align: center;">--</td>
            <% } %>
        </tr>
    <% } %>