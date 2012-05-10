
<%@ page import="com.gyro.adn.domain.Compania" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'compania.label', default: 'Compania')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-compania" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-compania" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list compania">
			
				<g:if test="${companiaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="compania.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${companiaInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companiaInstance?.nombreLargo}">
				<li class="fieldcontain">
					<span id="nombreLargo-label" class="property-label"><g:message code="compania.nombreLargo.label" default="Nombre Largo" /></span>
					
						<span class="property-value" aria-labelledby="nombreLargo-label"><g:fieldValue bean="${companiaInstance}" field="nombreLargo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companiaInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="compania.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${companiaInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companiaInstance?.codigoPostal}">
				<li class="fieldcontain">
					<span id="codigoPostal-label" class="property-label"><g:message code="compania.codigoPostal.label" default="Codigo Postal" /></span>
					
						<span class="property-value" aria-labelledby="codigoPostal-label"><g:fieldValue bean="${companiaInstance}" field="codigoPostal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companiaInstance?.municipio?.estado?.pais}">
				<li class="fieldcontain">
					<span id="pais-label" class="property-label"><g:message code="compania.pais.label" default="Pais" /></span>
					
						<span class="property-value" aria-labelledby="pais-label"><g:link controller="pais" action="show" id="${companiaInstance?.municipio?.estado?.pais?.id}">${companiaInstance?.municipio?.estado?.pais?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>

				<g:if test="${companiaInstance?.municipio?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="compania.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:link controller="estado" action="show" id="${companiaInstance?.municipio?.estado?.id}">${companiaInstance?.municipio?.estado?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>

				<g:if test="${companiaInstance?.municipio}">
				<li class="fieldcontain">
					<span id="municipio-label" class="property-label"><g:message code="compania.municipio.label" default="Municipio" /></span>
					
						<span class="property-value" aria-labelledby="municipio-label"><g:link controller="municipio" action="show" id="${companiaInstance?.municipio?.id}">${companiaInstance?.municipio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${companiaInstance?.fechaInicioRelacion}">
				<li class="fieldcontain">
					<span id="fechaInicioRelacion-label" class="property-label"><g:message code="compania.fechaInicioRelacion.label" default="Fecha Inicio Relacion" /></span>
					
						<span class="property-value" aria-labelledby="fechaInicioRelacion-label"><g:formatDate date="${companiaInstance?.fechaInicioRelacion}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${companiaInstance?.subclasificaciones?.clasificacion}">
				<li class="fieldcontain">
					<span id="clasificacion-label" class="property-label"><g:message code="compania.clasificacion.label" default="Clasificaciones" /></span>
					
						<span class="property-value" aria-labelledby="clasificacion-label"><g:link controller="companiaClasificacion" action="show" id="${companiaInstance?.subclasificaciones?.toArray()[0]?.clasificacion?.id}">${companiaInstance?.subclasificaciones?.toArray()[0]?.clasificacion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>

				<g:if test="${companiaInstance?.subclasificaciones}">
				<li class="fieldcontain">
					<span id="subclasificaciones-label" class="property-label"><g:message code="compania.subclasificaciones.label" default="Subclasificaciones" /></span>
					
						<g:each in="${companiaInstance.subclasificaciones}" var="s">
						<span class="property-value" aria-labelledby="subclasificaciones-label"><g:link controller="companiaSubclasificacion" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${companiaInstance?.campanias}">
				<li class="fieldcontain">
					<span id="campanias-label" class="property-label"><g:message code="compania.campanias.label" default="Campanias" /></span>
					
						<g:each in="${companiaInstance.campanias}" var="c">
						<span class="property-value" aria-labelledby="campanias-label"><g:link controller="campania" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${companiaInstance?.contactos}">
				<li class="fieldcontain">
					<span id="contactos-label" class="property-label"><g:message code="compania.contactos.label" default="Contactos" /></span>
					
						<g:each in="${companiaInstance.contactos}" var="c">
						<span class="property-value" aria-labelledby="contactos-label"><g:link controller="companiaContacto" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${companiaInstance?.productos}">
				<li class="fieldcontain">
					<span id="productos-label" class="property-label"><g:message code="compania.productos.label" default="Productos" /></span>
					
						<g:each in="${companiaInstance.productos}" var="p">
						<span class="property-value" aria-labelledby="productos-label"><g:link controller="producto" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${companiaInstance?.id}" />
					<g:link class="edit" action="edit" id="${companiaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
