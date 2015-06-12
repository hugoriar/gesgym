
<%@ page import="org.control.UserSocio; org.joda.time.DateTime; org.control.calendario.Horario" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'horario.label', default: 'Horario')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
    <r:require module="colorPicker"/>
    <script>
        jQuery.noConflict();
        jQuery(document).ready( function() {
            jQuery('#color, #textColor').minicolors({
                opacity:false,
                readonly:false
            });
        });
    </script>
</head>

<body>

<section id="show-horario" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="horario.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: horarioInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="horario.curso.label" default="Curso" /></td>
				
				<td valign="top" class="value"><g:link controller="cursoEspecial" action="show" id="${horarioInstance?.curso?.id}">${horarioInstance?.curso?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
%{--			<tr class="prop">
				<td valign="top" class="name"><g:message code="horario.fechas.label" default="Fechas" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${horarioInstance.fechas}" var="f">
						<li><g:link controller="eventRec" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>--}%

            <tr class="prop">
                <td valign="top" class="name"><g:message code="horario.fechas.label" default="Fechas" /></td>
                <td valign="top" style="text-align: left;" class="value">
                    <ul>
                        <g:each in="${horarioInstance.fechas?.sort{it.start_date.day}}" var="f">
                            <%
                                DateTime desde = new DateTime(f.start_date)
                                DateTime hasta = new DateTime(f.end_date)
                            %>
                            <li><g:link controller="eventRec" action="show" id="${f.id}">${desde.dayOfWeek().asText.toUpperCase()?.encodeAsHTML() +" "+ desde.hourOfDay+":"+ (desde.minuteOfHour<10?"0":"")+desde.minuteOfHour +" - "+ hasta.hourOfDay+":"+ (hasta.minuteOfHour<10?"0":"")+hasta.minuteOfHour}</g:link></li>
                        </g:each>
                    </ul>
                </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="horario.fechas.label" default="Socios" /></td>
                <td valign="top" style="text-align: left;" class="value">
                    <ul>
                        %{--<g:each in="${horarioInstance.fechas?.sort{it.start_date.day}}" var="f">--}%
                        <g:each in="${usuariosInstanceList}" var="f">
                        %{--<g:each in="${UserSocio.findAllByHorarios(new Set<Horario>(horarioInstance))}" var="f">--}%
                            <li><g:link controller="userSocio" action="show" id="${f.id}">${f.nombre}</g:link></li>
                        </g:each>
                    </ul>
                </td>
            </tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="horario.color.label" default="Color" /></td>
                <td valign="top" class="value"><g:textField disabled="disabled" value="${fieldValue(bean: horarioInstance, field: "color")}" id="color" name="color" class="minicolors" /></td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="horario.textColor.label" default="Text Color" /></td>
                <td valign="top" class="value"><g:textField disabled="disabled" value="${fieldValue(bean: horarioInstance, field: "textColor")}" id="textColor" name="textColor" class="minicolors" /></td>
			</tr>


        %{--<div class="control-group fieldcontain ${hasErrors(bean: horarioInstance, field: 'color', 'error')} ">
            <label for="color" class="control-label"><g:message code="horario.color.label" default="Color" /></label>
            <div class="controls">
                <g:textField value="${horarioInstance?.color?:"#1796b0"}" id="color" name="color" class="minicolors" />
                <span class="help-inline">${hasErrors(bean: horarioInstance, field: 'color', 'error')}</span>
            </div>
        </div>

        <div class="control-group fieldcontain ${hasErrors(bean: horarioInstance, field: 'textColor', 'error')} ">
            <label for="textColor" class="control-label"><g:message code="horario.textColor.label" default="Text Color" /></label>
            <div class="controls">
                <g:textField value="${horarioInstance?.textColor?:"#ffffff"}" id="textColor" name="textColor" class="minicolors" />
                <span class="help-inline">${hasErrors(bean: horarioInstance, field: 'textColor', 'error')}</span>
            </div>
        </div>--}%
		
		</tbody>
	</table>
    <div class="form-actions">
        <g:link class="btn btn-primary" controller="eventRec" action="create" params="['horarioId': horarioInstance?.id, 'horarioInstanceCursoId': horarioInstance.curso?.id]" id="${horarioInstance.curso?.id}">+ Agregar clase</g:link>
    </div>
</section>

</body>

</html>
