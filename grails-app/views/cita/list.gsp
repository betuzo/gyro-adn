
<%@ page import="com.gyro.adn.domain.Cita" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cita.label', default: 'Cita')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cita" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cita" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'cita.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="fecha" title="${message(code: 'cita.fecha.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="direccion" title="${message(code: 'cita.direccion.label', default: 'Direccion')}" />
					
						<g:sortableColumn property="codigoPostal" title="${message(code: 'cita.codigoPostal.label', default: 'Codigo Postal')}" />
					
						<th><g:message code="cita.municipio.label" default="Municipio" /></th>
					
						<th><g:message code="cita.campania.label" default="Campania" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${citaInstanceList}" status="i" var="citaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${citaInstance.id}">${fieldValue(bean: citaInstance, field: "descripcion")}</g:link></td>
					
						<td><g:formatDate date="${citaInstance.fecha}" /></td>
					
						<td>${fieldValue(bean: citaInstance, field: "direccion")}</td>
					
						<td>${fieldValue(bean: citaInstance, field: "codigoPostal")}</td>
					
						<td>${fieldValue(bean: citaInstance, field: "municipio")}</td>
					
						<td>${fieldValue(bean: citaInstance, field: "campania")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${citaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
