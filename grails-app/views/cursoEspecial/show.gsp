
<%@ page import="org.control.CursoEspecial" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'cursoEspecial.label', default: 'CursoEspecial')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
    <style>
        .btn {
            font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;
            font-size: 130%;
            /*font-weight: bold;*/
            margin: 3px 0;
            padding: .3em .6em;
            /*box-shadow: 0 2px 1px rgba(0,0,0,0.3),0 1px 0 rgba(255,255,255,0.4) inset;*/
            /*background-color: #333;*/
            /*color: #fff;*/
            border: 1px solid #000 !important;
            border-radius: 3px;
            text-decoration: none;
        }
    </style>
    </head>

<body>

<section id="show-cursoEspecial" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cursoEspecial.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: cursoEspecialInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cursoEspecial.descripcion.label" default="Descripcion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: cursoEspecialInstance, field: "descripcion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cursoEspecial.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${cursoEspecialInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cursoEspecial.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${cursoEspecialInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cursoEspecial.vigente.label" default="Vigente" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${cursoEspecialInstance?.vigente}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cursoEspecial.foto.label" default="Foto" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cursoEspecial.horario.label" default="Horario" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${cursoEspecialInstance.horario}" var="h">
						<li><g:link controller="horario" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>

    <g:link class="btn" controller="horario" action="create" id="${cursoEspecialInstance?.id}">+ Nuevo Horario</g:link>
    %{--<g:link class="btn" controller="eventRec" action="create" id="${cursoEspecialInstance?.id}">Agregar Dia</g:link>--}%
</section>

</body>

</html>
