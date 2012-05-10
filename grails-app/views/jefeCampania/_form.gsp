<%@ page import="com.gyro.adn.domain.JefeCampania" %>



<div class="fieldcontain ${hasErrors(bean: jefeCampaniaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="jefeCampania.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${jefeCampaniaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: jefeCampaniaInstance, field: 'apellidoPaterno', 'error')} required">
	<label for="apellidoPaterno">
		<g:message code="jefeCampania.apellidoPaterno.label" default="Apellido Paterno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellidoPaterno" required="" value="${jefeCampaniaInstance?.apellidoPaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: jefeCampaniaInstance, field: 'apellidoMaterno', 'error')} ">
	<label for="apellidoMaterno">
		<g:message code="jefeCampania.apellidoMaterno.label" default="Apellido Materno" />
		
	</label>
	<g:textField name="apellidoMaterno" value="${jefeCampaniaInstance?.apellidoMaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: jefeCampaniaInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="jefeCampania.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${jefeCampaniaInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: jefeCampaniaInstance, field: 'direccion', 'error')} required">
	<label for="direccion">
		<g:message code="jefeCampania.direccion.label" default="Direccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direccion" required="" value="${jefeCampaniaInstance?.direccion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: jefeCampaniaInstance, field: 'codigoPostal', 'error')} required">
	<label for="codigoPostal">
		<g:message code="jefeCampania.codigoPostal.label" default="Codigo Postal" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="codigoPostal" required="" value="${fieldValue(bean: jefeCampaniaInstance, field: 'codigoPostal')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: jefeCampaniaInstance, field: 'municipio', 'error')} required">
	<label for="municipio">
		<g:message code="jefeCampania.municipio.label" default="Municipio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="municipio" name="municipio.id" from="${com.gyro.adn.domain.Municipio.list()}" optionKey="id" required="" value="${jefeCampaniaInstance?.municipio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: jefeCampaniaInstance, field: 'fechaRegistro', 'error')} required">
	<label for="fechaRegistro">
		<g:message code="jefeCampania.fechaRegistro.label" default="Fecha Registro" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaRegistro" precision="day"  value="${jefeCampaniaInstance?.fechaRegistro}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: jefeCampaniaInstance, field: 'campanias', 'error')} ">
	<label for="campanias">
		<g:message code="jefeCampania.campanias.label" default="Campanias" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${jefeCampaniaInstance?.campanias?}" var="c">
    <li><g:link controller="campania" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="campania" action="create" params="['jefeCampania.id': jefeCampaniaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'campania.label', default: 'Campania')])}</g:link>
</li>
</ul>

</div>

