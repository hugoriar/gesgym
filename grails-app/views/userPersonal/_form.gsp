<%@ page import="org.control.UserPersonal" %>

<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstance, field: 'username', 'error')} ">
    <label for="username" class="control-label"><g:message code="userPersonalInstructor.username.label" default="Username" /></label>
    <div class="controls">
        <g:textField name="username" value="${userPersonalInstance?.username}"/>
        <span class="help-inline">${hasErrors(bean: userPersonalInstance, field: 'username', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstance, field: 'password', 'error')} ">
    <label for="password" class="control-label"><g:message code="userPersonalInstructor.password.label" default="Password" /></label>
    <div class="controls">
        <g:field type="password" name="password" value="${userPersonalInstance?.password}"/>
        <span class="help-inline">${hasErrors(bean: userPersonalInstance, field: 'password', 'error')}</span>
    </div>
</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstance, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"><g:message code="userPersonal.nombre.label" default="Nombre" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="nombre" required="" value="${userPersonalInstance?.nombre}"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstance, field: 'nombre', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstance, field: 'apellidoPaterno', 'error')} required">
				<label for="apellidoPaterno" class="control-label"><g:message code="userPersonal.apellidoPaterno.label" default="Apellido Paterno" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="apellidoPaterno" required="" value="${userPersonalInstance?.apellidoPaterno}"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstance, field: 'apellidoPaterno', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstance, field: 'apellidoMaterno', 'error')} required">
				<label for="apellidoMaterno" class="control-label"><g:message code="userPersonal.apellidoMaterno.label" default="Apellido Materno" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="apellidoMaterno" required="" value="${userPersonalInstance?.apellidoMaterno}"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstance, field: 'apellidoMaterno', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstance, field: 'rut', 'error')} required">
				<label for="rut" class="control-label"><g:message code="userPersonal.rut.label" default="Rut" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="rut" required="" value="${userPersonalInstance?.rut}"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstance, field: 'rut', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstance, field: 'dv', 'error')} required">
				<label for="dv" class="control-label"><g:message code="userPersonal.dv.label" default="Dv" /><span class="required-indicator">*</span></label>
				<div class="controls">
                    <g:textField name="dv" required="" value="${userPersonalInstance?.dv}"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstance, field: 'dv', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstance, field: 'foto', 'error')} ">
				<label for="foto" class="control-label"><g:message code="userPersonal.foto.label" default="Foto" /></label>
				<div class="controls">
					<input type="file" id="foto" name="foto" />
					<span class="help-inline">${hasErrors(bean: userPersonalInstance, field: 'foto', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstance, field: 'fechaNacimiento', 'error')} required">
				<label for="fechaNacimiento" class="control-label"><g:message code="userPersonal.fechaNacimiento.label" default="Fecha Nacimiento" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="fechaNacimiento" precision="day"  value="${userPersonalInstance?.fechaNacimiento}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: userPersonalInstance, field: 'fechaNacimiento', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstance, field: 'sexo', 'error')} required">
				<label for="sexo" class="control-label"><g:message code="userPersonal.sexo.label" default="Sexo" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="sexo" name="sexo.id" from="${org.control.Sexo.list()}" optionKey="id" required="" value="${userPersonalInstance?.sexo?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstance, field: 'sexo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstance, field: 'fono', 'error')} ">
				<label for="fono" class="control-label"><g:message code="userPersonal.fono.label" default="Fono" /></label>
				<div class="controls">
					<g:field type="number" name="fono" value="${userPersonalInstance?.fono}"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstance, field: 'fono', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstance, field: 'fonoCelular', 'error')} required">
				<label for="fonoCelular" class="control-label"><g:message code="userPersonal.fonoCelular.label" default="Fono Celular" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="fonoCelular" required="" value="${userPersonalInstance?.fonoCelular}"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstance, field: 'fonoCelular', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstance, field: 'fonoTrabajo', 'error')} ">
				<label for="fonoTrabajo" class="control-label"><g:message code="userPersonal.fonoTrabajo.label" default="Fono Trabajo" /></label>
				<div class="controls">
					<g:field type="number" name="fonoTrabajo" value="${userPersonalInstance?.fonoTrabajo}"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstance, field: 'fonoTrabajo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstance, field: 'email', 'error')} required">
				<label for="email" class="control-label"><g:message code="userPersonal.email.label" default="Email" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="email" name="email" required="" value="${userPersonalInstance?.email}"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstance, field: 'email', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userPersonalInstance, field: 'cargo', 'error')} required">
				<label for="cargo" class="control-label"><g:message code="userPersonal.cargo.label" default="Cargo" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="cargo" name="cargo.id" from="${org.control.CargoInterno.list()}" optionKey="id" required="" value="${userPersonalInstance?.cargo?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: userPersonalInstance, field: 'cargo', 'error')}</span>
				</div>
			</div>

<fieldset class="form">
    <legend>Dirección</legend>
    <g:render template="/direccionUsuario/form"/>
</fieldset>

<fieldset class="form">
    <legend>Contacto de Emergencia</legend>
    <g:render template="/contactoEmergencia/form"/>
</fieldset>

<fieldset class="form">
    <legend>Condición Médica</legend>
    <g:render template="/condicionMedica/form"/>
</fieldset>
