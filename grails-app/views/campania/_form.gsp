<%@ page import="com.gyro.adn.domain.Campania" %>



<div class="fieldcontain ${hasErrors(bean: campaniaInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="campania.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${campaniaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: campaniaInstance, field: 'producto.compania', 'error')} required">
        <label for="compania">
                <g:message code="campania.compania.label" default="Compañia" />
                <span class="required-indicator">*</span>
        </label>
        <g:select id="compania" name="compania.id" from="${com.gyro.adn.domain.Compania.list()}" optionKey="id" required="" value="${campaniaInstance?.producto?.compania?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: campaniaInstance, field: 'producto', 'error')} required">
        <label for="producto">
                <g:message code="campania.producto.label" default="Producto" />
                <span class="required-indicator">*</span>
        </label>
        <g:select id="producto" name="producto.id" from="${campaniaInstance?.producto?.compania?.productos}" optionKey="id" required="" value="${campaniaInstance?.producto?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: campaniaInstance, field: 'contacto', 'error')} required">
        <label for="contacto">
                <g:message code="campania.contacto.label" default="Contacto" />
                <span class="required-indicator">*</span>
        </label>
        <g:select id="contacto" name="contacto.id" from="${campaniaInstance?.contacto?.compania?.contactos}" optionKey="id" required="" value="${campaniaInstance?.contacto?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: campaniaInstance, field: 'jefeCampania', 'error')} required">
	<label for="jefeCampania">
		<g:message code="campania.jefeCampania.label" default="Jefe Campania" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="jefeCampania" name="jefeCampania.id" from="${com.gyro.adn.domain.JefeCampania.list()}" optionKey="id" required="" value="${campaniaInstance?.jefeCampania?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: campaniaInstance, field: 'precio', 'error')} required">
	<label for="precio">
		<g:message code="campania.precio.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="precio" required="" value="${fieldValue(bean: campaniaInstance, field: 'precio')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: campaniaInstance, field: 'tipoCampania', 'error')} ">
	<label for="tipoCampania">
		<g:message code="campania.tipoCampania.label" default="Tipo Campania" />
		
	</label>
	<g:select name="tipoCampania" from="${campaniaInstance.constraints.tipoCampania.inList}" value="${campaniaInstance?.tipoCampania}" valueMessagePrefix="campania.tipoCampania" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: campaniaInstance, field: 'fechaInicio', 'error')} required">
	<label for="fechaInicio">
		<g:message code="campania.fechaInicio.label" default="Fecha Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaInicio" precision="day"  value="${campaniaInstance?.fechaInicio}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: campaniaInstance, field: 'fechaFin', 'error')} required">
	<label for="fechaFin">
		<g:message code="campania.fechaFin.label" default="Fecha Fin" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaFin" precision="day"  value="${campaniaInstance?.fechaFin}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: campaniaInstance, field: 'fase', 'error')} ">
	<label for="fase">
		<g:message code="campania.fase.label" default="Fase" />
		
	</label>
	<g:select name="fase" from="${campaniaInstance.constraints.fase.inList}" value="${campaniaInstance?.fase}" valueMessagePrefix="campania.fase" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: campaniaInstance, field: 'archivos', 'error')} ">
	<label for="archivos">
		<g:message code="campania.archivos.label" default="Archivos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${campaniaInstance?.archivos?}" var="a">
    <li><g:link controller="archivo" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="archivo" action="create" params="['campania.id': campaniaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'archivo.label', default: 'Archivo')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: campaniaInstance, field: 'cid', 'error')} ">
	<label for="cid">
		<g:message code="campania.cid.label" default="Cid" />
		
	</label>
	<g:textField name="cid" value="${campaniaInstance?.cid}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: campaniaInstance, field: 'citas', 'error')} ">
	<label for="citas">
		<g:message code="campania.citas.label" default="Citas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${campaniaInstance?.citas?}" var="c">
    <li><g:link controller="cita" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="cita" action="create" params="['campania.id': campaniaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'cita.label', default: 'Cita')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: campaniaInstance, field: 'pagos', 'error')} ">
	<label for="pagos">
		<g:message code="campania.pagos.label" default="Pagos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${campaniaInstance?.pagos?}" var="p">
    <li><g:link controller="pago" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="pago" action="create" params="['campania.id': campaniaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pago.label', default: 'Pago')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: campaniaInstance, field: 'usuarios', 'error')} ">
	<label for="usuarios">
		<g:message code="campania.usuarios.label" default="Usuarios" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${campaniaInstance?.usuarios?}" var="u">
    <li><g:link controller="campaniaUsuario" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:if test="${campaniaInstance?.cid}">
<g:if test="${campaniaInstance?.estadisticas?.status != 'sent'}">
	<g:link controller="campaniaUsuario" action="create" params="['campania.id': campaniaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'campaniaUsuario.label', default: 'CampaniaUsuario')])}</g:link>
</g:if>
</g:if>
</li>
</ul>

</div>

