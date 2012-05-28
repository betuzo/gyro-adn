<%@ page import="com.gyro.adn.domain.Compania" %>

<div class="fieldcontain ${hasErrors(bean: companiaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="compania.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${companiaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaInstance, field: 'nombreLargo', 'error')} ">
	<label for="nombreLargo">
		<g:message code="compania.nombreLargo.label" default="Nombre Largo" />
		
	</label>
	<g:textField name="nombreLargo" value="${companiaInstance?.nombreLargo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaInstance, field: 'direccion', 'error')} required">
	<label for="direccion">
		<g:message code="compania.direccion.label" default="Direccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direccion" required="" value="${companiaInstance?.direccion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaInstance, field: 'codigoPostal', 'error')} required">
	<label for="codigoPostal">
		<g:message code="compania.codigoPostal.label" default="Codigo Postal" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codigoPostal" required="" value="${companiaInstance?.codigoPostal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaInstance, field: 'municipio.estado.pais', 'error')} required">
	<label for="pais">
		<g:message code="compania.pais.label" default="Pais" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pais" name="municipio.estado.pais.id" from="${com.gyro.adn.domain.Pais.list()}" optionKey="id" required="" value="${companiaInstance?.municipio?.estado?.pais?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaInstance, field: 'municipio.estado', 'error')} required">
	<label for="estado">
		<g:message code="compania.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estado" name="municipio.estado.id" from="${companiaInstance?.municipio?.estado?.pais?.estados}" optionKey="id" required="" value="${companiaInstance?.municipio?.estado?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaInstance, field: 'municipio', 'error')} required">
	<label for="municipio">
		<g:message code="compania.municipio.label" default="Municipio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="municipio" name="municipio.id" from="${companiaInstance?.municipio?.estado?.municipios}" optionKey="id" required="" value="${companiaInstance?.municipio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaInstance, field: 'fechaInicioRelacion', 'error')} required">
	<label for="fechaInicioRelacion">
		<g:message code="compania.fechaInicioRelacion.label" default="Fecha Inicio Relacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaInicioRelacion" precision="day"  value="${companiaInstance?.fechaInicioRelacion}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: companiaInstance, field: 'subclasificaciones.clasificacion', 'error')} required">
	<label for="clasificacion">
		<g:message code="compania.clasificacion.label" default="Clasificacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="selclasificacion" name="subclasificaciones.clasificacion.id" from="${com.gyro.adn.domain.CompaniaClasificacion.list()}" optionKey="id" required="" value="${companiaInstance?.subclasificaciones?.toArray()?.getAt(0)?.clasificacion?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaInstance, field: 'subclasificaciones', 'error')} ">
	<label for="subclasificaciones">
		<g:message code="compania.subclasificaciones.label" default="Subclasificaciones" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="selsubclasificaciones" name="subclasificaciones" from="${companiaInstance?.subclasificaciones?.toArray()?.getAt(0)?.clasificacion?.subclasificaciones}" multiple="multiple" optionKey="id" size="5" required="" value="${companiaInstance?.subclasificaciones*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaInstance, field: 'campanias', 'error')} ">
	<label for="campanias">
		<g:message code="compania.campanias.label" default="Campanias" />
		
	</label>
	<g:select name="campanias" from="${com.gyro.adn.domain.Campania.list()}" multiple="multiple" optionKey="id" size="5" value="${companiaInstance?.campanias*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companiaInstance, field: 'contactos', 'error')} ">
	<label for="contactos">
		<g:message code="compania.contactos.label" default="Contactos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${companiaInstance?.contactos?}" var="c">
    <li><g:link controller="companiaContacto" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="companiaContacto" action="create" params="['compania.id': companiaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'companiaContacto.label', default: 'CompaniaContacto')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: companiaInstance, field: 'productos', 'error')} ">
	<label for="productos">
		<g:message code="compania.productos.label" default="Productos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${companiaInstance?.productos?}" var="p">
    <li><g:link controller="producto" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="producto" action="create" params="['compania.id': companiaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'producto.label', default: 'Producto')])}</g:link>
</li>
</ul>

</div>

