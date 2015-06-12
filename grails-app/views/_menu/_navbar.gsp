<%@ page import="org.control.Configuracion" %>
<div id="Navbar" class="navbar navbar-fixed-top navbar-inverse">
	<div class="navbar-inner">
		<div class="container">
			<!-- .btn-navbar is used as the toggle for collapsed navbar content -->
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
				<span class="icon-bar"></span>
            	<span class="icon-bar"></span>
            	<span class="icon-bar"></span>
			</a>

			<a class="brand" href="${createLink(uri: '/')}">
				%{--<img class="logo" src="${resource(plugin: 'kickstart-with-bootstrap', dir:'kickstart/img',file:'grails.png')}" alt="${meta(name:'app.name')}" />--}%
                <img class="logo" src="${createLink(controller:'configuracionBytes', action:'avatar_image', id:"faviconEmpresa")}" alt="${meta(name:'app.name')}"/>
                %{--<img class="logo" src="${createLink(controller:'configuracionBytes', action:'avatar_image', id:"faviconEmpresa")}" alt="${meta(name:'app.name')}"/>--}%
				${meta(name:'app.name')}
				<small> v${meta(name:'app.version')}</small>
			</a>

       		<div class="nav-collapse">
       		
       			<ul class="nav">
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="icon-globe"></span> Menú <b class="caret"></b></a>
                        <ul class="dropdown-menu">
		                    %{--<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                                <li class="controller">
                                    <g:link controller="${c.logicalPropertyName}">
                                        <g:if test="${c.fullName.contains('HomeController')}">
                                            <i class="icon-home"></i>
                                        </g:if>
                                        <g:elseif test="${c.fullName.contains('DemoPageController')}">
                                            <i class="icon-beaker"></i>
                                        </g:elseif>
                                        ${c.fullName.substring(c.fullName.lastIndexOf('.')+1)}
                                    </g:link>
                                </li>
		                    </g:each>--}%
                            <li class="controller">
                            <li class="controller${params.controller == "visita" ? " active" : ""}">                <g:link controller="visita" action="index">                 <g:message code="visita.label" default="Asistencias"/></g:link></li>
                            %{--<li class="controller${params.controller == "userPersonalInstructor" ? " active" : ""}"><g:link controller="userPersonalInstructor" action="index"> <g:message code="userPersonalInstructor.label" default="Instructores"/></g:link></li>--}%
                            <li class="controller${params.controller == "userPersonal" ? " active" : ""}">          <g:link controller="userPersonal" action="index">           <g:message code="userPersonal.label" default="Personal"/></g:link></li>
                            %{--<li class="controller${params.controller == "historialMembresias" ? " active" : ""}">   <g:link controller="historialMembresias" action="index">    <g:message code="historialMembresias.label" default="Membresías"/></g:link></li>--}%
                            %{--<li class="controller${params.controller == "empresa" ? " active" : ""}">               <g:link controller="empresa" action="index">                <g:message code="empresa.label" default="Empresa"/></g:link></li>--}%
                            <li class="controller${params.controller == "cargoInterno" ? " active" : ""}">          <g:link controller="cargoInterno" action="index">           <g:message code="cargoInterno.label" default="Cargos"/></g:link></li>
                            <li class="controller${params.controller == "plan" ? " active" : ""}">                  <g:link controller="plan" action="index">                   <g:message code="plan.label" default="Planes"/></g:link></li>
                            <li class="controller${params.controller == "medioPago" ? " active" : ""}">             <g:link controller="medioPago" action="index">              <g:message code="medioPago.label" default="Medios de Pago"/></g:link></li>
                            <li class="controller${params.controller == "ciudad" ? " active" : ""}">                <g:link controller="ciudad" action="index">                 <g:message code="ciudad.label" default="Ciudades"/></g:link></li>
                            <li class="controller${params.controller == "sector" ? " active" : ""}">                <g:link controller="sector" action="index">                 <g:message code="sector.label" default="Sectores"/></g:link></li>
                            </li>
						</ul>
					</li>
				</ul>

%{--                <g:if test="${ipsServidor!=null}">
                    <g:if test="${ipsServidor.size()>0}">
                        <div style="float: left; display: block; padding: 10px 20px 10px; margin-left: -20px; font-size: 18px; font-weight: 200; color: #777;">
                            <small>(IP del servidor:
                            <g:each in="${ipsServidor}" var="d">
                                ${d?.encodeAsHTML()}
                            </g:each>)</small>
                        </div>
                    </g:if>
                </g:if>--}%

                %{--<g:if test="${Configuracion.getValor("mostrarIpEnEncabezado")!=null}">
                    <g:if test="${Configuracion.getValor("mostrarIpEnEncabezado").equalsIgnoreCase("true")}">
                        <g:set var="ips" value="${Configuracion.findByNombre("IPServidor")}"/>
                        <g:if test="${ips!=null}">
                            <g:if test="${!ips.valor.empty}">--}%
                                <div>
                                %{--<div style="position: fixed; z-index: 1030; margin-bottom: 0;">--}%
                                    <g:form name="intelliSearch" controller="userSocio" action="show" style="margin: 0 !important;">
                                        <div style="float: left; display: block; padding: 0 10px 0 10px; margin: 7px 0 -20px; font-size: 18px; font-weight: 200; color: #777;">
                                        %{--<div style="float: left; display: block; padding: 10px 20px 10px; margin-left: -20px; font-size: 18px; font-weight: 200; color: #777;">--}%
                                            <g:hiddenField name="id" id="id"/>
                                            <g:textField name="userTop" id="userTop" placeholder="Ingrese Nombres, Apellidos o Rut" style="width: 500px;"/>
                                        </div>
                                    </g:form>
                                </div>
                            %{--</g:if>
                        </g:if>
                    </g:if>
                </g:if>--}%

	  			<div class="pull-right">
					<%--Right-side entries--%>
					<%--NOTE: the following menus are in reverse order due to "pull-right" alignment (i.e., right to left)--%>
					<g:render template="/_menu/language"/>
					<g:render template="/_menu/info"/>
					<g:render template="/_menu/user"/><!-- NOTE: the renderDialog for the "Register" modal dialog MUST be placed outside the NavBar (at least for Bootstrap 2.1.1): see bottom of main.gsp -->
					<g:render template="/_menu/admin"/>
<%-- 					<g:render template="/_menu/search"/> --%>
	  			</div>

			</div>
			
		</div>
	</div>
</div>

