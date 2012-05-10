<%@ page import="com.gyro.adn.domain.TelefonoContacto" %>



<div class="fieldcontain ${hasErrors(bean: telefonoContactoInstance, field: 'telefono', 'error')} required">
	<label for="telefono">
		<g:message code="telefonoContacto.telefono.label" default="Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefono" required="" value="${telefonoContactoInstance?.telefono}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoContactoInstance, field: 'extension', 'error')} ">
	<label for="extension">
		<g:message code="telefonoContacto.extension.label" default="Extension" />
		
	</label>
	<g:textField name="extension" value="${telefonoContactoInstance?.extension}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoContactoInstance, field: 'tipoTelefono', 'error')} ">
	<label for="tipoTelefono">
		<g:message code="telefonoContacto.tipoTelefono.label" default="Tipo Telefono" />
		
	</label>
	<g:select name="tipoTelefono" from="${telefonoContactoInstance.constraints.tipoTelefono.inList}" value="${telefonoContactoInstance?.tipoTelefono}" valueMessagePrefix="telefonoContacto.tipoTelefono" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoContactoInstance, field: 'companiaContacto', 'error')} required">
	<label for="companiaContacto">
		<g:message code="telefonoContacto.companiaContacto.label" default="Compania Contacto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="companiaContacto" name="companiaContacto.id" from="${com.gyro.adn.domain.CompaniaContacto.list()}" optionKey="id" required="" value="${telefonoContactoInstance?.companiaContacto?.id}" class="many-to-one"/>
</div>

