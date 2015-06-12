<ul class="nav pull-right">
	<li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown" href="#">
    		<span class="icon-wrench glyphicon-inverse"></span>
			<g:message code="default.admin.label"/><b class="caret"></b>
		</a>
		<ul class="dropdown-menu">
			<li class="">
				<a tabindex="-1" href="#"><b>Ajustes Técnicos</b></a>
			</li>
            <li class="">
                <a href="${createLink(uri: '/configuracion')}">
                    <span class="icon-wrench glyphicon-inverse"></span>
                    <g:message code="default.configuration.label"/>
                </a>
            </li>
			<g:if env="development">
			<li class="">
				<a href="${createLink(uri: '/dbconsole')}">
					<span class="icon-dashboard icon-white"></span>
					<g:message code="default.dbconsole.label"/>
				</a>
			</li>
			</g:if>
			<li class="">
				<a href="${createLink(uri: '/systeminfo')}">
					<span class="icon-info-sign icon-white"></span>
					<g:message code="default.systeminfo.label"/>
				</a>
			</li>
			<li class="dropdown-submenu">
				<a tabindex="-1" href="#">
					<span class="icon-sitemap icon-white"></span>
					All Controller
				</a>
				<ul class="dropdown-menu">
					<li class="controller"><g:link controller="home">HomeController</g:link></li>
					<li class="divider"></li>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.logicalPropertyName } }">
						<g:if test="${c.logicalPropertyName != 'home'}">
							<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.logicalPropertyName?.capitalize()}</g:link></li>
							%{--<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.logicalPropertyName?.split('(?=[A-Z])')}</g:link></li>--}%
							%{--<li class="controller"><g:link controller="${c.logicalPropertyName}">${c?.fullName?.substring(c?.fullName?.lastIndexOf('.')+1)}</g:link></li>--}%
						</g:if>
					</g:each>
				</ul>
			</li>
		</ul>
	</li>
</ul>
