
<%@ page import="com.gyro.adn.domain.CompaniaClasificacion" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'companiaClasificacion.label', default: 'CompaniaClasificacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-companiaClasificacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-companiaClasificacion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="clasificacion" title="${message(code: 'companiaClasificacion.clasificacion.label', default: 'Clasificacion')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'companiaClasificacion.descripcion.label', default: 'Descripcion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${companiaClasificacionInstanceList}" status="i" var="companiaClasificacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${companiaClasificacionInstance.id}">${fieldValue(bean: companiaClasificacionInstance, field: "clasificacion")}</g:link></td>
					
						<td>${fieldValue(bean: companiaClasificacionInstance, field: "descripcion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${companiaClasificacionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
