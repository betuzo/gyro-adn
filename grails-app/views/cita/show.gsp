
<%@ page import="com.gyro.adn.domain.Cita" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cita.label', default: 'Cita')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cita" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cita" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cita">
			
				<g:if test="${citaInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="cita.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${citaInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${citaInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="cita.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${citaInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${citaInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="cita.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${citaInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${citaInstance?.codigoPostal}">
				<li class="fieldcontain">
					<span id="codigoPostal-label" class="property-label"><g:message code="cita.codigoPostal.label" default="Codigo Postal" /></span>
					
						<span class="property-value" aria-labelledby="codigoPostal-label"><g:fieldValue bean="${citaInstance}" field="codigoPostal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${citaInstance?.municipio?.estado?.pais}">
				<li class="fieldcontain">
					<span id="pais-label" class="property-label"><g:message code="cita.pais.label" default="Pais" /></span>
					
						<span class="property-value" aria-labelledby="pais-label"><g:link controller="pais" action="show" id="${citaInstance?.municipio?.estado?.pais?.id}">${citaInstance?.municipio?.estado?.pais?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>

				<g:if test="${citaInstance?.municipio?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="cita.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:link controller="estado" action="show" id="${citaInstance?.municipio?.estado?.id}">${citaInstance?.municipio?.estado?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>

				<g:if test="${citaInstance?.municipio}">
				<li class="fieldcontain">
					<span id="municipio-label" class="property-label"><g:message code="cita.municipio.label" default="Municipio" /></span>
					
						<span class="property-value" aria-labelledby="municipio-label"><g:link controller="municipio" action="show" id="${citaInstance?.municipio?.id}">${citaInstance?.municipio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${citaInstance?.campania}">
				<li class="fieldcontain">
					<span id="campania-label" class="property-label"><g:message code="cita.campania.label" default="Campania" /></span>
					
						<span class="property-value" aria-labelledby="campania-label"><g:link controller="campania" action="show" id="${citaInstance?.campania?.id}">${citaInstance?.campania?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${citaInstance?.id}" />
					<g:link class="edit" action="edit" id="${citaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
