<%@ page import="org.control.Configuracion" %>
<html>

<head>
	<title><g:message code="default.welcome.title" args="[meta(name:'app.name')]"/> </title>
	<meta name="layout" content="kickstart" />
</head>

<body>

	<section id="intro" class="first">
		<h1>Configuración del Sistema</h1>
		<p>
			Use los controles superiores para entrar a las distintas opciones
			Algunas opciones están en fase de desarrollo. Siéntase libre para
			navegar por las distintas opciones.
		</p>
	</section>

<g:form class="form-horizontal" >
%{--<g:form action="ip" class="form-horizontal" >--}%
    <fieldset class="form">

        <div class="control-group fieldcontain ${hasErrors(bean: productoInstance, field: 'categoria', 'error')} required">
            <label for="categoria" class="control-label"><g:message code="producto.categoria.label" default="Prefijo IP" /><span class="required-indicator">*</span></label>
            <div class="controls">
                <g:textField name="prefijoIp" value="${prefijoIp}"/> <g:actionSubmit action="ip" name="updateIp" class="btn btn-primary" value="${message(code: 'default.button.cambiar.label', default: 'Buscar por prefijo')}" />
                <span class="help-inline">${hasErrors(bean: productoInstance, field: 'categoria', 'error')}</span>
            </div>
        </div>

        <div class="control-group fieldcontain ${hasErrors(bean: productoInstance, field: 'categoria', 'error')} required">
            <label for="categoria" class="control-label"><g:message code="producto.categoria.label" default="Adaptador de red" /><span class="required-indicator">*</span></label>
            <div class="controls">
                <g:select id="networkInterfaces" name="adaptador" from="${networkInterfaces}" required="" value="${ Configuracion.getValor("AdaptadorIPServidor")}" noSelection="['':'-Seleccione adaptador-']" />
                <span class="help-inline">${hasErrors(bean: productoInstance, field: 'categoria', 'error')}</span>
            </div>
        </div>

        <div class="control-group fieldcontain ${hasErrors(bean: productoInstance, field: 'categoria', 'error')} required">
            <label for="categoria" class="control-label"><g:message code="producto.categoria.label" default="Mostrar IP en encabezado: " /></label>
            <div class="controls">
                <g:checkBox name="mostrarIpEnEncabezado" checked="${mostrarIpEnEncabezado}" />
                %{--<bs:checkBox name="mostrarIpEnEncabezado" value="${mostrarIpEnEncabezado}" checked="${mostrarIpEnEncabezado}" id="mostrarIpEnEncabezado"/>--}%
                <span class="help-inline">${hasErrors(bean: productoInstance, field: 'categoria', 'error')}</span>
            </div>
        </div>

        <div class="control-group fieldcontain ${hasErrors(bean: productoInstance, field: 'categoria', 'error')} required">
            <label for="categoria" class="control-label"><g:message code="producto.categoria.label" default="Mostrar IP en pie: " /></label>
            <div class="controls">
                <g:checkBox name="mostrarIpEnPie" checked="${mostrarIpEnPie}" />
                <span class="help-inline">${hasErrors(bean: productoInstance, field: 'categoria', 'error')}</span>
            </div>
        </div>

        <div class="control-group fieldcontain ${hasErrors(bean: productoInstance, field: 'categoria', 'error')} required">
            <label for="categoria" class="control-label"><g:message code="producto.categoria.label" default="Email(s) aviso de cambio de IP: " /><span class="required-indicator">*</span></label>
            <div class="controls">
                <g:textField name="emailsAvisoCambioIp" value="${emailsAvisoCambioIp}"/>
                <span class="help-inline">${hasErrors(bean: productoInstance, field: 'categoria', 'error')}</span>
            </div>
        </div>

    </fieldset>
    <div class="form-actions">
        <g:actionSubmit action="cambiaAdaptador" class="btn btn-primary" value="${message(code: 'default.button.cambiar.label', default: 'Guardar')}" />
        <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
    </div>
</g:form>

</body>

</html>
