<%@ page import="com.gyro.adn.domain.TelefonoUsuario" %>



<div class="fieldcontain ${hasErrors(bean: telefonoUsuarioInstance, field: 'telefono', 'error')} required">
	<label for="telefono">
		<g:message code="telefonoUsuario.telefono.label" default="Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefono" required="" value="${telefonoUsuarioInstance?.telefono}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoUsuarioInstance, field: 'extension', 'error')} ">
	<label for="extension">
		<g:message code="telefonoUsuario.extension.label" default="Extension" />
		
	</label>
	<g:textField name="extension" value="${telefonoUsuarioInstance?.extension}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoUsuarioInstance, field: 'tipoTelefono', 'error')} ">
	<label for="tipoTelefono">
		<g:message code="telefonoUsuario.tipoTelefono.label" default="Tipo Telefono" />
		
	</label>
	<g:select name="tipoTelefono" from="${telefonoUsuarioInstance.constraints.tipoTelefono.inList}" value="${telefonoUsuarioInstance?.tipoTelefono}" valueMessagePrefix="telefonoUsuario.tipoTelefono" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoUsuarioInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="telefonoUsuario.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${com.gyro.adn.domain.Usuario.list()}" optionKey="id" required="" value="${telefonoUsuarioInstance?.usuario?.id}" class="many-to-one"/>
</div>

