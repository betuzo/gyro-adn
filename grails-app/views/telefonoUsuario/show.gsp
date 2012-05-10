
<%@ page import="com.gyro.adn.domain.TelefonoUsuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'telefonoUsuario.label', default: 'TelefonoUsuario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-telefonoUsuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-telefonoUsuario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list telefonoUsuario">
			
				<g:if test="${telefonoUsuarioInstance?.telefono}">
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="telefonoUsuario.telefono.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${telefonoUsuarioInstance}" field="telefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${telefonoUsuarioInstance?.extension}">
				<li class="fieldcontain">
					<span id="extension-label" class="property-label"><g:message code="telefonoUsuario.extension.label" default="Extension" /></span>
					
						<span class="property-value" aria-labelledby="extension-label"><g:fieldValue bean="${telefonoUsuarioInstance}" field="extension"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${telefonoUsuarioInstance?.tipoTelefono}">
				<li class="fieldcontain">
					<span id="tipoTelefono-label" class="property-label"><g:message code="telefonoUsuario.tipoTelefono.label" default="Tipo Telefono" /></span>
					
						<span class="property-value" aria-labelledby="tipoTelefono-label"><g:fieldValue bean="${telefonoUsuarioInstance}" field="tipoTelefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${telefonoUsuarioInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="telefonoUsuario.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${telefonoUsuarioInstance?.usuario?.id}">${telefonoUsuarioInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${telefonoUsuarioInstance?.id}" />
					<g:link class="edit" action="edit" id="${telefonoUsuarioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
