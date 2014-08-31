<!doctype html>
<html>
<head>
    <meta name="layout" content="grid">
    <title>JqGrid example</title>

    <asset:javascript src="easygrid.jqgrid.js"/>
    <asset:stylesheet src="easygrid.jqgrid.css"/>

</head>

<body>

<asset:script type="text/javascript">
    function customWikiFormat(cellvalue, options, rowObject) {
        // format the cellvalue to new format
        var authorTokens = cellvalue.split(' ');
        var author = '';
        authorTokens.map(function (item) {
            author = author + "_" + item;
        });
        return "<a href='http://en.wikipedia.org/wiki/" + author.substring(1) + "'>" + cellvalue + "</a> ";
    }
    function wikiUnFormat( cellvalue, options){
        return cellvalue;
    }
</asset:script>


<grid:grid id='jqgridinitial' name='authorJQGrid'>
    <grid:set  width="900" caption="Authors"/>
    <grid:set col="name" formatter='f:customWikiFormat' unformat="f:wikiUnFormat"/>
</grid:grid>

<grid:exportButton name='authorJQGrid'/>

<fieldset>
    <legend>Source Code:</legend>
    <src:controller from="75" to="116"/>
    <src:gsp gsp="jqgrid" from="7" to="9"/>
    <src:gsp gsp="jqgrid" from="13" to="36"/>
</fieldset>


<asset:deferredScripts/>

</body>
</html>
