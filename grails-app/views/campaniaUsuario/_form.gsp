<%@ page import="com.gyro.adn.domain.CampaniaUsuario" %>



<div class="fieldcontain ${hasErrors(bean: campaniaUsuarioInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="campaniaUsuario.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${com.gyro.adn.domain.Usuario.list()}" optionKey="id" required="" value="${campaniaUsuarioInstance?.usuario?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: campaniaUsuarioInstance, field: 'campania', 'error')} required">
	<label for="campania">
		<g:message code="campaniaUsuario.campania.label" default="Campania" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="campania" name="campania.id" from="${com.gyro.adn.domain.Campania.list()}" optionKey="id" required="" value="${campaniaUsuarioInstance?.campania?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: campaniaUsuarioInstance, field: 'nivelUsuario', 'error')} ">
	<label for="nivelUsuario">
		<g:message code="campaniaUsuario.nivelUsuario.label" default="Nivel Usuario" />
		
	</label>
	<g:select name="nivelUsuario" from="${campaniaUsuarioInstance.constraints.nivelUsuario.inList}" value="${campaniaUsuarioInstance?.nivelUsuario}" valueMessagePrefix="campaniaUsuario.nivelUsuario" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: campaniaUsuarioInstance, field: 'fechaRegistro', 'error')} required">
	<label for="fechaRegistro">
		<g:message code="campaniaUsuario.fechaRegistro.label" default="Fecha Registro" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaRegistro" precision="day"  value="${campaniaUsuarioInstance?.fechaRegistro}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: campaniaUsuarioInstance, field: 'confirmaAsistencia', 'error')} ">
	<label for="confirmaAsistencia">
		<g:message code="campaniaUsuario.confirmaAsistencia.label" default="Confirma Asistencia" />
		
	</label>
	<g:checkBox name="confirmaAsistencia" value="${campaniaUsuarioInstance?.confirmaAsistencia}" />
</div>

<div class="fieldcontain ${hasErrors(bean: campaniaUsuarioInstance, field: 'contactoEmail', 'error')} ">
	<label for="contactoEmail">
		<g:message code="campaniaUsuario.contactoEmail.label" default="Contacto Email" />
		
	</label>
	<g:checkBox name="contactoEmail" value="${campaniaUsuarioInstance?.contactoEmail}" />
</div>

<div class="fieldcontain ${hasErrors(bean: campaniaUsuarioInstance, field: 'contactoTelefono', 'error')} ">
	<label for="contactoTelefono">
		<g:message code="campaniaUsuario.contactoTelefono.label" default="Contacto Telefono" />
		
	</label>
	<g:checkBox name="contactoTelefono" value="${campaniaUsuarioInstance?.contactoTelefono}" />
</div>

<div class="fieldcontain ${hasErrors(bean: campaniaUsuarioInstance, field: 'contestoEncuenta', 'error')} ">
	<label for="contestoEncuenta">
		<g:message code="campaniaUsuario.contestoEncuenta.label" default="Contesto Encuenta" />
		
	</label>
	<g:checkBox name="contestoEncuenta" value="${campaniaUsuarioInstance?.contestoEncuenta}" />
</div>

