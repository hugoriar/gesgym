<%@ page import="org.gym.LogCambiosDeEstado" %>
<html>

<head>
	<title><g:message code="default.welcome.title" args="[meta(name:'app.name')]"/> </title>
	<meta name="layout" content="kickstart" />
    <g:set var="hoy" value="${new Date().format("dd-MM-yyyy")}" />
    <g:set var="proxSemana" value="${(new Date() + 7).format("dd-MM-yyyy")}" />
    <g:set var="semanaPasada" value="${(new Date() - 7).format("dd-MM-yyyy")}" />
</head>

<body>

	<section id="intro" class="first">
		<h1>Bienvenido al sistema de gestión de socios</h1> %{--(Último proceso de auto cambios de estados: ${fecha})--}%
		<p>
			Use los controles superiores para entrar a las distintas opciones
			Algunas opciones están en fase de desarrollo. Siéntase libre para
			navegar por las distintas opciones.
		</p>
		%{--<h2>Introduction</h2>
		<p>
			Kickstart is an extension for Grails in order to start your
			project with a good looking frontend. It is intended to be used in
			rapid application scenarios such as a Startup Weekend or a
			prototyping session with a customer. This plugin provides adapted
			scaffolding templates for standard CRUD pages using the Bootstrap web
			page template by Twitter. Additionally, Kickstart includes some
			general GSPs pages (e.g., about.gsp), a minimal logging/orientation
			Filter, and a language switcher.
		</p>
		<g:link class="btn btn-large btn-primary" controller="nextSteps">Next Steps</g:link>--}%
	</section>

	<section id="info" style="padding-top: 40px !important;">
		<div class="row-fluid">
	    	<div class="span4">
                <h3 class="center">Socios</h3>
                <p/>
                <table>
                    <tbody>
                    <tr>
                        <td>
                            %{--<div class="center">--}%
                            <g:link controller="userSocio" action="list" title="Listar Socios"><img class="frontpageImage" src="${resource(dir: 'images/icons',file: 'usuario.png')}" /></g:link>
                            %{--</div>--}%
                        </td>
                        <td style="vertical-align: top; font-size: 16px;">
                            <p><i class="icon-list"></i><g:link controller="userSocio" action="list"> Listar Socios</g:link></p>
                            <p><i class="icon-plus-sign"></i><g:link controller="userSocio" action="create"> Matricular Socio</g:link></p>
                            <p><i class="icon-circle-arrow-up"></i><g:link controller="userSocio" action="listCambiarEstadoBatch" params="[estadoMembresiaId: 1, soloExpirados: Boolean.FALSE, usarFechas: Boolean.TRUE, desde: hoy, hasta: proxSemana]"> Gestionar Estados</g:link></p>
                            <p><i class="icon-info-sign"></i><g:link controller="userSocio" action="listCumpleanosUsuario" params="[usarFechas: Boolean.FALSE, operacion: 'cumpleanos']"> Cumpleaños</g:link></p>
                            %{--<p><i class="icon-list"></i><g:link controller="userSocio" action="listCambiarEstadoBatch" params="[estadoMembresiaId: 1, soloExpirados: Boolean.TRUE, usarFechas: Boolean.FALSE]"> Cambiar Estados</g:link></p>--}%
                            %{--<p><i class="icon-list"></i><g:link controller="historialMembresias" action="list"> Listar Membresias</g:link></p>--}%
                            %{--<p><i class="icon-remove-sign"></i><g:link controller="userSocio" action="delete"> Eliminar usuarios</g:link></p>--}%
                            %{--<p><i class="icon-remove-sign"></i><g:link controller="userSocio" action="listAccionesUsuario" params="[accion: 'eliminarUsuario']"> Eliminar usuarios</g:link></p>--}%
                            %{--<p><i class="icon-circle-arrow-up"></i><g:link controller="userSocio" action="listAccionesUsuario" params="[accion: 'renovarPlan']"> Renovar Plan</g:link></p>--}%
                            %{--<p><i class="icon-asterisk"></i><g:link controller="userSocio" action="listAccionesUsuario" params="[accion: 'renovarPlan']"> Congelar Usuario</g:link></p>--}%
                            %{--<p><i class="icon-edit"></i><g:link controller="userSocio" action="listAccionesUsuario" params="[accion: 'cambiarEstado']"> Cambiar Estado</g:link></p>--}%
                        </td>
                    </tr>
                    </tbody>
                </table>
                <p>Módulo de gestión de usuarios/clientes del gimnasio. Use las distintas opciones en el listado para gestionar
                    los datos de los clientes, entre ellos enlistar, enrolar, editar y eliminar.
                </p>
			</div>

	    	<div class="span4">
                <h3 class="center">Asistencias</h3>
                <p/>
                <table>
                    <tbody>
                    <tr>
                        <td>
                            %{--<div class="center">--}%
                            <g:link controller="visita" action="list" params="[desde: hoy, hasta: hoy, order: 'desc']" title="Ver asistencias de hoy"><img class="frontpageImage" src="${resource(dir: 'images/icons',file: 'asistencias.png')}" /></g:link>
                            %{--</div>--}%
                        </td>
                        <td style="vertical-align: top; font-size: 16px;">
                            <p><i class="icon-list"></i><g:link controller="visita" action="list" params="[desde: hoy, hasta: hoy, order: 'desc']"> Hoy</g:link></p>
                            <p><i class="icon-list"></i><g:link controller="visita" action="list" params="[inicioDeSemana: Boolean.TRUE, hasta: hoy, order: 'desc']"> Esta Semana</g:link></p>
                            <p><i class="icon-list"></i><g:link controller="visita" action="list" params="[desde: hoy, hasta: hoy, order: 'desc']"> Filtrar x Fechas</g:link></p>
                            %{--<p><i class="icon-list"></i><g:link controller="visita" action="listUsuarios" params="[desde: hoy, hasta: hoy, order: 'desc']"> Filtrar x Usuario</g:link></p>--}%
                        </td>
                    </tr>
                    </tbody>
                </table>
                <p>Módulo de gestión del personal del gimnasio. Use las distintas opciones en el listado para gestionar
                los datos de los clientes, entre ellos enlistar, enrolar, editar y eliminar.
                </p>
			</div>

            <div class="span4">
                <h3 class="center">Rankings</h3>
                <p/>
                <table>
                    <tbody>
                    <tr>
                        <td>
                            %{--<div class="center">--}%
                            <g:link controller="visita" action="list" params="[desde: hoy, hasta: hoy, order: 'desc']" title="Ver asistencias de hoy"><img class="frontpageImage" src="${resource(dir: 'images/icons',file: 'estadisticas.png')}" /></g:link>
                        %{--</div>--}%
                        </td>
                        <td style="vertical-align: top; font-size: 16px;">
                            <p><i class="icon-list"></i><g:link controller="userSocio" action="rankings" params="[usarFechas: Boolean.TRUE, inicioDeSemana: Boolean.TRUE, hasta: hoy, sort: 'cantVisitas', order: 'desc', sufijoTitulo: 'de esta semana']"> Esta Semana</g:link></p>
                            <p><i class="icon-list"></i><g:link controller="userSocio" action="rankings" params="[usarFechas: Boolean.TRUE, inicioDeMes: Boolean.TRUE, hasta: hoy, sort: 'cantVisitas', order: 'desc', sufijoTitulo: 'de este mes']"> Este Mes</g:link></p>
                            <p><i class="icon-list"></i><g:link controller="userSocio" action="rankings" params="[usarFechas: Boolean.TRUE, inicioDeAnio: Boolean.TRUE, hasta: hoy, sort: 'cantVisitas', order: 'desc', sufijoTitulo: 'de este año']"> Este Año</g:link></p>
                            <p><i class="icon-list"></i><g:link controller="userSocio" action="rankings" params="[usarFechas: Boolean.TRUE, desde: semanaPasada, hasta: hoy, sort: 'cantVisitas', order: 'desc']"> Por Rango de Fechas</g:link></p>
                            <p><i class="icon-list"></i><g:link controller="userSocio" action="rankings" params="[usarFechas: Boolean.FALSE, desde: semanaPasada, hasta: hoy, sort: 'cantVisitas', order: 'desc', sufijoTitulo: 'Histórico']"> Histórico</g:link></p>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <p>Módulo de gestión del personal del gimnasio. Use las distintas opciones en el listado para gestionar
                los datos de los clientes, entre ellos enlistar, enrolar, editar y eliminar.
                </p>
            </div>
	    </div>
	</section>


<section id="info2">
    <div class="row-fluid">

        <div class="span4">
            <h3 class="center">Instructores y Personal</h3>
            <p/>
            <table>
                <tbody>
                <tr>
                    <td>
                        %{--<div class="center">--}%
                        <g:link controller="userPersonalInstructor" action="list" title="Listar instructores"><img class="frontpageImage" src="${resource(dir: 'images/icons',file: 'instructorYpersonal.png')}" /></g:link>
                    %{--</div>--}%
                    </td>
                    <td style="vertical-align: top; font-size: 16px;">
                        <p><i class="icon-list"></i><g:link controller="userPersonalInstructor" action="list"> Listar instructores</g:link></p>
                        <p><i class="icon-plus-sign"></i><g:link controller="userPersonalInstructor" action="create"> Crear instructores</g:link></p>
                        <p><i class="icon-list"></i><g:link controller="userPersonal" action="list"> Listar personal</g:link></p>
                        <p><i class="icon-plus-sign"></i><g:link controller="userPersonal" action="create"> Crear personal</g:link></p>
                        %{--<p><g:link controller="userPersonalInstructor" action="delete">Eliminar instructores</g:link></p>--}%
                    </td>
                </tr>
                </tbody>
            </table>
            <p>Módulo de gestión de instructores del gimnasio. Use las distintas opciones en el listado para gestionar
            los datos de los clientes, entre ellos enlistar, enrolar, editar y eliminar.
            </p>
        </div>

        <div class="span4">
            <h3 class="center">Gestión de Ingresos</h3>
            <p/>
            <table>
                <tbody>
                <tr>
                    <td>
                        <div class="center">

                            <img class="frontpageImage" src="${resource(dir: 'images/icons',file: 'empresa.png')}" />
                        </div>

                    </td>
                    <td style="vertical-align: top; font-size: 16px;">
                        <p><i class="icon-list"></i><g:link controller="producto" action="list"> Productos</g:link></p>
                        <p><i class="icon-list"></i><g:link controller="categoria" action="list"> Categorías</g:link></p>
                        %{--<p><i class="icon-list"></i><g:link controller="subCategoria" action="list"> SubCategorías</g:link></p>--}%
                        <p><i class="icon-list"></i><g:link controller="descuento" action="list"> Descuentos</g:link></p>
                        <p><i class="icon-list"></i><g:link controller="boleta" action="list"> Boletas</g:link></p>
                    </td>
                </tr>
                </tbody>
            </table>
            <p>Módulo de gestión de usuarios/clientes del gimnasio. Use las distintas opciones en el listado para gestionar
            los datos de los clientes, entre ellos enlistar, enrolar, editar y eliminar.
            </p>
        </div>

        <div class="span4">
            <h3 class="center">Herramientas</h3>
            <p/>
            <table>
                <tbody>
                <tr>
                    <td>
                        <div class="center">

                            <img class="frontpageImage" src="${resource(dir: 'images/icons',file: 'herramientas.png')}" />
                        </div>

                    </td>
                    <td style="vertical-align: top; font-size: 16px;">
                        <p><i class="icon-info-sign"></i><g:link controller="cargoInterno" action="list"> Cargos</g:link></p>
                        <p><i class="icon-info-sign"></i><g:link controller="plan" action="list"> Planes</g:link></p>
                        %{--<p><i class="icon-info-sign"></i><g:link controller="medioPago" action="list"> Medios de Pago</g:link></p>--}%
                        <p><i class="icon-info-sign"></i><g:link controller="ciudad" action="list"> Ciudades</g:link></p>
                        <p><i class="icon-info-sign"></i><g:link controller="sector" action="list"> Sectores</g:link></p>
                        <p><i class="icon-list"></i><g:link controller="empresa" action="list"> Gestionar Convenios</g:link></p>
                        <p><i class="icon-info-sign"></i><g:link controller="logCambiosDeEstado" action="list"> Log Cambios de Estado</g:link></p>
                        <p><i class="icon-info-sign"></i><g:link controller="configuracion" action="ip"> Configurar IP</g:link></p>
                    </td>
                </tr>
                </tbody>
            </table>
            <p>Módulo de gestión del personal del gimnasio. Use las distintas opciones en el listado para gestionar
            los datos de los clientes, entre ellos enlistar, enrolar, editar y eliminar.
            </p>
        </div>
    </div>
</section>



	%{--<section id="info2">
		<div class="row-fluid">
	    	<div class="span4">
		    	<div class="center">
					<img class="" src="${resource(plugin: 'kickstart-with-bootstrap', dir: 'images/frontpage',file: 'Datepicker.png')}" />
					<h3>Datepicker</h3>
				</div>
				<p>Kickstart uses the <a href ="https://github.com/eternicode/bootstrap-datepicker">Datepicker for Bootstrap</a> by Stefan Petre and Andrew Rowls</p>
			</div>
	    	<div class="span4">
		    	<div class="center">
					<img class="" src="${resource(plugin: 'kickstart-with-bootstrap', dir: 'images/frontpage',file: 'flags_preview_large.png')}" />
					<h3>Language Selector</h3>
				</div>
				<p>Kickstart contains a language selector that uses the <a href="http://www.famfamfam.com/lab/icons/flags/">FamFamFam flag icons</a> by Mark James.
				It automatically detects which languages are available and offers them in a dropdown menu.</p>
			</div>
	    	<div class="span4">
		    	<div class="center">
					<img class="frontpageImage" src="${resource(plugin: 'kickstart-with-bootstrap', dir: 'images/frontpage',file: 'browser_logos.png')}" />
					<h3>Browser support</h3>
				</div>
				<p>Bootstrap is tested and supported in major modern browsers like Chrome 14, Safari 5+, Opera 11, Internet Explorer 7, and Firefox 5.</p>
			</div>
	    </div>
	</section>

	<section id="info3">
		<div class="row">
	    	<div class="span4">
		    	<div class="center">
					<h3>Other Features</h3>
				</div>
				<p>Kickstart contains several pages as starting points for the average website such as an About Page, Contact Page, 404, etc.</p>
			</div>
	    	<div class="span4">
		    	<div class="center">
					<h3>Usage</h3>
				</div>
				<p>After installation you can call the script "grails
					kickstartWithBootstrap" which will copy some files into your
					project. It will overwrite only few files (e.g., in conf, src, and
					views) - <b>you should use it only on fresh new Grails projects</b>.
				</p>
			</div>
	    	<div class="span4">
		    	<div class="center">
					<h3>Notes</h3>
				</div>
				<p></p>
				<ul>
					<li>Currently, Kickstart works with Grails 2.x!</li>
					<li>Kickstart does NOT use the Bootstrap plugin.</li>
					<li>I18N is only available for English and German!</li>
				</ul>
			</div>
<%--	    	<div class="span4">--%>
<%--		    	<div class="center">--%>
<%--					<h3>Terms of Use</h3>--%>
<%--				</div>--%>
<%--				<p></p>--%>
<%--				<ul>--%>
<%--					<li>Bootstrap (from Twitter): Code licensed under the Apache--%>
<%--						License v2.0. Documentation licensed under CC BY 3.0.--%>
<%--						(<a href="http://twitter.com/TwBootstrap">@TwBootstrap</a> , <a href="http://twitter.github.com/bootstrap/">http://twitter.github.com/bootstrap/</a>)</li>--%>
<%--					<li>Kickstart Plugins: Code licensed under the Apache License--%>
<%--						v2.0. Documentation licensed under CC BY 3.0. Copyright 2011 Jörg--%>
<%--						Rech (<a href="http://twitter.com/JoergRech">@JoergRech</a>, <a href="http://joerg-rech.com">http://joerg-rech.com</a>)</li>--%>
<%--				</ul>--%>
<%--			</div>--%>
	    </div>

	</section>--}%

</body>

</html>
