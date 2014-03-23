
<%@ page import="java.text.SimpleDateFormat; org.gym.UserSocio" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="kickstart" />
    <tooltip:resources/>
    <export:resource />
    <g:set var="entityName" value="${message(code: 'userSocio.label', default: 'UserSocio')}" />
    <g:set var="desdeFormateado" value="${new SimpleDateFormat('dd-MM-yyyy').format(desde)}" />
    <g:set var="hastaFormateado" value="${new SimpleDateFormat('dd-MM-yyyy').format(hasta)}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>

    <script type="text/javascript">
        function toogleCamposFechas(){
            var cbUsarFecha = document.getElementById('usarFechas');
            var fieldDesde = document.getElementById('desde');
            var fieldhasta = document.getElementById('hasta');
            if (cbUsarFecha.checked){
                fieldDesde.disabled = false;
                fieldhasta.disabled = false;
            }else{
                fieldDesde.disabled = true;
                fieldhasta.disabled = true;
                fieldDesde.readonly = true;
                fieldhasta.readonly = true;
                $("#fieldDesde").hide();
                $("#fieldhasta").hide();
            }
        }

        $(document).ready(function() {
            toogleCamposFechas();
        });
    </script>

</head>

<body>
<h1 style="vertical-align: bottom;"><img src="${resource(dir: 'images',file: 'ranking.png')}" />Ranking de Asistencias ${sufijoTitulo}</h1>
<br/>

    <g:form action="rankings" class="form-horizontal">
        <fieldset class="form">
            <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'estadoMembresia', 'error')}">
                <tooltip:tip value="Filtrar resultados según el rango de fechas especificado">
                    <g:checkBox name="usarFechas" checked="${usarFechas}" onchange="toogleCamposFechas();"/>
                    <label for="estadoMembresia" class="control-label"><g:message code="userSocio.fechaTerminoEntre.label" default=" Rango de asistencias entre: " /></label>
                </tooltip:tip>
                <div class="controls" id="controls">
                    <bs:datePicker name="desde" id="desde" precision="day" value="${desde}" default="none" noSelection="['': 'Entre']" />
                    y <bs:datePicker name="hasta" id="hasta" precision="day" value="${hasta}" default="none" noSelection="['': 'Hasta']" />
                    <g:submitButton name="rankings" class="btn btn-primary" value="${message(code: 'default.button.buscar.label', default: 'Buscar')}" /> %{--${userSocioInstanceTotal} Resultados--}%
                </div>
            </div>
        </fieldset>
    </g:form>

<section id="list-userSocio" class="first">

    <table class="table table-bordered">
        <thead>
        <tr>
            %{--<td>Socio</td>--}%
            <g:sortableColumn property="nombre" title="${message(code: 'userSocio.nombre.label', default: 'Nombre')}" params="['desde': desdeFormateado, 'hasta': hastaFormateado, 'usarFechas': usarFechas]" />
            <g:sortableColumn property="apellidoPaterno" title="${message(code: 'userSocio.apellidoPaterno.label', default: 'Apellido Paterno')}" params="['desde': desdeFormateado, 'hasta': hastaFormateado, 'usarFechas': usarFechas]"  />
            <g:sortableColumn property="apellidoMaterno" title="${message(code: 'userSocio.apellidoMaterno.label', default: 'Apellido Materno')}" params="['desde': desdeFormateado, 'hasta': hastaFormateado, 'usarFechas': usarFechas]"  />
            <g:sortableColumn property="rut" title="${message(code: 'userSocio.rut.label', default: 'Rut')}" params="['desde': desdeFormateado, 'hasta': hastaFormateado, 'usarFechas': usarFechas]"  />
            <g:sortableColumn property="estadoMembresia" title="${message(code: 'userSocio.estadoActual.label', default: 'Estado Actual')}" params="['desde': desdeFormateado, 'hasta': hastaFormateado, 'usarFechas': usarFechas]"  />
            <td>${message(code: 'userSocio.historialMembresias.fechaFin.label', default: 'Término Plan')}</td>
            %{--<g:sortableColumn property="historialMembresias.fechaFin" title="${message(code: 'userSocio.historialMembresias.fechaFin.label', default: 'Término Plan')}" params="['desde': desdeFormateado, 'hasta': hastaFormateado, 'usarFechas': usarFechas]"  />--}%
            %{--<g:sortableColumn property="cantVisitas" title="${message(code: 'userSocio.visitas.label', default: 'Totales')}" />--}%
            %{--<td>${message(code: 'userSocio.visitas.label', default: 'Asistencias')}</td>--}%
            <g:sortableColumn property="cantVisitas" title="${message(code: 'userSocio.visitas.label', default: 'Asistencias')}" params="['desde': desdeFormateado, 'hasta': hastaFormateado, 'usarFechas': usarFechas]"  />
        </tr>
        </thead>
        <tbody>
        <g:each in="${userSocioInstanceList}" status="i" var="userSocioInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                %{--<td><g:link action="show" id="${userSocioInstance.id}">${userSocioInstance}</g:link></td>--}%
                <td><g:link action="show" id="${userSocioInstance.id}">${fieldValue(bean: userSocioInstance, field: "nombre")}</g:link></td>
                <td><g:link action="show" id="${userSocioInstance.id}">${fieldValue(bean: userSocioInstance, field: "apellidoPaterno")}</g:link></td>
                <td><g:link action="show" id="${userSocioInstance.id}">${fieldValue(bean: userSocioInstance, field: "apellidoMaterno")}</g:link></td>
                <td><g:link action="show" id="${userSocioInstance.id}">${fieldValue(bean: userSocioInstance, field: "rut")}-${fieldValue(bean: userSocioInstance, field: "dv")}</g:link></td>
                <td style="color: ${userSocioInstance?.estadoMembresia?.color}">${fieldValue(bean: userSocioInstance, field: "estadoMembresia")}</td>
                <td style="color: ${userSocioInstance?.estadoMembresia?.color}">
                    <g:if test="${userSocioInstance?.historialMembresias}">
                        ${userSocioInstance.ultimoPlan.fechaFin?.getDateString()}
                    </g:if>
                </td>
                <td>
                    <g:if test="${usarFechas}">
                        <g:link action="show" id="${userSocioInstance.id}">${userSocioInstance?.getCantVisitasFecha(desde, hasta)}</g:link>
                    </g:if>
                    <g:else>
                        <g:link action="show" id="${userSocioInstance.id}">${userSocioInstance?.getCantVisitas()}</g:link>
                    </g:else>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
    <export:formats formats="['pdf']" params="['desde': desdeFormateado, 'hasta': hastaFormateado, 'usarFechas': usarFechas, 'sort': sort, 'order': order]"/>
    ${userSocioInstanceTotal} Resultados
</section>

</body>

</html>
