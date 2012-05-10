
<%@ page import="com.gyro.adn.domain.TelefonoUsuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'telefonoUsuario.label', default: 'TelefonoUsuario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-telefonoUsuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-telefonoUsuario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="telefono" title="${message(code: 'telefonoUsuario.telefono.label', default: 'Telefono')}" />
					
						<g:sortableColumn property="extension" title="${message(code: 'telefonoUsuario.extension.label', default: 'Extension')}" />
					
						<g:sortableColumn property="tipoTelefono" title="${message(code: 'telefonoUsuario.tipoTelefono.label', default: 'Tipo Telefono')}" />
					
						<th><g:message code="telefonoUsuario.usuario.label" default="Usuario" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${telefonoUsuarioInstanceList}" status="i" var="telefonoUsuarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${telefonoUsuarioInstance.id}">${fieldValue(bean: telefonoUsuarioInstance, field: "telefono")}</g:link></td>
					
						<td>${fieldValue(bean: telefonoUsuarioInstance, field: "extension")}</td>
					
						<td>${fieldValue(bean: telefonoUsuarioInstance, field: "tipoTelefono")}</td>
					
						<td>${fieldValue(bean: telefonoUsuarioInstance, field: "usuario")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${telefonoUsuarioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
