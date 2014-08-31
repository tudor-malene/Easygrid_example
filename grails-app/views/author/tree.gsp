<!doctype html>
<html>
<head>
    <meta name="layout" content="grid">
    <title>TreeGrid example</title>

    <asset:javascript src="easygrid.jqgrid.js"/>
    <asset:stylesheet src="easygrid.jqgrid.css"/>
</head>

<body>

<grid:grid name='jqgridTree'>
    <grid:set caption="Author Tree" width="400" height="200"/>
</grid:grid>


<fieldset>
    <legend>Source Code:</legend>
    <src:controller from="217" to="298"/>
    <src:gsp gsp="tree" from="12" to="16"/>
</fieldset>

</body>
</html>
