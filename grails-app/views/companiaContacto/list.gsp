
<%@ page import="com.gyro.adn.domain.CompaniaContacto" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'companiaContacto.label', default: 'CompaniaContacto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-companiaContacto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-companiaContacto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'companiaContacto.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="apellidoPaterno" title="${message(code: 'companiaContacto.apellidoPaterno.label', default: 'Apellido Paterno')}" />
					
						<g:sortableColumn property="apellidoMaterno" title="${message(code: 'companiaContacto.apellidoMaterno.label', default: 'Apellido Materno')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'companiaContacto.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="direccion" title="${message(code: 'companiaContacto.direccion.label', default: 'Direccion')}" />
					
						<g:sortableColumn property="codigoPostal" title="${message(code: 'companiaContacto.codigoPostal.label', default: 'Codigo Postal')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${companiaContactoInstanceList}" status="i" var="companiaContactoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${companiaContactoInstance.id}">${fieldValue(bean: companiaContactoInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: companiaContactoInstance, field: "apellidoPaterno")}</td>
					
						<td>${fieldValue(bean: companiaContactoInstance, field: "apellidoMaterno")}</td>
					
						<td>${fieldValue(bean: companiaContactoInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: companiaContactoInstance, field: "direccion")}</td>
					
						<td>${fieldValue(bean: companiaContactoInstance, field: "codigoPostal")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${companiaContactoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
