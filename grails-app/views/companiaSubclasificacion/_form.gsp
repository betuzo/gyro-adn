<%@ page import="com.gyro.adn.domain.CompaniaSubclasificacion" %>



<div class="fieldcontain ${hasErrors(bean: companiaSubclasificacionInstance, field: 'subclasificacion', 'error')} required">
	<label for="subclasificacion">
		<g:message code="companiaSubclasificacion.subclasificacion.label" default="Subclasificacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="subclasificacion" required="" value="${companiaSubclasificacionInstance?.subclasificacion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaSubclasificacionInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="companiaSubclasificacion.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${companiaSubclasificacionInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaSubclasificacionInstance, field: 'clasificacion', 'error')} required">
	<label for="clasificacion">
		<g:message code="companiaSubclasificacion.clasificacion.label" default="Clasificacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="clasificacion" name="clasificacion.id" from="${com.gyro.adn.domain.CompaniaClasificacion.list()}" optionKey="id" required="" value="${companiaSubclasificacionInstance?.clasificacion?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaSubclasificacionInstance, field: 'companias', 'error')} ">
	<label for="companias">
		<g:message code="companiaSubclasificacion.companias.label" default="Companias" />
		
	</label>
	
</div>

