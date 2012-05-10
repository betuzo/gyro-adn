<%@ page import="com.gyro.adn.domain.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="usuario.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${usuarioInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellidoPaterno', 'error')} required">
	<label for="apellidoPaterno">
		<g:message code="usuario.apellidoPaterno.label" default="Apellido Paterno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellidoPaterno" required="" value="${usuarioInstance?.apellidoPaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellidoMaterno', 'error')} ">
	<label for="apellidoMaterno">
		<g:message code="usuario.apellidoMaterno.label" default="Apellido Materno" />
		
	</label>
	<g:textField name="apellidoMaterno" value="${usuarioInstance?.apellidoMaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="usuario.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${usuarioInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'direccion', 'error')} required">
	<label for="direccion">
		<g:message code="usuario.direccion.label" default="Direccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direccion" required="" value="${usuarioInstance?.direccion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'codigoPostal', 'error')} required">
	<label for="codigoPostal">
		<g:message code="usuario.codigoPostal.label" default="Codigo Postal" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigoPostal" required="" value="${usuarioInstance?.codigoPostal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'municipio', 'error')} required">
	<label for="municipio">
		<g:message code="usuario.municipio.label" default="Municipio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="municipio" name="municipio.id" from="${com.gyro.adn.domain.Municipio.list()}" optionKey="id" required="" value="${usuarioInstance?.municipio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'fechaRegistro', 'error')} required">
	<label for="fechaRegistro">
		<g:message code="usuario.fechaRegistro.label" default="Fecha Registro" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaRegistro" precision="day"  value="${usuarioInstance?.fechaRegistro}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'puesto', 'error')} ">
	<label for="puesto">
		<g:message code="usuario.puesto.label" default="Puesto" />
		
	</label>
	<g:textField name="puesto" value="${usuarioInstance?.puesto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'rango', 'error')} ">
	<label for="rango">
		<g:message code="usuario.rango.label" default="Rango" />
		
	</label>
	<g:textField name="rango" value="${usuarioInstance?.rango}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'area', 'error')} ">
	<label for="area">
		<g:message code="usuario.area.label" default="Area" />
		
	</label>
	<g:textField name="area" value="${usuarioInstance?.area}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'idioma', 'error')} ">
	<label for="idioma">
		<g:message code="usuario.idioma.label" default="Idioma" />
		
	</label>
	<g:textField name="idioma" value="${usuarioInstance?.idioma}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'campanias', 'error')} ">
	<label for="campanias">
		<g:message code="usuario.campanias.label" default="Campanias" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${usuarioInstance?.campanias?}" var="c">
    <li><g:link controller="campaniaUsuario" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="campaniaUsuario" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'campaniaUsuario.label', default: 'CampaniaUsuario')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'productosComprados', 'error')} ">
	<label for="productosComprados">
		<g:message code="usuario.productosComprados.label" default="Productos Comprados" />
		
	</label>
	<g:select name="productosComprados" from="${com.gyro.adn.domain.Producto.list()}" multiple="multiple" optionKey="id" size="5" value="${usuarioInstance?.productosComprados*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'telefonos', 'error')} ">
	<label for="telefonos">
		<g:message code="usuario.telefonos.label" default="Telefonos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${usuarioInstance?.telefonos?}" var="t">
    <li><g:link controller="telefonoUsuario" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="telefonoUsuario" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefonoUsuario.label', default: 'TelefonoUsuario')])}</g:link>
</li>
</ul>

</div>

