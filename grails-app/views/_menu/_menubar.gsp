<div class="">
	<ul class="nav nav-tabs" data-role="listview" data-split-icon="gear" data-filter="true">
	
		%{--<g:each status="i" var="c" in="${grailsApplication.controllerClasses.sort { it.logicalPropertyName } }">
			<li class="controller${params.controller == c.logicalPropertyName ? " active" : ""}">
				<g:link controller="${c.logicalPropertyName}" action="index">
					<g:message code="${c.logicalPropertyName}.label" default="${c.logicalPropertyName.capitalize()}"/>
				</g:link>
			</li>
		</g:each>--}%
        <li class="controller${params.controller == "userSocio" ? " active" : ""}">             <g:link controller="userSocio" action="index">              <g:message code="userSocio.label" default="Socios"/></g:link></li>
        <li class="controller${params.controller == "visita" ? " active" : ""}">                <g:link controller="visita" action="index">                 <g:message code="visita.label" default="Asistencias"/></g:link></li>
        <li class="controller${params.controller == "userPersonalInstructor" ? " active" : ""}"><g:link controller="userPersonalInstructor" action="index"> <g:message code="userPersonalInstructor.label" default="Instructores"/></g:link></li>
        <li class="controller${params.controller == "userPersonal" ? " active" : ""}">          <g:link controller="userPersonal" action="index">           <g:message code="userPersonal.label" default="Personal"/></g:link></li>
        <li class="controller${params.controller == "historialMembresias" ? " active" : ""}">   <g:link controller="historialMembresias" action="index">    <g:message code="historialMembresias.label" default="Membresías"/></g:link></li>
        %{--<li class="controller${params.controller == "empresa" ? " active" : ""}">               <g:link controller="empresa" action="index">                <g:message code="empresa.label" default="Empresa"/></g:link></li>--}%
        <li class="controller${params.controller == "cargoInterno" ? " active" : ""}">          <g:link controller="cargoInterno" action="index">           <g:message code="cargoInterno.label" default="Cargos"/></g:link></li>
        <li class="controller${params.controller == "plan" ? " active" : ""}">                  <g:link controller="plan" action="index">                   <g:message code="plan.label" default="Planes"/></g:link></li>
        <li class="controller${params.controller == "medioPago" ? " active" : ""}">             <g:link controller="medioPago" action="index">              <g:message code="medioPago.label" default="Medios de Pago"/></g:link></li>
        <li class="controller${params.controller == "ciudad" ? " active" : ""}">                <g:link controller="ciudad" action="index">                 <g:message code="ciudad.label" default="Ciudades"/></g:link></li>
        <li class="controller${params.controller == "sector" ? " active" : ""}">                <g:link controller="sector" action="index">                 <g:message code="sector.label" default="Sectores"/></g:link></li>
           %{-- <g:link controller="userSocio" action="list"                >Socios</g:link>
            <g:link controller="userPersonalInstructor" action="list"   >| Instructores</g:link>
            <g:link controller="userPersonal" action="list"             >| Personal</g:link>
            <g:link controller="empresa" action="list"                  >| Empresas</g:link>
            <g:link controller="cargoInterno" action="list"             >| Cargos</g:link>
            <g:link controller="plan" action="list"                     >| Planes</g:link>
            <g:link controller="medioPago" action="list"                >| Medios de Pago</g:link>
            <g:link controller="ciudad" action="list"                   >| Ciudad</g:link>
            <g:link controller="sector" action="list"                   >| Sector</g:link>--}%

	</ul>
</div>
