
<%@ page import="com.gyro.adn.domain.CompaniaContacto" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'companiaContacto.label', default: 'CompaniaContacto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-companiaContacto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-companiaContacto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list companiaContacto">
			
				<g:if test="${companiaContactoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="companiaContacto.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${companiaContactoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companiaContactoInstance?.apellidoPaterno}">
				<li class="fieldcontain">
					<span id="apellidoPaterno-label" class="property-label"><g:message code="companiaContacto.apellidoPaterno.label" default="Apellido Paterno" /></span>
					
						<span class="property-value" aria-labelledby="apellidoPaterno-label"><g:fieldValue bean="${companiaContactoInstance}" field="apellidoPaterno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companiaContactoInstance?.apellidoMaterno}">
				<li class="fieldcontain">
					<span id="apellidoMaterno-label" class="property-label"><g:message code="companiaContacto.apellidoMaterno.label" default="Apellido Materno" /></span>
					
						<span class="property-value" aria-labelledby="apellidoMaterno-label"><g:fieldValue bean="${companiaContactoInstance}" field="apellidoMaterno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companiaContactoInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="companiaContacto.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${companiaContactoInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companiaContactoInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="companiaContacto.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${companiaContactoInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companiaContactoInstance?.codigoPostal}">
				<li class="fieldcontain">
					<span id="codigoPostal-label" class="property-label"><g:message code="companiaContacto.codigoPostal.label" default="Codigo Postal" /></span>
					
						<span class="property-value" aria-labelledby="codigoPostal-label"><g:fieldValue bean="${companiaContactoInstance}" field="codigoPostal"/></span>
					
				</li>
				</g:if>

				<g:if test="${companiaContactoInstance?.municipio?.estado?.pais}">
				<li class="fieldcontain">
					<span id="pais-label" class="property-label"><g:message code="companiaContacto.pais.label" default="Pais" /></span>
					
						<span class="property-value" aria-labelledby="pais-label"><g:link controller="pais" action="show" id="${companiaContactoInstance?.municipio?.estado?.pais?.id}">${companiaContactoInstance?.municipio?.estado?.pais?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>

				<g:if test="${companiaContactoInstance?.municipio?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="companiaContacto.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:link controller="estado" action="show" id="${companiaContactoInstance?.municipio?.estado?.id}">${companiaContactoInstance?.municipio?.estado?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${companiaContactoInstance?.municipio}">
				<li class="fieldcontain">
					<span id="municipio-label" class="property-label"><g:message code="companiaContacto.municipio.label" default="Municipio" /></span>
					
						<span class="property-value" aria-labelledby="municipio-label"><g:link controller="municipio" action="show" id="${companiaContactoInstance?.municipio?.id}">${companiaContactoInstance?.municipio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${companiaContactoInstance?.fechaRegistro}">
				<li class="fieldcontain">
					<span id="fechaRegistro-label" class="property-label"><g:message code="companiaContacto.fechaRegistro.label" default="Fecha Registro" /></span>
					
						<span class="property-value" aria-labelledby="fechaRegistro-label"><g:formatDate date="${companiaContactoInstance?.fechaRegistro}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${companiaContactoInstance?.compania}">
				<li class="fieldcontain">
					<span id="compania-label" class="property-label"><g:message code="companiaContacto.compania.label" default="Compania" /></span>
					
						<span class="property-value" aria-labelledby="compania-label"><g:link controller="compania" action="show" id="${companiaContactoInstance?.compania?.id}">${companiaContactoInstance?.compania?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${companiaContactoInstance?.telefonos}">
				<li class="fieldcontain">
					<span id="telefonos-label" class="property-label"><g:message code="companiaContacto.telefonos.label" default="Telefonos" /></span>
					
						<g:each in="${companiaContactoInstance.telefonos}" var="t">
						<span class="property-value" aria-labelledby="telefonos-label"><g:link controller="telefonoContacto" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${companiaContactoInstance?.id}" />
					<g:link class="edit" action="edit" id="${companiaContactoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
