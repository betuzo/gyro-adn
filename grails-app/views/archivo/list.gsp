
<%@ page import="com.gyro.adn.domain.Archivo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'archivo.label', default: 'Archivo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-archivo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-archivo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'archivo.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="ruta" title="${message(code: 'archivo.ruta.label', default: 'Ruta')}" />
					
						<th><g:message code="archivo.campania.label" default="Campania" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${archivoInstanceList}" status="i" var="archivoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${archivoInstance.id}">${fieldValue(bean: archivoInstance, field: "descripcion")}</g:link></td>
					
						<td>${fieldValue(bean: archivoInstance, field: "ruta")}</td>
					
						<td>${fieldValue(bean: archivoInstance, field: "campania")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${archivoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
