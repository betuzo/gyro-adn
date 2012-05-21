
<%@ page import="com.gyro.adn.domain.JefeCampania" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'jefeCampania.label', default: 'JefeCampania')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-jefeCampania" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-jefeCampania" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list jefeCampania">
			
				<g:if test="${jefeCampaniaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="jefeCampania.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${jefeCampaniaInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${jefeCampaniaInstance?.apellidoPaterno}">
				<li class="fieldcontain">
					<span id="apellidoPaterno-label" class="property-label"><g:message code="jefeCampania.apellidoPaterno.label" default="Apellido Paterno" /></span>
					
						<span class="property-value" aria-labelledby="apellidoPaterno-label"><g:fieldValue bean="${jefeCampaniaInstance}" field="apellidoPaterno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${jefeCampaniaInstance?.apellidoMaterno}">
				<li class="fieldcontain">
					<span id="apellidoMaterno-label" class="property-label"><g:message code="jefeCampania.apellidoMaterno.label" default="Apellido Materno" /></span>
					
						<span class="property-value" aria-labelledby="apellidoMaterno-label"><g:fieldValue bean="${jefeCampaniaInstance}" field="apellidoMaterno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${jefeCampaniaInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="jefeCampania.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${jefeCampaniaInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${jefeCampaniaInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="jefeCampania.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${jefeCampaniaInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${jefeCampaniaInstance?.codigoPostal}">
				<li class="fieldcontain">
					<span id="codigoPostal-label" class="property-label"><g:message code="jefeCampania.codigoPostal.label" default="Codigo Postal" /></span>
					
						<span class="property-value" aria-labelledby="codigoPostal-label"><g:fieldValue bean="${jefeCampaniaInstance}" field="codigoPostal"/></span>
					
				</li>
				</g:if>

				<g:if test="${jefeCampaniaInstance?.municipio?.estado?.pais}">
				<li class="fieldcontain">
					<span id="pais-label" class="property-label"><g:message code="jefeCampania.pais.label" default="Pais" /></span>
					
						<span class="property-value" aria-labelledby="pais-label"><g:link controller="pais" action="show" id="${jefeCampaniaInstance?.municipio?.estado?.pais?.id}">${jefeCampaniaInstance?.municipio?.estado?.pais?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>

				<g:if test="${jefeCampaniaInstance?.municipio?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="jefeCampania.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:link controller="estado" action="show" id="${jefeCampaniaInstance?.municipio?.estado?.id}">${jefeCampaniaInstance?.municipio?.estado?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${jefeCampaniaInstance?.municipio}">
				<li class="fieldcontain">
					<span id="municipio-label" class="property-label"><g:message code="jefeCampania.municipio.label" default="Municipio" /></span>
					
						<span class="property-value" aria-labelledby="municipio-label"><g:link controller="municipio" action="show" id="${jefeCampaniaInstance?.municipio?.id}">${jefeCampaniaInstance?.municipio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${jefeCampaniaInstance?.fechaRegistro}">
				<li class="fieldcontain">
					<span id="fechaRegistro-label" class="property-label"><g:message code="jefeCampania.fechaRegistro.label" default="Fecha Registro" /></span>
					
						<span class="property-value" aria-labelledby="fechaRegistro-label"><g:formatDate date="${jefeCampaniaInstance?.fechaRegistro}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${jefeCampaniaInstance?.campanias}">
				<li class="fieldcontain">
					<span id="campanias-label" class="property-label"><g:message code="jefeCampania.campanias.label" default="Campanias" /></span>
					
						<g:each in="${jefeCampaniaInstance.campanias}" var="c">
						<span class="property-value" aria-labelledby="campanias-label"><g:link controller="campania" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${jefeCampaniaInstance?.id}" />
					<g:link class="edit" action="edit" id="${jefeCampaniaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
