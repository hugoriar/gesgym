<!-- 
This modal is used to show a button that initiates the delete action.
-->

<!-- Button to trigger modal if Javascript is available -->
	<a href="#ExpirarModal" role="button" class="" data-toggle="modal" title="${message(code: 'default.button.expirarPassword.label', default: 'Expirar Contraseña')}">
		%{--<i class="icon-trash"></i>--}%
		<g:message code="default.button.expirarPassword.label" default=" (Expirar)"/>
	</a>

	<g:render template="/_common/modals/expirarPasswordDialog"/>
