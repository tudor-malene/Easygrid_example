<!doctype html>
<html>
<head>
    <meta name="layout" content="grid">
    <title>Datatables example</title>

    <asset:javascript src="easygrid.datatables.js"/>
    <asset:stylesheet src="easygrid.datatables.css"/>
</head>

<body>

<grid:grid name='authorDatatables'/>
<grid:exportButton name='authorDatatables'/>

<br>
<fieldset>
    <legend>Source Code:</legend>
    <src:controller from="163" to="191"/>
    <src:gsp gsp="dataTables" from="12" to="14"/>
</fieldset>

</body>
</html>
