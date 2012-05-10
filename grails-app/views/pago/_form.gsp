<%@ page import="com.gyro.adn.domain.Pago" %>



<div class="fieldcontain ${hasErrors(bean: pagoInstance, field: 'tipoPago', 'error')} ">
	<label for="tipoPago">
		<g:message code="pago.tipoPago.label" default="Tipo Pago" />
		
	</label>
	<g:select name="tipoPago" from="${pagoInstance.constraints.tipoPago.inList}" value="${pagoInstance?.tipoPago}" valueMessagePrefix="pago.tipoPago" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pagoInstance, field: 'fechaPago', 'error')} required">
	<label for="fechaPago">
		<g:message code="pago.fechaPago.label" default="Fecha Pago" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaPago" precision="day"  value="${pagoInstance?.fechaPago}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: pagoInstance, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="pago.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="cantidad" min="0.0" required="" value="${fieldValue(bean: pagoInstance, field: 'cantidad')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pagoInstance, field: 'campania', 'error')} required">
	<label for="campania">
		<g:message code="pago.campania.label" default="Campania" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="campania" name="campania.id" from="${com.gyro.adn.domain.Campania.list()}" optionKey="id" required="" value="${pagoInstance?.campania?.id}" class="many-to-one"/>
</div>

