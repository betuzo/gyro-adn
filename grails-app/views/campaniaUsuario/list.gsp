
<%@ page import="com.gyro.adn.domain.CampaniaUsuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'campaniaUsuario.label', default: 'CampaniaUsuario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-campaniaUsuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-campaniaUsuario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="campaniaUsuario.usuario.label" default="Usuario" /></th>
					
						<th><g:message code="campaniaUsuario.campania.label" default="Campania" /></th>
					
						<g:sortableColumn property="nivelUsuario" title="${message(code: 'campaniaUsuario.nivelUsuario.label', default: 'Nivel Usuario')}" />
					
						<g:sortableColumn property="fechaRegistro" title="${message(code: 'campaniaUsuario.fechaRegistro.label', default: 'Fecha Registro')}" />
					
						<g:sortableColumn property="confirmaAsistencia" title="${message(code: 'campaniaUsuario.confirmaAsistencia.label', default: 'Confirma Asistencia')}" />
					
						<g:sortableColumn property="contactoEmail" title="${message(code: 'campaniaUsuario.contactoEmail.label', default: 'Contacto Email')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${campaniaUsuarioInstanceList}" status="i" var="campaniaUsuarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${campaniaUsuarioInstance.id}">${fieldValue(bean: campaniaUsuarioInstance, field: "usuario")}</g:link></td>
					
						<td>${fieldValue(bean: campaniaUsuarioInstance, field: "campania")}</td>
					
						<td>${fieldValue(bean: campaniaUsuarioInstance, field: "nivelUsuario")}</td>
					
						<td><g:formatDate date="${campaniaUsuarioInstance.fechaRegistro}" /></td>
					
						<td><g:formatBoolean boolean="${campaniaUsuarioInstance.confirmaAsistencia}" /></td>
					
						<td><g:formatBoolean boolean="${campaniaUsuarioInstance.contactoEmail}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${campaniaUsuarioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
