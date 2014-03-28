<%@ page import="org.gym.ventas.Proveedor" %>



			<div class="control-group fieldcontain ${hasErrors(bean: proveedorInstance, field: 'nombreEmpresa', 'error')} ">
				<label for="nombreEmpresa" class="control-label"><g:message code="proveedor.nombreEmpresa.label" default="Nombre Empresa" /></label>
				<div class="controls">
					<g:textField name="nombreEmpresa" value="${proveedorInstance?.nombreEmpresa}"/>
					<span class="help-inline">${hasErrors(bean: proveedorInstance, field: 'nombreEmpresa', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: proveedorInstance, field: 'direccionEmpresa', 'error')} ">
				<label for="direccionEmpresa" class="control-label"><g:message code="proveedor.direccionEmpresa.label" default="Direccion Empresa" /></label>
				<div class="controls">
					<g:select id="direccionEmpresa" name="direccionEmpresa.id" from="${org.gym.DireccionEmpresa.list()}" optionKey="id" value="${proveedorInstance?.direccionEmpresa?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: proveedorInstance, field: 'direccionEmpresa', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: proveedorInstance, field: 'fonoEmpresa', 'error')} ">
				<label for="fonoEmpresa" class="control-label"><g:message code="proveedor.fonoEmpresa.label" default="Fono Empresa" /></label>
				<div class="controls">
					<g:textField name="fonoEmpresa" value="${proveedorInstance?.fonoEmpresa}"/>
					<span class="help-inline">${hasErrors(bean: proveedorInstance, field: 'fonoEmpresa', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: proveedorInstance, field: 'descripcion', 'error')} ">
				<label for="descripcion" class="control-label"><g:message code="proveedor.descripcion.label" default="Descripcion" /></label>
				<div class="controls">
					<g:textArea name="descripcion" cols="40" rows="5" maxlength="1500" value="${proveedorInstance?.descripcion}"/>
					<span class="help-inline">${hasErrors(bean: proveedorInstance, field: 'descripcion', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: proveedorInstance, field: 'rut', 'error')} required">
				<label for="rut" class="control-label"><g:message code="proveedor.rut.label" default="Rut" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="rut" required="" value="${proveedorInstance.rut}"/>
					<span class="help-inline">${hasErrors(bean: proveedorInstance, field: 'rut', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: proveedorInstance, field: 'dv', 'error')} required">
				<label for="dv" class="control-label"><g:message code="proveedor.dv.label" default="Dv" /><span class="required-indicator">*</span></label>
				<div class="controls">
					
					<span class="help-inline">${hasErrors(bean: proveedorInstance, field: 'dv', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: proveedorInstance, field: 'logo', 'error')} ">
				<label for="logo" class="control-label"><g:message code="proveedor.logo.label" default="Logo" /></label>
				<div class="controls">
					<input type="file" id="logo" name="logo" />
					<span class="help-inline">${hasErrors(bean: proveedorInstance, field: 'logo', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: proveedorInstance, field: 'email', 'error')} ">
				<label for="email" class="control-label"><g:message code="proveedor.email.label" default="Email" /></label>
				<div class="controls">
					<g:field type="email" name="email" value="${proveedorInstance?.email}"/>
					<span class="help-inline">${hasErrors(bean: proveedorInstance, field: 'email', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: proveedorInstance, field: 'contacto', 'error')} required">
				<label for="contacto" class="control-label"><g:message code="proveedor.contacto.label" default="Contacto" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="contacto" name="contacto.id" from="${org.gym.User.list()}" optionKey="id" required="" value="${proveedorInstance?.contacto?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: proveedorInstance, field: 'contacto', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: proveedorInstance, field: 'productos', 'error')} ">
				<label for="productos" class="control-label"><g:message code="proveedor.productos.label" default="Productos" /></label>
				<div class="controls">
					<g:select name="productos" from="${org.gym.ventas.Producto.list()}" multiple="multiple" optionKey="id" size="5" value="${proveedorInstance?.productos*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: proveedorInstance, field: 'productos', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: proveedorInstance, field: 'usuarios', 'error')} ">
				<label for="usuarios" class="control-label"><g:message code="proveedor.usuarios.label" default="Usuarios" /></label>
				<div class="controls">
					<g:select name="usuarios" from="${org.gym.User.list()}" multiple="multiple" optionKey="id" size="5" value="${proveedorInstance?.usuarios*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: proveedorInstance, field: 'usuarios', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: proveedorInstance, field: 'variantesProductos', 'error')} ">
				<label for="variantesProductos" class="control-label"><g:message code="proveedor.variantesProductos.label" default="Variantes Productos" /></label>
				<div class="controls">
					<g:select name="variantesProductos" from="${org.gym.ventas.Variante.list()}" multiple="multiple" optionKey="id" size="5" value="${proveedorInstance?.variantesProductos*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: proveedorInstance, field: 'variantesProductos', 'error')}</span>
				</div>
			</div>

