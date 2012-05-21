<%@ page import="com.gyro.adn.domain.Municipio" %>



<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'nombreCorto', 'error')} required">
	<label for="nombreCorto">
		<g:message code="municipio.nombreCorto.label" default="Nombre Corto" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreCorto" required="" value="${municipioInstance?.nombreCorto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'nombreCompleto', 'error')} ">
	<label for="nombreCompleto">
		<g:message code="municipio.nombreCompleto.label" default="Nombre Completo" />
		
	</label>
	<g:textField name="nombreCompleto" value="${municipioInstance?.nombreCompleto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="municipio.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estado" name="estado.id" from="${com.gyro.adn.domain.Estado.list()}" optionKey="id" required="" value="${municipioInstance?.estado?.id}" class="many-to-one"/>
</div>

