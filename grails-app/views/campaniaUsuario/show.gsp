
<%@ page import="com.gyro.adn.domain.CampaniaUsuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'campaniaUsuario.label', default: 'CampaniaUsuario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-campaniaUsuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-campaniaUsuario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list campaniaUsuario">
			
				<g:if test="${campaniaUsuarioInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="campaniaUsuario.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${campaniaUsuarioInstance?.usuario?.id}">${campaniaUsuarioInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaUsuarioInstance?.campania}">
				<li class="fieldcontain">
					<span id="campania-label" class="property-label"><g:message code="campaniaUsuario.campania.label" default="Campania" /></span>
					
						<span class="property-value" aria-labelledby="campania-label"><g:link controller="campania" action="show" id="${campaniaUsuarioInstance?.campania?.id}">${campaniaUsuarioInstance?.campania?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaUsuarioInstance?.nivelUsuario}">
				<li class="fieldcontain">
					<span id="nivelUsuario-label" class="property-label"><g:message code="campaniaUsuario.nivelUsuario.label" default="Nivel Usuario" /></span>
					
						<span class="property-value" aria-labelledby="nivelUsuario-label"><g:fieldValue bean="${campaniaUsuarioInstance}" field="nivelUsuario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaUsuarioInstance?.fechaRegistro}">
				<li class="fieldcontain">
					<span id="fechaRegistro-label" class="property-label"><g:message code="campaniaUsuario.fechaRegistro.label" default="Fecha Registro" /></span>
					
						<span class="property-value" aria-labelledby="fechaRegistro-label"><g:formatDate date="${campaniaUsuarioInstance?.fechaRegistro}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaUsuarioInstance?.confirmaAsistencia}">
				<li class="fieldcontain">
					<span id="confirmaAsistencia-label" class="property-label"><g:message code="campaniaUsuario.confirmaAsistencia.label" default="Confirma Asistencia" /></span>
					
						<span class="property-value" aria-labelledby="confirmaAsistencia-label"><g:formatBoolean boolean="${campaniaUsuarioInstance?.confirmaAsistencia}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaUsuarioInstance?.contactoEmail}">
				<li class="fieldcontain">
					<span id="contactoEmail-label" class="property-label"><g:message code="campaniaUsuario.contactoEmail.label" default="Contacto Email" /></span>
					
						<span class="property-value" aria-labelledby="contactoEmail-label"><g:formatBoolean boolean="${campaniaUsuarioInstance?.contactoEmail}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaUsuarioInstance?.contactoTelefono}">
				<li class="fieldcontain">
					<span id="contactoTelefono-label" class="property-label"><g:message code="campaniaUsuario.contactoTelefono.label" default="Contacto Telefono" /></span>
					
						<span class="property-value" aria-labelledby="contactoTelefono-label"><g:formatBoolean boolean="${campaniaUsuarioInstance?.contactoTelefono}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaUsuarioInstance?.contestoEncuenta}">
				<li class="fieldcontain">
					<span id="contestoEncuenta-label" class="property-label"><g:message code="campaniaUsuario.contestoEncuenta.label" default="Contesto Encuenta" /></span>
					
						<span class="property-value" aria-labelledby="contestoEncuenta-label"><g:formatBoolean boolean="${campaniaUsuarioInstance?.contestoEncuenta}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${campaniaUsuarioInstance?.id}" />
					<g:link class="edit" action="edit" id="${campaniaUsuarioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
