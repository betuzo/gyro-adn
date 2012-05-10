
<%@ page import="com.gyro.adn.domain.Archivo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'archivo.label', default: 'Archivo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-archivo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-archivo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list archivo">
			
				<g:if test="${archivoInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="archivo.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${archivoInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${archivoInstance?.ruta}">
				<li class="fieldcontain">
					<span id="ruta-label" class="property-label"><g:message code="archivo.ruta.label" default="Ruta" /></span>
					
						<span class="property-value" aria-labelledby="ruta-label"><g:fieldValue bean="${archivoInstance}" field="ruta"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${archivoInstance?.campania}">
				<li class="fieldcontain">
					<span id="campania-label" class="property-label"><g:message code="archivo.campania.label" default="Campania" /></span>
					
						<span class="property-value" aria-labelledby="campania-label"><g:link controller="campania" action="show" id="${archivoInstance?.campania?.id}">${archivoInstance?.campania?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${archivoInstance?.id}" />
					<g:link class="edit" action="edit" id="${archivoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
