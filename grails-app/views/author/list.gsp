<%@ page import="example.Author" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'author.label', default: 'Author')}"/>

    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-author" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>

        <li><a href="${g.createLink(action: 'list', params: [impl: 'classic'])}">Grails</a></li>

        <li><a href="${g.createLink(action: 'list', params: [impl: 'jqgrid'])}">JQGrid</a></li>

        <li><a href="${g.createLink(action: 'list', params: [impl: 'visualization'])}">Google Visualization</a></li>

        <li><a href="${g.createLink(action: 'list', params: [impl: 'dataTables'])}">DataTables</a></li>

        <li><a href="${g.createLink(action: 'list', params: [impl: 'dataTablesFilter'])}">DataTables(with Filter)</a></li>

        %{--<li><a href="${g.createLink(action: 'list', params: [impl: 'ngGrid'])}">Ng Grid</a></li>--}%

        <li><g:link class="create" action="create" controller="book">Selection Widget</g:link></li>

    </ul>
</div>

<div id="list-author" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:if test="${params.impl == null}">
        <g:set var="template" value="classic"/>
    </g:if>
    <g:else>
        <g:set var="template" value="${params.impl}"/>
    </g:else>

    <g:render template="${template}"/>

</div>
</body>
</html>
