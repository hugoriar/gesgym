<%@ page import="org.control.calendario.Event" %>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
    <style>
        html, body {
            height: 100%;
            width: 100%;
            line-height: 1 !important;
        }
        #content {
            width: 900px;
            height: 700px;
        }
    </style>
</head>

<body style="line-height: 0 !important;">

<section id="create-event" class="first">

	<g:hasErrors bean="${eventInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${eventInstance}" as="list" />
	</div>
	</g:hasErrors>
    %{--${sample_name}--}%
    <div class="content" id="content">
        <div id="planner">${planner}</div>
    </div>
	
</section>
		
</body>

</html>
