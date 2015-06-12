<%@ page import="org.joda.time.DateTime" %>
<%
    List lista = new ArrayList()
    list.groupBy{ it.usuario.sexo.sexo }.each { it, resultados ->
        lista.add([
                titulo    : it.toString().toLowerCase().capitalize()?:"Sin informar",
                cantidad  : resultados.size(),
                porcentaje: Math.round(resultados.size() / list.size()*100)
        ])
    }
%>
<h1 class="center" style="font-size: 55px;">${list.size()}</h1>
<g:render template="/graficos/pieVisita" model="[seriesName: seriesName, prefijoDiv: prefijoDiv, pagoMapList: lista, cont: list.size(), concepto: concepto]"/>
<table class="table table-bordered table-hover table-condensed">
    <thead>
        <tr class="odd" style="font-weight: bold;">
            <td style="text-align: center;"></td>
            <td style="text-align: center;"><tooltip:tip value="Cantidad de operaciones">Cantidad</tooltip:tip></td>
            <td style="text-align: center;"><tooltip:tip value="Porcentaje redondeado (p.e. 0.123% = 0%)">%</tooltip:tip></td>
        </tr>
    </thead>
    <tbody style="text-align: right;">
        <% lista.each { %>
            <tr class=${"odd"} >
                <td style="font-weight: bold; text-align: right;">${it.titulo}</td>
                <td style="text-align: center;">${it.cantidad}</td>
                <td style="text-align: center;">${it.porcentaje}%</td>
            </tr>
        <% } %>
    </tbody>
</table>
<g:if test="${!noDetalleAsistencias}">
    <table class="table table-bordered table-hover table-condensed">
        <thead>
            <tr class="odd" style="font-weight: bold;">
                <td style="text-align: center;">#</td>
                <td style="text-align: center;">Hora</td>
                <td style="text-align: center;">Socio</td>
            </tr>
        </thead>
        <tbody style="text-align: right;">
            <% list.eachWithIndex { asistencia, index -> %>
                <tr style='background-color: ${asistencia.usuario.sexo.id==1?'lightblue':'pink'}' >
                    <td style="font-weight: bold; text-align: center;">${list.size()-index}</td>
                    <td style="font-weight: bold; text-align: center;">${asistencia.horaDeEntrada?.toString()[0..-4]}</td>
                    <td style="text-align: center;"><g:link controller="userSocio" action="show" id="${asistencia.usuario?.id}">${asistencia?.usuario}</g:link></td>
                </tr>
            <% } %>
        </tbody>
    </table>
</g:if>
