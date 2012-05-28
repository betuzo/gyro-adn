<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'stylelogin.css')}" type="text/css">
		<g:javascript src='jquery-1.7.1.min.js'/>
		<g:javascript src='login.js'/>
		<g:javascript>
			$(document).ready(function() { 	
				$('#compania').ready(function() {
					$("#compania").change();
				});
				$('#pais').ready(function() {
					$("#pais").change();
				});
				$('#selclasificacion').ready(function() {
					$("#selclasificacion").change();
				});
			    $("#pais").change(function() {
			    	$.ajax({
			        	url: "/gyro-adn/address/paisSelected",
			            data: { id: this.value, idEstado: $("#estado").val() },
			            cache: false,
			            success: function(html) {
			            	$("#estado").html(html);
			            	$("#estado").change();
			            }
			        });
			    });
			    $("#estado").change(function() {
			    	$.ajax({
			        	url: "/gyro-adn/address/estadoSelected",
			            data: { id: this.value, idMunicipio: $("#municipio").val() },
			            cache: false,
			            success: function(html) {
			            	$("#municipio").html(html);
			            }
			        });
			    });
			    $("#selclasificacion").change(function() {
			    	$.ajax({
			        	url: "/gyro-adn/compania/clasificacionSelected",
			            data: { id: this.value, idSubclasificaciones: $("#subclasificaciones").val() },
			            cache: false,
			            success: function(html) {
			            	$("#selsubclasificaciones").html(html);
			            }
			        });
			    });
			    $("#compania").change(function() {
			    	$.ajax({
			        	url: "/gyro-adn/campania/companiaSelectedProducto",
			        	data: { id: this.value, idProducto: $("#producto").val() },
			            cache: false,
			            success: function(html) {
			            	$("#producto").html(html);
			            }
			        });        
			        $.ajax({
			            url: "/gyro-adn/campania/companiaSelectedContacto",
			        	data: { id: this.value, idContacto: $("#contacto").val()  },
			            cache: false,
			            success: function(html) {
			            	$("#contacto").html(html);
			            }
			        });    
			    });
			});
			function authAjax() {
			   	var form = document.loginForm;
			   	var params = $('form').serialize();
			   	if($("#remember_me:checked").val() != 'on')
					params = params + '&_spring_security_remember_me=false';
				alert(params);
			   	$.ajax({
		            url: "/gyro-adn/j_spring_security_check?ajax=true",
		        	data: params,
		        	type: 'POST',
		            cache: false,
		            success: function(html) {
		            	if (html.success==true){
		            		$("#secSeguridad").html(html.html);
		            	}else{
		            		$("#ajaxLoginError").html(html.error);
		            	}
		            }
			    });
			}
		</g:javascript>
		<g:layoutHead/>
        <r:layoutResources />
	</head>
	<body>
		<div id="grailsLogo" role="banner"><a href="http://grails.org"><img src="${resource(dir: 'images', file: 'gyro_logo.jpg')}" alt="Grails"/></a></div>
		<sec:ifNotLoggedIn>
			<div id="secSeguridad">
			<div id="loginContainer">
				<a href="#" id="loginButton"><span>Iniciar</span><em></em></a>
		        <div id="loginBox">
		        	<form id='loginForm' name='loginForm' action='${request.contextPath}/j_spring_security_check?ajax=true' method='POST'>
       						<fieldset id="body">
		                    <fieldset>
		                        <label for="username">Email Address</label>
         						<input type='text' class='text_' name='j_username' id='username' />
		                    </fieldset>
		                    <fieldset>
		                        <label for="password">Password</label>
		                        <input type="password" name="j_password" id="password" />
		                    </fieldset>
		                    <input type="button" id="login" value="Entrar" onclick='authAjax()' />
		                    <label for="checkbox">
		                    <input type="checkbox" id="remember_me" name='_spring_security_remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if> />Remember me</label>
		                </fieldset>
		                <div id="ajaxLoginError">asdasdas</div>
		                <span><a href="#">Forgot your password?</a></span>
		            </form>
		        </div>
		    </div>   
		    </div>       
		</sec:ifNotLoggedIn>
		<sec:ifLoggedIn>
			<div id="secSeguridad">
				<a href="/gyro-adn/logout" id="logoutButton"><span><sec:username /></span></a>
			</div>
		</sec:ifLoggedIn>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
        <r:layoutResources />
	</body>
</html>

