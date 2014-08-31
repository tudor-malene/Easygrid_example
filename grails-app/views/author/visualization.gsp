<!doctype html>
<html>
<head>
    <meta name="layout" content="grid">
    <title>Visualization example</title>

    <asset:javascript src="easygrid.visualization.js"/>
    <asset:stylesheet src="easygrid.visualization.css"/>
</head>

<body>

<grid:grid name='authorVisualization'/>
<grid:exportButton name='authorVisualization' formats="['csv', 'excel']"/>


<fieldset>
    <legend>Source Code:</legend>
    <src:controller from="116" to="142"/>
    <src:gsp gsp="visualization" from="12" to="15"/>
</fieldset>

</body>
</html>
