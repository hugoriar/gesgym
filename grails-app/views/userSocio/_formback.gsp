<%@ page import="org.control.UserSocio" %>



%{--			<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'username', 'error')} ">
				<label for="username" class="control-label"><g:message code="userSocio.username.label" default="Username" /></label>
				<div class="controls">
					<g:textField name="username" value="${userSocioInstance?.username}"/>
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'username', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'password', 'error')} ">
				<label for="password" class="control-label"><g:message code="userSocio.password.label" default="Password" /></label>
				<div class="controls">
					<g:field type="password" name="password" value="${userSocioInstance?.password}"/>
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'password', 'error')}</span>
				</div>
			</div>--}%

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
				<label for="fechaNacimiento" class="control-label"><g:message code="userSocio.fechaNacimiento.label" default="Fecha Nacimiento" /></label>
				<div class="controls">
					<bs:datePicker name="fechaNacimiento" precision="day"  value="${userSocioInstance?.fechaNacimiento}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'fechaNacimiento', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'sexo', 'error')} required">
				<label for="sexo" class="control-label"><g:message code="userSocio.sexo.label" default="Sexo" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="sexo" name="sexo.id" from="${org.control.Sexo.list()}" optionKey="id" required="" value="${userSocioInstance?.sexo?.id}" class="many-to-one"/>
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

			%{--<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'domicilio', 'error')} ">
				<label for="domicilio" class="control-label"><g:message code="userSocio.domicilio.label" default="Domicilio" /></label>
				<div class="controls">
					<g:select id="domicilio" name="domicilio.id" from="${org.control.DireccionUsuario.list()}" optionKey="id" value="${userSocioInstance?.domicilio?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'domicilio', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'condicionMedica', 'error')} ">
				<label for="condicionMedica" class="control-label"><g:message code="userSocio.condicionMedica.label" default="Condicion Medica" /></label>
				<div class="controls">
					<g:select id="condicionMedica" name="condicionMedica.id" from="${org.control.fichaMedica.CondicionMedica.list()}" optionKey="id" value="${userSocioInstance?.condicionMedica?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'condicionMedica', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'contactoEmergencia', 'error')} required">
				<label for="contactoEmergencia" class="control-label"><g:message code="userSocio.contactoEmergencia.label" default="Contacto Emergencia" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="contactoEmergencia" name="contactoEmergencia.id" from="${org.control.ContactoEmergencia.list()}" optionKey="id" required="" value="${userSocioInstance?.contactoEmergencia?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'contactoEmergencia', 'error')}</span>
				</div>
			</div>--}%

			<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'ocupacion', 'error')} required">
				<label for="ocupacion" class="control-label"><g:message code="userSocio.ocupacion.label" default="Ocupacion" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="ocupacion" name="ocupacion.id" from="${org.control.Ocupacion.list()}" optionKey="id" required="" value="${userSocioInstance?.ocupacion?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'ocupacion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'estadoMembresia', 'error')} required">
				<label for="estadoMembresia" class="control-label"><g:message code="userSocio.estadoMembresia.label" default="Estado Membresia" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="estadoMembresia" name="estadoMembresia.id" from="${org.control.EstadoMembresia.list()}" optionKey="id" required="" value="${userSocioInstance?.estadoMembresia?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'estadoMembresia', 'error')}</span>
				</div>
			</div>

			%{--<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'enrolamiento', 'error')} required">
				<label for="enrolamiento" class="control-label"><g:message code="userSocio.enrolamiento.label" default="Matricula" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="enrolamiento" name="enrolamiento.id" from="${org.control.Matriculast()}" optionKey="id" required="" value="${userSocioInstance?.enrolamiento?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'enrolamiento', 'error')}</span>
				</div>
			</div>--}%

			<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'instructor', 'error')} required">
				<label for="instructor" class="control-label"><g:message code="userSocio.instructor.label" default="Instructor" /><span class="required-indicator">*</span></label>
				<div class="controls">
					
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'instructor', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'personalTrainer', 'error')} ">
				<label for="personalTrainer" class="control-label"><g:message code="userSocio.personalTrainer.label" default="Personal Trainer" /></label>
				<div class="controls">
					
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'personalTrainer', 'error')}</span>
				</div>
			</div>

			%{--<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'empresa', 'error')} ">
				<label for="empresa" class="control-label"><g:message code="userSocio.empresa.label" default="Empresa" /></label>
				<div class="controls">
					<g:select id="empresa" name="empresa.id" from="${org.control.Empresa.list()}" optionKey="id" value="${userSocioInstance?.empresa?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'empresa', 'error')}</span>
				</div>
			</div>--}%


<fieldset class="form">
    <legend>Dirección</legend>
    <g:render template="/direccionUsuario/form"/>
</fieldset>

<fieldset class="form">
    <legend>Contacto de Emergencia</legend>
    <g:render template="/contactoEmergencia/form"/>
</fieldset>

<fieldset class="form">
    <legend>Datos de Enrolamiento</legend>
    <g:render template="/enrolamiento/form"/>
</fieldset>

<fieldset class="form">
    <legend>Detalles del Plan</legend>
    <g:render template="/historialMembresias/form"/>
</fieldset>

<fieldset class="form">
    <legend>Empresa</legend>
    <g:render template="/empresa/formEmpresa"/>
</fieldset>

<fieldset class="form">
    <legend>Condición Médica</legend>
    <g:render template="/condicionMedica/form"/>
</fieldset>
