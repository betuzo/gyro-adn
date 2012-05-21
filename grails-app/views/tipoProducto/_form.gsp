<%@ page import="com.gyro.adn.domain.TipoProducto" %>



<div class="fieldcontain ${hasErrors(bean: tipoProductoInstance, field: 'clave', 'error')} required">
	<label for="clave">
		<g:message code="tipoProducto.clave.label" default="Clave" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="clave" required="" value="${tipoProductoInstance?.clave}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoProductoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="tipoProducto.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${tipoProductoInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoProductoInstance, field: 'productos', 'error')} ">
	<label for="productos">
		<g:message code="tipoProducto.productos.label" default="Productos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tipoProductoInstance?.productos?}" var="p">
    <li><g:link controller="producto" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="producto" action="create" params="['tipoProducto.id': tipoProductoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'producto.label', default: 'Producto')])}</g:link>
</li>
</ul>

</div>

