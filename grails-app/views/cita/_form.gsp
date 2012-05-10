<%@ page import="com.gyro.adn.domain.Cita" %>



<div class="fieldcontain ${hasErrors(bean: citaInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="cita.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${citaInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: citaInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="cita.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${citaInstance?.fecha}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: citaInstance, field: 'direccion', 'error')} required">
	<label for="direccion">
		<g:message code="cita.direccion.label" default="Direccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direccion" required="" value="${citaInstance?.direccion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: citaInstance, field: 'codigoPostal', 'error')} required">
	<label for="codigoPostal">
		<g:message code="cita.codigoPostal.label" default="Codigo Postal" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigoPostal" required="" value="${citaInstance?.codigoPostal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: citaInstance, field: 'municipio', 'error')} required">
	<label for="municipio">
		<g:message code="cita.municipio.label" default="Municipio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="municipio" name="municipio.id" from="${com.gyro.adn.domain.Municipio.list()}" optionKey="id" required="" value="${citaInstance?.municipio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: citaInstance, field: 'campania', 'error')} required">
	<label for="campania">
		<g:message code="cita.campania.label" default="Campania" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="campania" name="campania.id" from="${com.gyro.adn.domain.Campania.list()}" optionKey="id" required="" value="${citaInstance?.campania?.id}" class="many-to-one"/>
</div>

