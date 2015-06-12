<%@ page import="org.control.Email" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'email.label', default: 'Email')}" />
	<g:set var="contAdjuntos" value="${0l}" scope="session"/>
	<g:set var="conta" value="${0l}" scope="session"/>
	<title><g:message code="default.create.label" args="[entityName]" /></title>
    <g:javascript library="jquery"/>
    <script>
    var contador = ${contAdjuntos} + 1;

        function addRow(table) {
            $("#"+table).append("<input type='file' id='archivo"+contador+"' name='archivo"+contador+"'/> <br/>");
            contador++;
            document.getElementById('contador').value = contador;
        }

    </script>

</head>

<body>

<section id="create-email" class="first">

	<g:hasErrors bean="${emailInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${emailInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" method="post" enctype="multipart/form-data" >
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
		<div class="form-actions">
            <g:submitButton formaction="mandarMailsBatch" name="mandarMailsBatch" class="btn btn-primary" value="${message(code: 'default.button.send.label', default: 'Enviar')}" />
            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
		</div>
	</g:form>
	
</section>
		
</body>

</html>
