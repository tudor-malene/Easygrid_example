<!doctype html>
<html>
<head>
    <meta name="layout" content="grid">
    <title>Datatables with filter example</title>

    <asset:javascript src="easygrid.datatables.js"/>
    <asset:stylesheet src="easygrid.datatables.css"/>
</head>

<body>

<sec:ifNotLoggedIn>
    <h3>To be able to view the content you need to <a
            href="${createLink(controller: 'login', action: 'auth')}">login</a>  with: me/password</h3>
</sec:ifNotLoggedIn>

<grid:grid name='authorDatatablesOverBill'>
    <grid:set sScrollX="100%" sScrollXInner="100%" bScrollCollapse="true"/>
    <grid:set col="name" sWidth="250px"/>
    <grid:set col="minEstSales" sWidth="70px" />
    <grid:set col="maxEstSales" sWidth="70px"/>
    <grid:set col="language" sWidth="80px"/>
    <grid:set col="nrBooks" sWidth="40px"/>
    <grid:set col="nationality" sWidth="40px"/>
</grid:grid>

<grid:exportButton name='authorDatatablesOverBill'/>

<fieldset>
    <legend>Source Code:</legend>
    <src:controller from="192" to="217"/>
    <src:gsp gsp="dataTablesFilter" from="17" to="29"/>
</fieldset>

</body>
</html>
