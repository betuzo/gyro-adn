
<%@ page import="com.gyro.adn.domain.Campania" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'campania.label', default: 'Campania')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-campania" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-campania" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'campania.nombre.label', default: 'Nombre')}" />
					
						<th><g:message code="campania.producto.label" default="Producto" /></th>
					
						<th><g:message code="campania.jefeCampania.label" default="Jefe Campania" /></th>
					
						<th><g:message code="campania.contacto.label" default="Contacto" /></th>
					
						<g:sortableColumn property="precio" title="${message(code: 'campania.precio.label', default: 'Precio')}" />
					
						<g:sortableColumn property="tipoCampania" title="${message(code: 'campania.tipoCampania.label', default: 'Tipo Campania')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${campaniaInstanceList}" status="i" var="campaniaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${campaniaInstance.id}">${fieldValue(bean: campaniaInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: campaniaInstance, field: "producto")}</td>
					
						<td>${fieldValue(bean: campaniaInstance, field: "jefeCampania")}</td>
					
						<td>${fieldValue(bean: campaniaInstance, field: "contacto")}</td>
					
						<td>${fieldValue(bean: campaniaInstance, field: "precio")}</td>
					
						<td>${fieldValue(bean: campaniaInstance, field: "tipoCampania")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${campaniaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
