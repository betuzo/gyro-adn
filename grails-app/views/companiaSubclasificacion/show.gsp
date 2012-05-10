
<%@ page import="com.gyro.adn.domain.CompaniaSubclasificacion" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'companiaSubclasificacion.label', default: 'CompaniaSubclasificacion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-companiaSubclasificacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-companiaSubclasificacion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list companiaSubclasificacion">
			
				<g:if test="${companiaSubclasificacionInstance?.subclasificacion}">
				<li class="fieldcontain">
					<span id="subclasificacion-label" class="property-label"><g:message code="companiaSubclasificacion.subclasificacion.label" default="Subclasificacion" /></span>
					
						<span class="property-value" aria-labelledby="subclasificacion-label"><g:fieldValue bean="${companiaSubclasificacionInstance}" field="subclasificacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companiaSubclasificacionInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="companiaSubclasificacion.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${companiaSubclasificacionInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companiaSubclasificacionInstance?.clasificacion}">
				<li class="fieldcontain">
					<span id="clasificacion-label" class="property-label"><g:message code="companiaSubclasificacion.clasificacion.label" default="Clasificacion" /></span>
					
						<span class="property-value" aria-labelledby="clasificacion-label"><g:link controller="companiaClasificacion" action="show" id="${companiaSubclasificacionInstance?.clasificacion?.id}">${companiaSubclasificacionInstance?.clasificacion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${companiaSubclasificacionInstance?.companias}">
				<li class="fieldcontain">
					<span id="companias-label" class="property-label"><g:message code="companiaSubclasificacion.companias.label" default="Companias" /></span>
					
						<g:each in="${companiaSubclasificacionInstance.companias}" var="c">
						<span class="property-value" aria-labelledby="companias-label"><g:link controller="compania" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${companiaSubclasificacionInstance?.id}" />
					<g:link class="edit" action="edit" id="${companiaSubclasificacionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
