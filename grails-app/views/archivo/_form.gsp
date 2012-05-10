<%@ page import="com.gyro.adn.domain.Archivo" %>



<div class="fieldcontain ${hasErrors(bean: archivoInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="archivo.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${archivoInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: archivoInstance, field: 'ruta', 'error')} required">
	<label for="ruta">
		<g:message code="archivo.ruta.label" default="Ruta" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ruta" required="" value="${archivoInstance?.ruta}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: archivoInstance, field: 'campania', 'error')} required">
	<label for="campania">
		<g:message code="archivo.campania.label" default="Campania" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="campania" name="campania.id" from="${com.gyro.adn.domain.Campania.list()}" optionKey="id" required="" value="${archivoInstance?.campania?.id}" class="many-to-one"/>
</div>

