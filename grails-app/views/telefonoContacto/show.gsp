
<%@ page import="com.gyro.adn.domain.TelefonoContacto" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'telefonoContacto.label', default: 'TelefonoContacto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-telefonoContacto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-telefonoContacto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list telefonoContacto">
			
				<g:if test="${telefonoContactoInstance?.telefono}">
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="telefonoContacto.telefono.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${telefonoContactoInstance}" field="telefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${telefonoContactoInstance?.extension}">
				<li class="fieldcontain">
					<span id="extension-label" class="property-label"><g:message code="telefonoContacto.extension.label" default="Extension" /></span>
					
						<span class="property-value" aria-labelledby="extension-label"><g:fieldValue bean="${telefonoContactoInstance}" field="extension"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${telefonoContactoInstance?.tipoTelefono}">
				<li class="fieldcontain">
					<span id="tipoTelefono-label" class="property-label"><g:message code="telefonoContacto.tipoTelefono.label" default="Tipo Telefono" /></span>
					
						<span class="property-value" aria-labelledby="tipoTelefono-label"><g:fieldValue bean="${telefonoContactoInstance}" field="tipoTelefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${telefonoContactoInstance?.companiaContacto}">
				<li class="fieldcontain">
					<span id="companiaContacto-label" class="property-label"><g:message code="telefonoContacto.companiaContacto.label" default="Compania Contacto" /></span>
					
						<span class="property-value" aria-labelledby="companiaContacto-label"><g:link controller="companiaContacto" action="show" id="${telefonoContactoInstance?.companiaContacto?.id}">${telefonoContactoInstance?.companiaContacto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${telefonoContactoInstance?.id}" />
					<g:link class="edit" action="edit" id="${telefonoContactoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
