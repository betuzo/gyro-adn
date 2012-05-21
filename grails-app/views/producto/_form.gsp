<%@ page import="com.gyro.adn.domain.Producto" %>



<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="producto.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${productoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="producto.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${productoInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'tipoProducto', 'error')} required">
	<label for="tipoProducto">
		<g:message code="producto.tipoProducto.label" default="Tipo Producto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoProducto" name="tipoProducto.id" from="${com.gyro.adn.domain.TipoProducto.list()}" optionKey="id" required="" value="${productoInstance?.tipoProducto?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'compania', 'error')} required">
	<label for="compania">
		<g:message code="producto.compania.label" default="Compania" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="compania" name="compania.id" from="${com.gyro.adn.domain.Compania.list()}" optionKey="id" required="" value="${productoInstance?.compania?.id}" class="many-to-one"/>
</div>

