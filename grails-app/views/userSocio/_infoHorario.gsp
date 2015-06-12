<g:if test="${horarioInstance}">
    <%@ page import="org.joda.time.DateTime" %>

    <td valign="top" style="text-align: left;" class="value" width="100%" height="100%">
        <table width="100%;" align="center;">
            <g:each in="${horarioInstance.fechas?.sort{it.start_date.day}}" var="f">
                <%
                    DateTime desde = new DateTime(f.start_date)
                    DateTime hasta = new DateTime(f.end_date)
                %>
                <tr>
                    <td style="font-weight: bold">${desde.dayOfWeek().asText.toUpperCase()?.encodeAsHTML()}</td>
                    <td>${desde.hourOfDay+":"+ (desde.minuteOfHour<10?"0":"")+desde.minuteOfHour +" - "+ hasta.hourOfDay+":"+ (hasta.minuteOfHour<10?"0":"")+hasta.minuteOfHour}</td>
                </tr>
            </g:each>

            <tr valign="bottom" align="right">
                <td colspan="2"><br/>
                    %{--<g:submitToRemote
                            oncomplete="showSpinner(false)"
                            onloading="showSpinner(true)"
                            url="[controller:'horario', action:'matricularUsuario']"
                            value="Inscribir usuario"
                    />--}%
                    %{--<g:link controller="horario" action="matricularUsuario" >Inscribir usuario</g:link>--}%
                    <g:actionSubmit action="matricularUsuario" value="Inscribir usuario"/>
                </td>
            </tr>
        </table>

    </td>
</g:if>

%{--
<g:javascript>
    function showSpinner(visible) {
        $('spinner').style.display = visible ? "inline" : "none";
    }

    Ajax.Responders.register({
        onLoading: function() {
            showSpinner(true);
        },
        onComplete: function() {
            if(!Ajax.activeRequestCount) showSpinner(false);
        }
    });
</g:javascript>--}%
