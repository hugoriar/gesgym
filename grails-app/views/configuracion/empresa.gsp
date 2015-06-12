<%@ page import="org.control.Configuracion" %>
<html>

<head>
	<title><g:message code="default.welcome.title" args="[meta(name:'app.name')]"/> </title>
	<meta name="layout" content="kickstart" />
    <resource:lightBox labelImage="Bild" labelOf="von" />
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

<g:uploadForm class="form-horizontal">
%{--<g:form action="ip" class="form-horizontal" >--}%
    <fieldset class="form">

        <div class="control-group fieldcontain ${hasErrors(bean: productoInstance, field: 'categoria', 'error')} required">
            <label for="categoria" class="control-label"><g:message code="producto.categoria.label" default="Nombre Empresa" /><span class="required-indicator">*</span></label>
            <div class="controls">
                <g:textField name="nombreEmpresa" value="${nombreEmpresa}"/>
                <span class="help-inline">${hasErrors(bean: productoInstance, field: 'categoria', 'error')}</span>
            </div>
        </div>

 %{--       <div class="control-group fieldcontain ${hasErrors(bean: productoInstance, field: 'categoria', 'error')} required">
            <label for="categoria" class="control-label"><g:message code="producto.categoria.label" default="Logo de Empresa" /><span class="required-indicator">*</span></label>
            <div class="controls">
                <input type="file" id="logoEmpresa" name="logoEmpresa" />
                --}%%{--<g:if test="${userSocioInstance.foto}">
                    <richui:lightBox href="${createLink(controller:'userSocio', action:'avatar_image', id:userSocioInstance.id)}">
                        <img class="avatar" id="img1" style="" src="${createLink(controller:'userSocio', action:'avatar_image', id:userSocioInstance.id)}"/>
                    </richui:lightBox>
                </g:if>--}%%{--
                <span class="help-inline">${hasErrors(bean: productoInstance, field: 'categoria', 'error')}</span>
            </div>
        </div>--}%

        <table>
        <tr>
            <td style="vertical-align: top">
                <div class="control-group fieldcontain ${hasErrors(bean: configuracionBytesInstance, field: 'valor', 'error')} required">
                    <label for="valor" class="control-label"><g:message code="configuracionBytes.valor.label" default="Logo de Empresa" /><span class="required-indicator">*</span></label>
                    <div class="controls">
                        <input type="file" id="valor" name="valor" />
                        <span class="help-inline">${hasErrors(bean: configuracionBytesInstance, field: 'valor', 'error')}</span>
                    </div>
                </div>
            </td>
            <td style="vertical-align: top; /*text-align: center; border: solid 1px;*/">
                <div>
                    <g:if test="${logoEmpresa}">
                        %{--Previsualización:--}%
                        <richui:lightBox href="${createLink(controller:'configuracionBytes', action:'avatar_image', id:"logoEmpresa")}">
                            <img class="avatar" id="img1" style="" src="${createLink(controller:'configuracionBytes', action:'avatar_image', id:"logoEmpresa")}"/>
                        </richui:lightBox>
                    </g:if>
                </div>
            </td>
        </tr>
        <tr>
            <td style="vertical-align: top">
                <div class="control-group fieldcontain ${hasErrors(bean: configuracionBytesInstance, field: 'valor', 'error')} required">
                    <label for="valor" class="control-label"><g:message code="configuracionBytes.valor.label" default="Icono de Empresa" /><span class="required-indicator">*</span></label>
                    <div class="controls">
                        <input type="file" id="faviconEmpresa" name="faviconEmpresa" />
                        <span class="help-inline">${hasErrors(bean: configuracionBytesInstance, field: 'faviconEmpresa', 'error')}</span>
                    </div>
                </div>
            </td>
            <td style="vertical-align: top; /*text-align: center; border: solid 1px;*/">
                <div>
                    <g:if test="${faviconEmpresa}">
                        %{--Previsualización:--}%
                        <richui:lightBox href="${createLink(controller:'configuracionBytes', action:'avatar_image', id:"faviconEmpresa")}">
                            <img class="avatar" id="img1" style="" src="${createLink(controller:'configuracionBytes', action:'avatar_image', id:"faviconEmpresa")}"/>
                        </richui:lightBox>
                    </g:if>
                </div>
            </td>
        </tr>
        </table>


    </fieldset>
    <div class="form-actions">
        <g:actionSubmit action="cambiaEmpresa" class="btn btn-primary" value="${message(code: 'default.button.cambiar.label', default: 'Guardar')}" />
        <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
    </div>
</g:uploadForm>

</body>

</html>
