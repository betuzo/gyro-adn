
<%@ page import="com.gyro.adn.domain.Campania" %>
<!doctype html>

<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<g:set var="entityName" value="${message(code: 'campania.label', default: 'Campania')}" />
		<g:set var="estadisticas" value="${message(code: 'campania.estadisticas.label', default: 'Estadisticas MailChimp')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'ui.jqgrid.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'jquery-ui-1.8.20.custom.css')}" />
		<g:javascript src='grid.locale-es.js'/>
		<g:javascript src='jquery.jqGrid.min.js'/>
		
		<g:javascript>
			jQuery().ready(function (){

				$("#listMailChimp").jqGrid({
			   	url: '${request.contextPath + '/campania/showStatByUser?cid='}' + $("#cid").html(), 
				datatype: "json",
				height: 200,
			   	colNames:['Email','Nombre', 'Tipo', 'Enviado','Abierto','Click'],
			   	colModel:[
			   		{name:'email',index:'email', width:220},
			   		{name:'nombre',index:'nombre', width:150},
			   		{name:'tipo',index:'tipo', width:60},
			   		{name:'enviado',index:'enviado', width:80, align:"right"},
			   		{name:'abierto',index:'abierto', width:80, align:"right"},		
			   		{name:'click',index:'click', width:80,align:"right"},		
			   	],
			   	rowNum:10,
			   	rowList:[10,20,30],
			   	pager: '#pagerListMailChimp',
			   	sortname: 'email',
			    viewrecords: true,
			    sortorder: "desc",
				multiselect: false,
				subGrid : true,
			    subGridUrl: '${request.contextPath + '/campania/showStatByUserByUrl?cid='}' + $("#cid").html(),
			    subGridModel: [{ name  : ['Url','Fecha'], 
			                    width : [120,70] } 
			    ],
			    caption: "Usuarios de Campañia"			
				});
				$("#listMailChimp").jqGrid('navGrid','#pagerListMailChimp',{add:false,edit:false,del:false});

				$("#mailchimp").jqGrid({
				   	url: '${request.contextPath + '/campania/showStatistics?cid='}' + $("#cid").html(), 
					datatype: "json",
					height: 200,
				   	colNames:['Concepto','valor'],
				   	colModel:[
				   		{name:'key',index:'key', width:220},
				   		{name:'value',index:'value', width:150},
				   		
				   	],
				   	rowNum:20,
				   	rowList:[10,20,30],
				   	pager: '#pagerMailChimp',
				   	sortname: 'email',
				    viewrecords: true,
				    sortorder: "desc",
					multiselect: false,
				    caption: "Estadisticas MailChimp"			
				});
				$("#mailchimp").jqGrid('navGrid','#pagerMailChimp',{add:false,edit:false,del:false});
			});
			$("#nextStep").click(function() {
				var isNext;
				if ($("#faseVal").html() != 'Diseño')
					isNext = confirm('¿Esta seguro de ir al siguiente paso?');
				else
					isNext = confirm('¿Esta seguro de ir al siguiente paso, se enviara la campaña a los destinatarios?');
				if (isNext){
					$.ajax({
		        		url: "/gyro-adn/campania/nextStep",
		            	data: { id: $("#id").val(), fase: $("#faseVal").html() },
		            	cache: false,
		            	success: function(html) {
		            		$("#fase").html(html.html);
		            		if (html.fase == 'Fin')
		            			$("#nextStep").html(' ');
		            		alert(html.msg);
		            	}
		        	});
				}
	    	});
		</g:javascript>
	</head>
	
	<body>
		<a href="#show-campania" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-campania" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list campania">
			
				<g:if test="${campaniaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="campania.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${campaniaInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaInstance?.producto?.compania}">
				<li class="fieldcontain">
					<span id="compania-label" class="property-label"><g:message code="campania.compania.label" default="Compañia" /></span>
					
						<span class="property-value" aria-labelledby="compania-label"><g:link controller="compania" action="show" id="${campaniaInstance?.producto?.compania?.id}">${campaniaInstance?.producto?.compania?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>

				<g:if test="${campaniaInstance?.producto}">
				<li class="fieldcontain">
					<span id="producto-label" class="property-label"><g:message code="campania.producto.label" default="Producto" /></span>
					
						<span class="property-value" aria-labelledby="producto-label"><g:link controller="producto" action="show" id="${campaniaInstance?.producto?.id}">${campaniaInstance?.producto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>

				<g:if test="${campaniaInstance?.contacto}">
				<li class="fieldcontain">
					<span id="contacto-label" class="property-label"><g:message code="campania.contacto.label" default="Contacto" /></span>
					
						<span class="property-value" aria-labelledby="contacto-label"><g:link controller="companiaContacto" action="show" id="${campaniaInstance?.contacto?.id}">${campaniaInstance?.contacto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaInstance?.jefeCampania}">
				<li class="fieldcontain">
					<span id="jefeCampania-label" class="property-label"><g:message code="campania.jefeCampania.label" default="Jefe Campania" /></span>
					
						<span class="property-value" aria-labelledby="jefeCampania-label"><g:link controller="jefeCampania" action="show" id="${campaniaInstance?.jefeCampania?.id}">${campaniaInstance?.jefeCampania?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaInstance?.precio}">
				<li class="fieldcontain">
					<span id="precio-label" class="property-label"><g:message code="campania.precio.label" default="Precio" /></span>
					
						<span class="property-value" aria-labelledby="precio-label"><g:fieldValue bean="${campaniaInstance}" field="precio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaInstance?.tipoCampania}">
				<li class="fieldcontain">
					<span id="tipoCampania-label" class="property-label"><g:message code="campania.tipoCampania.label" default="Tipo Campania" /></span>
					
						<span class="property-value" aria-labelledby="tipoCampania-label"><g:fieldValue bean="${campaniaInstance}" field="tipoCampania"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaInstance?.fechaInicio}">
				<li class="fieldcontain">
					<span id="fechaInicio-label" class="property-label"><g:message code="campania.fechaInicio.label" default="Fecha Inicio" /></span>
					
						<span class="property-value" aria-labelledby="fechaInicio-label"><g:formatDate date="${campaniaInstance?.fechaInicio}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaInstance?.fechaFin}">
				<li class="fieldcontain">
					<span id="fechaFin-label" class="property-label"><g:message code="campania.fechaFin.label" default="Fecha Fin" /></span>
					
						<span class="property-value" aria-labelledby="fechaFin-label"><g:formatDate date="${campaniaInstance?.fechaFin}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaInstance?.fase}">
				<li class="fieldcontain">
					<span id="fase-label" class="property-label"><g:message code="campania.fase.label" default="Fase" /></span>
						<div id="fase">
						<span id="faseVal" class="property-value" aria-labelledby="fase-label"><g:fieldValue bean="${campaniaInstance}" field="fase"/></span>
						</div>
				</li>
				</g:if>
			
				<g:if test="${campaniaInstance?.archivos}">
				<li class="fieldcontain">
					<span id="archivos-label" class="property-label"><g:message code="campania.archivos.label" default="Archivos" /></span>
					
						<g:each in="${campaniaInstance.archivos}" var="a">
						<span class="property-value" aria-labelledby="archivos-label"><g:link controller="archivo" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaInstance?.cid}">
				<li class="fieldcontain">
					<span id="cid-label" class="property-label"><g:message code="campania.cid.label" default="Cid" /></span>
					
						<span id="cid" class="property-value" aria-labelledby="cid-label"><g:fieldValue bean="${campaniaInstance}" field="cid"/></span>
					
				</li>
				</g:if>

				<g:each in="${campaniaInstance?.estadisticas}" status="i" var="estadistica">
					<g:if test="${estadistica}">
					<li class="fieldcontain">
						<span id="${estadistica.key}-label" class="property-label"><g:message code="campania.${estadistica.key}.label" default="${estadistica.key}" /></span>
						
							<span id="${estadistica.key}" class="property-value" aria-labelledby="${estadistica.key}-label"><g:fieldValue bean="${estadistica}" field="value"/></span>
						
					</li>
					</g:if>
				</g:each>
			
				<g:if test="${campaniaInstance?.citas}">
				<li class="fieldcontain">
					<span id="citas-label" class="property-label"><g:message code="campania.citas.label" default="Citas" /></span>
					
						<g:each in="${campaniaInstance.citas}" var="c">
						<span class="property-value" aria-labelledby="citas-label"><g:link controller="cita" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${campaniaInstance?.pagos}">
				<li class="fieldcontain">
					<span id="pagos-label" class="property-label"><g:message code="campania.pagos.label" default="Pagos" /></span>
					
						<g:each in="${campaniaInstance.pagos}" var="p">
						<span class="property-value" aria-labelledby="pagos-label"><g:link controller="pago" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>

			<table id="listMailChimp"></table>
			<div id="pagerListMailChimp"></div>
			
			<br>
			</br>
			

			<table id="mailchimp"></table>
			<div id="pagerMailChimp"></div>
			


			<br></br>

			<g:form>
				<fieldset class="buttons">
					<g:hiddenField id="id" name="id" value="${campaniaInstance?.id}" />
					<g:link class="edit" action="edit" id="${campaniaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					<g:if test="${campaniaInstance?.fase != 'Fin'}">
						<div class="edit" id="nextStep"><g:message code="default.button.nextStep.label" default="Siguiente Estado" /></div>
					</g:if>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
