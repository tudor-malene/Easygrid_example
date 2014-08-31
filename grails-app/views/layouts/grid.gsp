<!DOCTYPE html>
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
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
    <asset:javascript src="application.js"/>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="export.css"/>
    <g:layoutHead/>
</head>

<body>
<div id="grailsLogo" role="banner"><a href="http://grails.org"><asset:image src="grails_logo.png" alt="Grails"/></a></div>

<a href="#list-author" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a href="${g.createLink(action: 'classic')}">Static</a></li>
        <li><a href="${g.createLink(action: 'jqgrid')}">JQGrid</a></li>
        <li><a href="${g.createLink(action: 'tree')}">TreeGrid</a></li>

        <li><a href="${g.createLink(action: 'visualization')}">Google Visualization</a></li>
        %{--<li><a href="${g.createLink(action: 'list', params: [impl: 'visualizationChart'])}">Chart</a></li>--}%

        <li><a href="${g.createLink(action: 'dataTables')}">DataTables</a></li>

        <li><a href="${g.createLink(action: 'dataTablesFilter')}">DataTables(with Filter)</a></li>

        %{--<li><a href="${g.createLink(action: 'list', params: [impl: 'ngGrid'])}">Ng Grid</a></li>--}%

        <li><g:link class="create" action="create" controller="book">Selection Widget</g:link></li>
    </ul>
</div>

<div id="list-author" class="content scaffold-list" role="main">
    <h1>Authors</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:layoutBody/>
</div>
<div class="footer" role="contentinfo"></div>
<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>

</body>
</html>
