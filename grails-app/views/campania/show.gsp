
<%@ page import="com.gyro.adn.domain.Campania" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'campania.label', default: 'Campania')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-campania" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-campania" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list campania">
			
				<g:if test="${campaniaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="campania.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${campaniaInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaInstance?.producto?.compania}">
				<li class="fieldcontain">
					<span id="compania-label" class="property-label"><g:message code="campania.compania.label" default="Compañia" /></span>
					
						<span class="property-value" aria-labelledby="compania-label"><g:link controller="compania" action="show" id="${campaniaInstance?.producto?.compania?.id}">${campaniaInstance?.producto?.compania?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>

				<g:if test="${campaniaInstance?.producto}">
				<li class="fieldcontain">
					<span id="producto-label" class="property-label"><g:message code="campania.producto.label" default="Producto" /></span>
					
						<span class="property-value" aria-labelledby="producto-label"><g:link controller="producto" action="show" id="${campaniaInstance?.producto?.id}">${campaniaInstance?.producto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>

				<g:if test="${campaniaInstance?.contacto}">
				<li class="fieldcontain">
					<span id="contacto-label" class="property-label"><g:message code="campania.contacto.label" default="Contacto" /></span>
					
						<span class="property-value" aria-labelledby="contacto-label"><g:link controller="companiaContacto" action="show" id="${campaniaInstance?.contacto?.id}">${campaniaInstance?.contacto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaInstance?.jefeCampania}">
				<li class="fieldcontain">
					<span id="jefeCampania-label" class="property-label"><g:message code="campania.jefeCampania.label" default="Jefe Campania" /></span>
					
						<span class="property-value" aria-labelledby="jefeCampania-label"><g:link controller="jefeCampania" action="show" id="${campaniaInstance?.jefeCampania?.id}">${campaniaInstance?.jefeCampania?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaInstance?.precio}">
				<li class="fieldcontain">
					<span id="precio-label" class="property-label"><g:message code="campania.precio.label" default="Precio" /></span>
					
						<span class="property-value" aria-labelledby="precio-label"><g:fieldValue bean="${campaniaInstance}" field="precio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaInstance?.tipoCampania}">
				<li class="fieldcontain">
					<span id="tipoCampania-label" class="property-label"><g:message code="campania.tipoCampania.label" default="Tipo Campania" /></span>
					
						<span class="property-value" aria-labelledby="tipoCampania-label"><g:fieldValue bean="${campaniaInstance}" field="tipoCampania"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaInstance?.fechaInicio}">
				<li class="fieldcontain">
					<span id="fechaInicio-label" class="property-label"><g:message code="campania.fechaInicio.label" default="Fecha Inicio" /></span>
					
						<span class="property-value" aria-labelledby="fechaInicio-label"><g:formatDate date="${campaniaInstance?.fechaInicio}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaInstance?.fechaFin}">
				<li class="fieldcontain">
					<span id="fechaFin-label" class="property-label"><g:message code="campania.fechaFin.label" default="Fecha Fin" /></span>
					
						<span class="property-value" aria-labelledby="fechaFin-label"><g:formatDate date="${campaniaInstance?.fechaFin}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaInstance?.fase}">
				<li class="fieldcontain">
					<span id="fase-label" class="property-label"><g:message code="campania.fase.label" default="Fase" /></span>
					
						<span class="property-value" aria-labelledby="fase-label"><g:fieldValue bean="${campaniaInstance}" field="fase"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaInstance?.archivos}">
				<li class="fieldcontain">
					<span id="archivos-label" class="property-label"><g:message code="campania.archivos.label" default="Archivos" /></span>
					
						<g:each in="${campaniaInstance.archivos}" var="a">
						<span class="property-value" aria-labelledby="archivos-label"><g:link controller="archivo" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaInstance?.cid}">
				<li class="fieldcontain">
					<span id="cid-label" class="property-label"><g:message code="campania.cid.label" default="Cid" /></span>
					
						<span class="property-value" aria-labelledby="cid-label"><g:fieldValue bean="${campaniaInstance}" field="cid"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaInstance?.citas}">
				<li class="fieldcontain">
					<span id="citas-label" class="property-label"><g:message code="campania.citas.label" default="Citas" /></span>
					
						<g:each in="${campaniaInstance.citas}" var="c">
						<span class="property-value" aria-labelledby="citas-label"><g:link controller="cita" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaInstance?.pagos}">
				<li class="fieldcontain">
					<span id="pagos-label" class="property-label"><g:message code="campania.pagos.label" default="Pagos" /></span>
					
						<g:each in="${campaniaInstance.pagos}" var="p">
						<span class="property-value" aria-labelledby="pagos-label"><g:link controller="pago" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaInstance?.usuarios}">
				<li class="fieldcontain">
					<span id="usuarios-label" class="property-label"><g:message code="campania.usuarios.label" default="Usuarios" /></span>
					
						<g:each in="${campaniaInstance.usuarios}" var="u">
						<span class="property-value" aria-labelledby="usuarios-label"><g:link controller="campaniaUsuario" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${campaniaInstance?.id}" />
					<g:link class="edit" action="edit" id="${campaniaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
