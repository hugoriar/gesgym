
<%@ page import="org.gym.Cheque" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'cheque.label', default: 'Cheque')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-cheque" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cheque.banco.label" default="Banco" /></td>
				
				<td valign="top" class="value"><g:link controller="banco" action="show" id="${chequeInstance?.banco?.id}">${chequeInstance?.banco}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cheque.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${chequeInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cheque.fechaVencimiento.label" default="Fecha Vencimiento" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${chequeInstance?.fechaVencimiento}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cheque.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${chequeInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cheque.montoCheque.label" default="Monto Cheque" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: chequeInstance, field: "montoCheque")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cheque.numeroCheque.label" default="Numero Cheque" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: chequeInstance, field: "numeroCheque")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cheque.pago.label" default="Pago" /></td>
				
				<td valign="top" class="value"><g:link controller="pago" action="show" id="${chequeInstance?.pago?.id}">${chequeInstance?.pago}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
