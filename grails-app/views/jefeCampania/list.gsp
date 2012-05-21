
<%@ page import="com.gyro.adn.domain.JefeCampania" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'jefeCampania.label', default: 'JefeCampania')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-jefeCampania" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-jefeCampania" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'jefeCampania.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="apellidoPaterno" title="${message(code: 'jefeCampania.apellidoPaterno.label', default: 'Apellido Paterno')}" />
					
						<g:sortableColumn property="apellidoMaterno" title="${message(code: 'jefeCampania.apellidoMaterno.label', default: 'Apellido Materno')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'jefeCampania.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="direccion" title="${message(code: 'jefeCampania.direccion.label', default: 'Direccion')}" />
					
						<g:sortableColumn property="codigoPostal" title="${message(code: 'jefeCampania.codigoPostal.label', default: 'Codigo Postal')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${jefeCampaniaInstanceList}" status="i" var="jefeCampaniaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${jefeCampaniaInstance.id}">${fieldValue(bean: jefeCampaniaInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: jefeCampaniaInstance, field: "apellidoPaterno")}</td>
					
						<td>${fieldValue(bean: jefeCampaniaInstance, field: "apellidoMaterno")}</td>
					
						<td>${fieldValue(bean: jefeCampaniaInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: jefeCampaniaInstance, field: "direccion")}</td>
					
						<td>${fieldValue(bean: jefeCampaniaInstance, field: "codigoPostal")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${jefeCampaniaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
