
<%@ page import="com.gyro.adn.domain.TelefonoContacto" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'telefonoContacto.label', default: 'TelefonoContacto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-telefonoContacto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-telefonoContacto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="telefono" title="${message(code: 'telefonoContacto.telefono.label', default: 'Telefono')}" />
					
						<g:sortableColumn property="extension" title="${message(code: 'telefonoContacto.extension.label', default: 'Extension')}" />
					
						<g:sortableColumn property="tipoTelefono" title="${message(code: 'telefonoContacto.tipoTelefono.label', default: 'Tipo Telefono')}" />
					
						<th><g:message code="telefonoContacto.companiaContacto.label" default="Compania Contacto" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${telefonoContactoInstanceList}" status="i" var="telefonoContactoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${telefonoContactoInstance.id}">${fieldValue(bean: telefonoContactoInstance, field: "telefono")}</g:link></td>
					
						<td>${fieldValue(bean: telefonoContactoInstance, field: "extension")}</td>
					
						<td>${fieldValue(bean: telefonoContactoInstance, field: "tipoTelefono")}</td>
					
						<td>${fieldValue(bean: telefonoContactoInstance, field: "companiaContacto")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${telefonoContactoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
