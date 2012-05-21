
<%@ page import="com.gyro.adn.domain.Pago" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pago.label', default: 'Pago')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pago" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pago" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="tipoPago" title="${message(code: 'pago.tipoPago.label', default: 'Tipo Pago')}" />
					
						<g:sortableColumn property="fechaPago" title="${message(code: 'pago.fechaPago.label', default: 'Fecha Pago')}" />
					
						<g:sortableColumn property="cantidad" title="${message(code: 'pago.cantidad.label', default: 'Cantidad')}" />
					
						<th><g:message code="pago.campania.label" default="Campania" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pagoInstanceList}" status="i" var="pagoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pagoInstance.id}">${fieldValue(bean: pagoInstance, field: "tipoPago")}</g:link></td>
					
						<td><g:formatDate date="${pagoInstance.fechaPago}" /></td>
					
						<td>${fieldValue(bean: pagoInstance, field: "cantidad")}</td>
					
						<td>${fieldValue(bean: pagoInstance, field: "campania")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pagoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
