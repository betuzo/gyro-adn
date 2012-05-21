<%@ page import="com.gyro.adn.domain.CompaniaClasificacion" %>



<div class="fieldcontain ${hasErrors(bean: companiaClasificacionInstance, field: 'clasificacion', 'error')} ">
	<label for="clasificacion">
		<g:message code="companiaClasificacion.clasificacion.label" default="Clasificacion" />
		
	</label>
	<g:textField name="clasificacion" value="${companiaClasificacionInstance?.clasificacion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaClasificacionInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="companiaClasificacion.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${companiaClasificacionInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaClasificacionInstance, field: 'subclasificaciones', 'error')} ">
	<label for="subclasificaciones">
		<g:message code="companiaClasificacion.subclasificaciones.label" default="Subclasificaciones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${companiaClasificacionInstance?.subclasificaciones?}" var="s">
    <li><g:link controller="companiaSubclasificacion" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="companiaSubclasificacion" action="create" params="['companiaClasificacion.id': companiaClasificacionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'companiaSubclasificacion.label', default: 'CompaniaSubclasificacion')])}</g:link>
</li>
</ul>

</div>

