
<%@ page import="org.gym.Cheque" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'cheque.label', default: 'Cheque')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-cheque" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<th><g:message code="cheque.banco.label" default="Banco" /></th>
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'cheque.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="fechaVencimiento" title="${message(code: 'cheque.fechaVencimiento.label', default: 'Fecha Vencimiento')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'cheque.lastUpdated.label', default: 'Last Updated')}" />
			
				<g:sortableColumn property="montoCheque" title="${message(code: 'cheque.montoCheque.label', default: 'Monto Cheque')}" />
			
				<g:sortableColumn property="numeroCheque" title="${message(code: 'cheque.numeroCheque.label', default: 'Numero Cheque')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${chequeInstanceList}" status="i" var="chequeInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${chequeInstance.id}">${fieldValue(bean: chequeInstance, field: "banco")}</g:link></td>
			
				<td><g:formatDate date="${chequeInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${chequeInstance.fechaVencimiento}" /></td>
			
				<td><g:formatDate date="${chequeInstance.lastUpdated}" /></td>
			
				<td>${fieldValue(bean: chequeInstance, field: "montoCheque")}</td>
			
				<td>${fieldValue(bean: chequeInstance, field: "numeroCheque")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${chequeInstanceTotal}" />
	</div>
</section>

</body>

</html>
