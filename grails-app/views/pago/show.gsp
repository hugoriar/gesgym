
<%@ page import="org.control.Pago" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
    <resource:lightBox labelImage="Bild" labelOf="von" />
	<g:set var="entityName" value="${message(code: 'pago.label', default: 'Pago')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-pago" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pago.monto.label" default="Monto" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: pagoInstance, field: "monto")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pago.medioDePago.label" default="Medio De Pago" /></td>
				
				<td valign="top" class="value"><g:link controller="medioPago" action="show" id="${pagoInstance?.medioDePago?.id}">${pagoInstance?.medioDePago}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pago.fecha.label" default="Fecha" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${pagoInstance?.fecha}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pago.numeroDeBoleta.label" default="Número De Boleta" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: pagoInstance, field: "numeroDeBoleta")}</td>
				
			</tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="pago.pagoConfirmado.label" default="Pago Confirmado" /></td>
                <td valign="top" class="value">${pagoInstance?.pagoConfirmado?"Si":"No"}</td>
            </tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pago.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${pagoInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pago.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${pagoInstance?.dateCreated}" /></td>
				
			</tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="pago.fotoBoleta.label" default="Foto de Boleta" /></td>

            </tr>
		
%{--			<tr class="prop">
				<td valign="top" class="name"><g:message code="pago.cheque.label" default="Cheque" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${pagoInstance.cheque}" var="c">
						<li><g:link controller="cheque" action="show" id="${c.id}">${c}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		--}%
		</tbody>
	</table>

    <div id="nozoom" style="text-align: center;">
        <g:if test="${pagoInstance.fotoBoleta}">
            <richui:lightBox href="${createLink(controller:'pago', action:'avatar_image', id:pagoInstance.id)}">
                <img class="avatar" id="img1" style="" src="${createLink(controller:'pago', action:'avatar_image', id:pagoInstance.id)}"/>
            </richui:lightBox>
        </g:if>
        <g:else>
            <img style="border: 1px solid #dadada;"  src="${resource(dir: 'images/',file: 'invoice.png')}" />
        </g:else>
    </div>
</section>

</body>

</html>
