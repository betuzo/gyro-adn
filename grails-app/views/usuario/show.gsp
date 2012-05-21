
<%@ page import="com.gyro.adn.domain.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-usuario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list usuario">
			
				<g:if test="${usuarioInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="usuario.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${usuarioInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.apellidoPaterno}">
				<li class="fieldcontain">
					<span id="apellidoPaterno-label" class="property-label"><g:message code="usuario.apellidoPaterno.label" default="Apellido Paterno" /></span>
					
						<span class="property-value" aria-labelledby="apellidoPaterno-label"><g:fieldValue bean="${usuarioInstance}" field="apellidoPaterno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.apellidoMaterno}">
				<li class="fieldcontain">
					<span id="apellidoMaterno-label" class="property-label"><g:message code="usuario.apellidoMaterno.label" default="Apellido Materno" /></span>
					
						<span class="property-value" aria-labelledby="apellidoMaterno-label"><g:fieldValue bean="${usuarioInstance}" field="apellidoMaterno"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="usuario.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${usuarioInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="usuario.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${usuarioInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.codigoPostal}">
				<li class="fieldcontain">
					<span id="codigoPostal-label" class="property-label"><g:message code="usuario.codigoPostal.label" default="Codigo Postal" /></span>
					
						<span class="property-value" aria-labelledby="codigoPostal-label"><g:fieldValue bean="${usuarioInstance}" field="codigoPostal"/></span>
					
				</li>
				</g:if>

				<g:if test="${usuarioInstance?.municipio?.estado?.pais}">
				<li class="fieldcontain">
					<span id="pais-label" class="property-label"><g:message code="usuario.pais.label" default="Pais" /></span>
					
						<span class="property-value" aria-labelledby="pais-label"><g:link controller="pais" action="show" id="${usuarioInstance?.municipio?.estado?.pais?.id}">${usuarioInstance?.municipio?.estado?.pais?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>

				<g:if test="${usuarioInstance?.municipio?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="usuario.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:link controller="estado" action="show" id="${usuarioInstance?.municipio?.estado?.id}">${usuarioInstance?.municipio?.estado?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.municipio}">
				<li class="fieldcontain">
					<span id="municipio-label" class="property-label"><g:message code="usuario.municipio.label" default="Municipio" /></span>
					
						<span class="property-value" aria-labelledby="municipio-label"><g:link controller="municipio" action="show" id="${usuarioInstance?.municipio?.id}">${usuarioInstance?.municipio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.fechaRegistro}">
				<li class="fieldcontain">
					<span id="fechaRegistro-label" class="property-label"><g:message code="usuario.fechaRegistro.label" default="Fecha Registro" /></span>
					
						<span class="property-value" aria-labelledby="fechaRegistro-label"><g:formatDate date="${usuarioInstance?.fechaRegistro}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.puesto}">
				<li class="fieldcontain">
					<span id="puesto-label" class="property-label"><g:message code="usuario.puesto.label" default="Puesto" /></span>
					
						<span class="property-value" aria-labelledby="puesto-label"><g:fieldValue bean="${usuarioInstance}" field="puesto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.rango}">
				<li class="fieldcontain">
					<span id="rango-label" class="property-label"><g:message code="usuario.rango.label" default="Rango" /></span>
					
						<span class="property-value" aria-labelledby="rango-label"><g:fieldValue bean="${usuarioInstance}" field="rango"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.area}">
				<li class="fieldcontain">
					<span id="area-label" class="property-label"><g:message code="usuario.area.label" default="Area" /></span>
					
						<span class="property-value" aria-labelledby="area-label"><g:fieldValue bean="${usuarioInstance}" field="area"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.idioma}">
				<li class="fieldcontain">
					<span id="idioma-label" class="property-label"><g:message code="usuario.idioma.label" default="Idioma" /></span>
					
						<span class="property-value" aria-labelledby="idioma-label"><g:fieldValue bean="${usuarioInstance}" field="idioma"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.campanias}">
				<li class="fieldcontain">
					<span id="campanias-label" class="property-label"><g:message code="usuario.campanias.label" default="Campanias" /></span>
					
						<g:each in="${usuarioInstance.campanias}" var="c">
						<span class="property-value" aria-labelledby="campanias-label"><g:link controller="campaniaUsuario" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.productosComprados}">
				<li class="fieldcontain">
					<span id="productosComprados-label" class="property-label"><g:message code="usuario.productosComprados.label" default="Productos Comprados" /></span>
					
						<g:each in="${usuarioInstance.productosComprados}" var="p">
						<span class="property-value" aria-labelledby="productosComprados-label"><g:link controller="producto" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.telefonos}">
				<li class="fieldcontain">
					<span id="telefonos-label" class="property-label"><g:message code="usuario.telefonos.label" default="Telefonos" /></span>
					
						<g:each in="${usuarioInstance.telefonos}" var="t">
						<span class="property-value" aria-labelledby="telefonos-label"><g:link controller="telefonoUsuario" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${usuarioInstance?.id}" />
					<g:link class="edit" action="edit" id="${usuarioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
