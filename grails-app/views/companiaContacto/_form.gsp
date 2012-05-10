<%@ page import="com.gyro.adn.domain.CompaniaContacto" %>



<div class="fieldcontain ${hasErrors(bean: companiaContactoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="companiaContacto.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${companiaContactoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaContactoInstance, field: 'apellidoPaterno', 'error')} required">
	<label for="apellidoPaterno">
		<g:message code="companiaContacto.apellidoPaterno.label" default="Apellido Paterno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellidoPaterno" required="" value="${companiaContactoInstance?.apellidoPaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaContactoInstance, field: 'apellidoMaterno', 'error')} ">
	<label for="apellidoMaterno">
		<g:message code="companiaContacto.apellidoMaterno.label" default="Apellido Materno" />
		
	</label>
	<g:textField name="apellidoMaterno" value="${companiaContactoInstance?.apellidoMaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaContactoInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="companiaContacto.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${companiaContactoInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaContactoInstance, field: 'direccion', 'error')} required">
	<label for="direccion">
		<g:message code="companiaContacto.direccion.label" default="Direccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direccion" required="" value="${companiaContactoInstance?.direccion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaContactoInstance, field: 'codigoPostal', 'error')} required">
	<label for="codigoPostal">
		<g:message code="companiaContacto.codigoPostal.label" default="Codigo Postal" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="codigoPostal" required="" value="${fieldValue(bean: companiaContactoInstance, field: 'codigoPostal')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaContactoInstance, field: 'municipio', 'error')} required">
	<label for="municipio">
		<g:message code="companiaContacto.municipio.label" default="Municipio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="municipio" name="municipio.id" from="${com.gyro.adn.domain.Municipio.list()}" optionKey="id" required="" value="${companiaContactoInstance?.municipio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaContactoInstance, field: 'fechaRegistro', 'error')} required">
	<label for="fechaRegistro">
		<g:message code="companiaContacto.fechaRegistro.label" default="Fecha Registro" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaRegistro" precision="day"  value="${companiaContactoInstance?.fechaRegistro}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: companiaContactoInstance, field: 'compania', 'error')} required">
	<label for="compania">
		<g:message code="companiaContacto.compania.label" default="Compania" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="compania" name="compania.id" from="${com.gyro.adn.domain.Compania.list()}" optionKey="id" required="" value="${companiaContactoInstance?.compania?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaContactoInstance, field: 'telefonos', 'error')} ">
	<label for="telefonos">
		<g:message code="companiaContacto.telefonos.label" default="Telefonos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${companiaContactoInstance?.telefonos?}" var="t">
    <li><g:link controller="telefonoContacto" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="telefonoContacto" action="create" params="['companiaContacto.id': companiaContactoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefonoContacto.label', default: 'TelefonoContacto')])}</g:link>
</li>
</ul>

</div>

