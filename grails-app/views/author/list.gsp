<%@ page import="example.Author" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'author.label', default: 'Author')}"/>

    <r:script>
        function customWikiFormat(cellvalue, options, rowObject) {
            // format the cellvalue to new format
            var authorTokens = cellvalue.split(' ');
            var author = '';
            authorTokens.map(function (item) {
                author = author + "_" + item;
            })
            return "<a href='http://en.wikipedia.org/wiki/" + author.substring(1) + "'>" + cellvalue + "</a> ";
        }
    </r:script>

    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-author" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>

        <li><a href="${g.createLink(action: 'list', params: [impl: 'classical'])}">Grails</a></li>

        <li><a href="${g.createLink(action: 'list', params: [impl: 'jqgrid'])}">JQGrid</a></li>

        <li><a href="${g.createLink(action: 'list', params: [impl: 'visualization'])}">Google Visualization</a></li>

        <li><a href="${g.createLink(action: 'list', params: [impl: 'datatables'])}">Datatable (alpha)</a></li>


    </ul>
</div>

<div id="list-author" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>


    <g:if test="${params.impl == 'jqgrid'}">
        <r:require modules="easygrid-jqgrid-dev"/>
        To be able to view the content you need to login with: me/password
        <grid:grid id='authorJQGrid'/>
        <grid:exportButton id='authorJQGrid'/>
    </g:if>
    <g:elseif test="${params.impl == 'visualization'}">
        <r:require modules="easygrid-visualization-dev"/>
        <grid:grid id='authorVisualization'/>
        <grid:exportButton id='authorVisualization'/>
    </g:elseif>
    <g:elseif test="${params.impl == 'datatables'}">
        <r:require modules="easygrid-datatables-dev"/>
        <grid:grid id='authorDatatables'/>
        <grid:exportButton id='authorDatatables'/>
    </g:elseif>
    <g:else>
        <grid:grid id='authorClassic'/>
        <grid:exportButton id='authorClassic'/>
    </g:else>

</div>
</body>
</html>
