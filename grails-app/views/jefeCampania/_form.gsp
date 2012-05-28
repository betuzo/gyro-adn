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

<div class="fieldcontain ${hasErrors(bean: jefeCampaniaInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="jefeCampania.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="username" name="username" required="" value="${jefeCampaniaInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: jefeCampaniaInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="jefeCampania.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${jefeCampaniaInstance?.password}"/>
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

<div class="fieldcontain ${hasErrors(bean: jefeCampaniaInstance, field: 'municipio.estado.pais', 'error')} required">
	<label for="pais">
		<g:message code="jefeCampania.pais.label" default="Pais" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pais" name="municipio.estado.pais.id" from="${com.gyro.adn.domain.Pais.list()}" optionKey="id" required="" value="${jefeCampaniaInstance?.municipio?.estado?.pais?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: jefeCampaniaInstance, field: 'municipio.estado', 'error')} required">
	<label for="estado">
		<g:message code="jefeCampania.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estado" name="municipio.estado.id" from="${jefeCampaniaInstance?.municipio?.estado?.pais?.estados}" optionKey="id" required="" value="${jefeCampaniaInstance?.municipio?.estado?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: jefeCampaniaInstance, field: 'municipio', 'error')} required">
	<label for="municipio">
		<g:message code="jefeCampania.municipio.label" default="Municipio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="municipio" name="municipio.id" from="${jefeCampaniaInstance?.municipio?.estado?.municipios}" optionKey="id" required="" value="${jefeCampaniaInstance?.municipio?.id}" class="many-to-one"/>
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

