<%@ page import="org.gym.DireccionEmpresa" %>



<div class="control-group fieldcontain ${hasErrors(bean: direccionEmpresaInstance, field: 'calleEmpresa', 'error')} ">
    <label for="calleEmpresa" class="control-label"><g:message code="direccionEmpresa.calleEmpresa.label" default="Calle Empresa" /></label>
    <div class="controls">
        <g:textField name="calleEmpresa" value="${userSocioInstance?.empresa?.calleEmpresa}"/>
        <span class="help-inline">${hasErrors(bean: direccionEmpresaInstance, field: 'calleEmpresa', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: direccionEmpresaInstance, field: 'numeroEmpresa', 'error')} ">
    <label for="numeroEmpresa" class="control-label"><g:message code="direccionEmpresa.numeroEmpresa.label" default="Numero Empresa" /></label>
    <div class="controls">
        <g:field type="number" name="numeroEmpresa" value="${userSocioInstance?.empresa?.numeroEmpresa}"/>
        <span class="help-inline">${hasErrors(bean: direccionEmpresaInstance, field: 'numeroEmpresa', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: direccionEmpresaInstance, field: 'oficinaEmpresa', 'error')} ">
    <label for="oficinaEmpresa" class="control-label"><g:message code="direccionEmpresa.oficinaEmpresa.label" default="Oficina Empresa" /></label>
    <div class="controls">
        <g:textField name="oficinaEmpresa" value="${userSocioInstance?.empresa?.oficinaEmpresa}"/>
        <span class="help-inline">${hasErrors(bean: direccionEmpresaInstance, field: 'oficinaEmpresa', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: direccionEmpresaInstance, field: 'sectorEmpresa', 'error')} ">
    <label for="sectorEmpresa" class="control-label"><g:message code="direccionEmpresa.sectorEmpresa.label" default="Sector Empresa" /></label>
    <div class="controls">
        <g:select id="sectorEmpresa" name="sectorEmpresa.id" from="${org.gym.ubicacion.Sector.list()}" optionKey="id" value="${userSocioInstance?.empresa?.sectorEmpresa?.id}" class="many-to-one" noSelection="['null': '']"/>
        <span class="help-inline">${hasErrors(bean: direccionEmpresaInstance, field: 'sectorEmpresa', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: direccionEmpresaInstance, field: 'ciudadEmpresa', 'error')} ">
    <label for="ciudadEmpresa" class="control-label"><g:message code="direccionEmpresa.ciudadEmpresa.label" default="Ciudad Empresa" /></label>
    <div class="controls">
        <g:select id="ciudadEmpresa" name="ciudadEmpresa.id" from="${org.gym.ubicacion.Ciudad.list()}" optionKey="id" value="${userSocioInstance?.empresa?.ciudadEmpresa?.id}" class="many-to-one" noSelection="['null': '']"/>
        <span class="help-inline">${hasErrors(bean: direccionEmpresaInstance, field: 'ciudadEmpresa', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: direccionEmpresaInstance, field: 'codigoPostalEmpresa', 'error')} ">
    <label for="codigoPostalEmpresa" class="control-label"><g:message code="direccionEmpresa.codigoPostalEmpresa.label" default="Codigo Postal Empresa" /></label>
    <div class="controls">
        <g:field type="number" name="codigoPostalEmpresa" value="${userSocioInstance?.empresa?.codigoPostalEmpresa}"/>
        <span class="help-inline">${hasErrors(bean: direccionEmpresaInstance, field: 'codigoPostalEmpresa', 'error')}</span>
    </div>
</div>
