<%@ page import="org.gym.UserSocio" %>

			<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="userSocio.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" required="" value="${userSocioInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'apellidoPaterno', 'error')} required">
				<label for="apellidoPaterno" class="control-label"><g:message code="userSocio.apellidoPaterno.label" default="Apellido Paterno" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="apellidoPaterno" required="" value="${userSocioInstance?.apellidoPaterno}"/>
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'apellidoPaterno', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'apellidoMaterno', 'error')} required">
				<label for="apellidoMaterno" class="control-label"><g:message code="userSocio.apellidoMaterno.label" default="Apellido Materno" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="apellidoMaterno" required="" value="${userSocioInstance?.apellidoMaterno}"/>
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'apellidoMaterno', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'rut', 'error')} required">
				<label for="rut" class="control-label"><g:message code="userSocio.rut.label" default="Rut" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="rut" required="" value="${userSocioInstance.rut}"/>
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'rut', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'dv', 'error')} required">
				<label for="dv" class="control-label"><g:message code="userSocio.dv.label" default="Dv" /><span class="required-indicator">*</span></label>
				<div class="controls">
                    <g:textField name="dv" required="" value="${userSocioInstance?.dv}"/>
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'dv', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'foto', 'error')} ">
				<label for="foto" class="control-label"><g:message code="userSocio.foto.label" default="Foto" /></label>
				<div class="controls">
					<input type="file" id="foto" name="foto" />
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'foto', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'fechaNacimiento', 'error')} ">
				<label for="fechaNacimiento" class="control-label"><g:message code="userSocio.fechaNacimiento.label" default="Fecha de Nacimiento" /></label>
				<div class="controls">
					<bs:datePicker name="fechaNacimiento" precision="day"  value="${userSocioInstance?.fechaNacimiento}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'fechaNacimiento', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'sexo', 'error')} required">
				<label for="sexo" class="control-label"><g:message code="userSocio.sexo.label" default="Sexo" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="sexo" name="sexo.id" from="${org.gym.Sexo.list()}" optionKey="id" required="" value="${userSocioInstance?.sexo?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'sexo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'fono', 'error')} ">
				<label for="fono" class="control-label"><g:message code="userSocio.fono.label" default="Fono" /></label>
				<div class="controls">
					<g:field type="number" name="fono" value="${userSocioInstance.fono}"/>
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'fono', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'fonoCelular', 'error')} ">
				<label for="fonoCelular" class="control-label"><g:message code="userSocio.fonoCelular.label" default="Fono Celular" /></label>
				<div class="controls">
					<g:field type="number" name="fonoCelular" value="${userSocioInstance.fonoCelular}"/>
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'fonoCelular', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'fonoTrabajo', 'error')} ">
				<label for="fonoTrabajo" class="control-label"><g:message code="userSocio.fonoTrabajo.label" default="Fono Trabajo" /></label>
				<div class="controls">
					<g:field type="number" name="fonoTrabajo" value="${userSocioInstance.fonoTrabajo}"/>
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'fonoTrabajo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'email', 'error')} ">
				<label for="email" class="control-label"><g:message code="userSocio.email.label" default="Email" /></label>
				<div class="controls">
					<g:field type="email" name="email" value="${userSocioInstance?.email}"/>
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'email', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'ocupacion', 'error')} required">
				<label for="ocupacion" class="control-label"><g:message code="userSocio.ocupacion.label" default="Ocupación" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="ocupacion" name="ocupacion.id" from="${org.gym.Ocupacion.list()}" optionKey="id" required="" value="${userSocioInstance?.ocupacion?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'ocupacion', 'error')}</span>
				</div>
			</div>

			%{--<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'historialMembresias', 'error')} ">
				<label for="historialMembresias" class="control-label"><g:message code="userSocio.historialMembresias.label" default="Historial Membresias" /></label>
				<div class="controls">
                    <ul class="one-to-many">
                    <g:each in="${userSocioInstance?.historialMembresias?}" var="h">
                        <li><g:link controller="historialMembresias" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></li>
                    </g:each>
                    <li class="add">
                    <g:link controller="historialMembresias" action="create" params="['userSocio.id': userSocioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'historialMembresias.label', default: 'HistorialMembresias')])}</g:link>
                    </li>
                    </ul>
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'historialMembresias', 'error')}</span>
				</div>
			</div>--}%

			<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'estadoMembresia', 'error')} required">
				<label for="estadoMembresia" class="control-label"><g:message code="userSocio.estadoMembresia.label" default="Estado de Membresía" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="estadoMembresia" name="estadoMembresia.id" from="${org.gym.EstadoMembresia.list()}" optionKey="id" required="" value="${userSocioInstance?.estadoMembresia?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'estadoMembresia', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'instructor', 'error')} required">
				<label for="instructor" class="control-label"><g:message code="userSocio.instructor.label" default="Instructor Asignado" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="instructor" name="instructor.id" from="${org.gym.UserPersonalInstructor.list()}" optionKey="id" required="" value="${userSocioInstance?.instructor?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'instructor', 'error')}</span>
				</div>
			</div>


<fieldset class="form">
    <legend>Domicilio</legend>
    <g:render template="/direccionUsuario/form"/>
</fieldset>

<fieldset class="form">
    <legend>Contacto de Emergencia</legend>
    <g:render template="/contactoEmergencia/form"/>
</fieldset>

<fieldset class="form">
    <legend>Datos de Matrícula</legend>
    <g:render template="/matricula/form"/>
</fieldset>

<fieldset class="form">
    <legend>Detalles del Plan</legend>
    <g:render template="/historialMembresias/form"/>
</fieldset>

<fieldset class="form">
    <legend>Detalles del pago del Plan</legend>
    <g:render template="/pago/form"/>
</fieldset>

<fieldset class="form">
    <legend>Empresa</legend>
    <g:render template="/empresa/form"/>
</fieldset>

<fieldset class="form">
    <legend>Condición Médica</legend>
    <g:render template="/condicionMedica/form"/>
</fieldset>