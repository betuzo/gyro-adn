<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 16em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}

			/*- Menu--------------------------- */
	
			#menu2 {
				width: 200px;
				border-style: solid solid none solid;
				border-color: #eee;
				}
				
			#menu2 li a {
				height: 42px;
			  	voice-family: "\"}\""; 
			  	voice-family: inherit;
			  	height: 35px;
				text-decoration: none;
				}	
				
			#menu2 li a:link, #menu2 li a:visited {
				color: #3688BA;
				display: block;
				background-color: #eee;
				padding: 8px 0 0 30px;
				}
				
			#menu2 li a:hover {
				color: #3688BA;
				background-color: #fff;
				padding: 8px 0 0 32px;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
				}
				
	
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
			
			<h1>Home</h2>
			<div id="menu2">
					<ul>
						<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.naturalName } }">
							<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.naturalName}</g:link>
							</li>
						</g:each>

					</ul>
			</div>
		</div>
		<div id="page-body" role="main">
			<h1>Gyro</h1>
			<p>El marketing es la orientación con la que se administra el mercadeo o la comercialización dentro de una organización. Así mismo, busca fidelizar clientes, mediante herramientas y estrategias; posiciona en la mente del consumidor un producto, marca, etc. buscando ser la opción principal y llegar al usuario final; parte de las necesidades del cliente o consumidor, para diseñar, organizar, ejecutar y controlar la función comercializadora o mercadeo de la organización.</p>
		</div>
	</body>
</html>
