<!doctype html>
<html>
<head>
    <meta name="layout" content="grid">
    <title>Visualization Chart example</title>

    <asset:javascript src="easygrid.visualization.js"/>
    <asset:stylesheet src="easygrid.visualization.css"/>
</head>

<body>

<grid:grid
        name='authorVisualizationChart'
        id='authorChart'
        gridRenderer="/templates/visualizationChartRenderer" >
    <grid:set height="450px" width="900px" title="Author" vAxis="{title: 'Name',  titleTextStyle: {color: 'red'}}"/>
</grid:grid>

<fieldset>
    <legend>Source Code:</legend>
    <src:controller from="142" to="163"/>
    <src:gsp gsp="visualizationChart" from="12" to="19"/>
</fieldset>

</body>
</html>
