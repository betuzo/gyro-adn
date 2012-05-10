
<%@ page import="com.gyro.adn.domain.CompaniaSubclasificacion" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'companiaSubclasificacion.label', default: 'CompaniaSubclasificacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-companiaSubclasificacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-companiaSubclasificacion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="subclasificacion" title="${message(code: 'companiaSubclasificacion.subclasificacion.label', default: 'Subclasificacion')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'companiaSubclasificacion.descripcion.label', default: 'Descripcion')}" />
					
						<th><g:message code="companiaSubclasificacion.clasificacion.label" default="Clasificacion" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${companiaSubclasificacionInstanceList}" status="i" var="companiaSubclasificacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${companiaSubclasificacionInstance.id}">${fieldValue(bean: companiaSubclasificacionInstance, field: "subclasificacion")}</g:link></td>
					
						<td>${fieldValue(bean: companiaSubclasificacionInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: companiaSubclasificacionInstance, field: "clasificacion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${companiaSubclasificacionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
