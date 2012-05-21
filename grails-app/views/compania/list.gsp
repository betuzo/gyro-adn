
<%@ page import="com.gyro.adn.domain.Compania" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'compania.label', default: 'Compania')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-compania" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-compania" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'compania.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="nombreLargo" title="${message(code: 'compania.nombreLargo.label', default: 'Nombre Largo')}" />
					
						<g:sortableColumn property="direccion" title="${message(code: 'compania.direccion.label', default: 'Direccion')}" />
					
						<g:sortableColumn property="codigoPostal" title="${message(code: 'compania.codigoPostal.label', default: 'Codigo Postal')}" />
					
						<th><g:message code="compania.municipio.label" default="Municipio" /></th>
					
						<g:sortableColumn property="fechaInicioRelacion" title="${message(code: 'compania.fechaInicioRelacion.label', default: 'Fecha Inicio Relacion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${companiaInstanceList}" status="i" var="companiaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${companiaInstance.id}">${fieldValue(bean: companiaInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: companiaInstance, field: "nombreLargo")}</td>
					
						<td>${fieldValue(bean: companiaInstance, field: "direccion")}</td>
					
						<td>${fieldValue(bean: companiaInstance, field: "codigoPostal")}</td>
					
						<td>${fieldValue(bean: companiaInstance, field: "municipio")}</td>
					
						<td><g:formatDate date="${companiaInstance.fechaInicioRelacion}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${companiaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
