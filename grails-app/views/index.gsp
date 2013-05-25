<!DOCTYPE html>
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
				width: 12em;
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

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 6em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
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
		</style>
	</head>
	<body>
        <div class="hero-unit">
            <div id="myCarousel" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                </ol>
                <!-- Carousel items -->
                <div class="carousel-inner">
                    <div class="active item">
                        <img src="images/grails_logo_banner1.png" alt="Grails">
                        <div class="carousel-caption">
                            <h4>GRAILS - The search is over</h4>
                            <p>Grails is a powerful web framework that makes web development easy and fun!</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/grails_logo_banner2.png" alt="Grails">
                        <div class="carousel-caption">
                            <h4>Are you still not convinved?</h4>
                            <p>Well, someone should add some more reasons here, why Grails is freaking awesome!</p>
                        </div>
                    </div>
                </div>
                <!-- Carousel nav -->
                <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="span2">
                    <div id="status" role="complementary">
                        <h1>Application Status</h1>
                        <ul>
                            <li>App version: <g:meta name="app.version"/></li>
                            <li>Grails version: <g:meta name="app.grails.version"/></li>
                            <li>Groovy version: ${GroovySystem.getVersion()}</li>
                            <li>JVM version: ${System.getProperty('java.version')}</li>
                            <li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
                            <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
                            <li>Domains: ${grailsApplication.domainClasses.size()}</li>
                            <li>Services: ${grailsApplication.serviceClasses.size()}</li>
                            <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
                        </ul>
                        <h1>Installed Plugins</h1>
                        <ul>
                            <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                                <li>${plugin.name} - ${plugin.version}</li>
                            </g:each>
                        </ul>
                    </div>
                </div>
                <div class="span10">
                    <div id="page-body" role="main">
                        <h1>Welcome to Grails</h1>
                        <p>Congratulations, you have successfully started your first Grails application! At the moment
                           this is the default page, feel free to modify it to either redirect to a controller or display whatever
                           content you may choose. Below is a list of controllers that are currently deployed in this application,
                           click on each to execute its default action:</p>

                        <div id="controller-list" role="navigation">
                            <h2>Available Controllers:</h2>
                            <ul>
                                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                                    <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                                </g:each>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</body>
</html>
