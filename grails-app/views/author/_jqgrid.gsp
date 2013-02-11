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


<r:require modules="easygrid-jqgrid-dev,export"/>

<grid:grid id='jqgridinitial' name='authorJQGrid' jqgrid.caption="'Author List'" jqgrid.width='"900"' columns.name.jqgrid.formatter='customWikiFormat'/>

<grid:exportButton name='authorJQGrid'/>

<h1 id="source-code">Source Code</h1>

<markdown:renderHtml>

    authorJQGrid {
        dataSourceType 'gorm'
        domainClass Author
        gridImpl 'jqgrid'
        inlineEdit true
        enableFilter true
        export {
            export_title 'Author'
            pdf {
                'border.color' java.awt.Color.BLUE
            }
        }
        columns {
            actions {
                type 'actions'
            }
            id {
                type 'id'
            }
            name {
                jqgrid {
                    editable false
                }
            }
            minEstSales {
                enableFilter false
                formatName 'nrToString'
                jqgrid {
                    editable false
                }
            }
            maxEstSales {
                enableFilter false
                formatName 'nrToString'
                jqgrid {
                    editable false
                }
            }
            language {
                jqgrid {
                    editable true
                }
            }
            nrBooks {
                enableFilter false
                jqgrid {
                    editable true
                }
            }
            nationality {
                jqgrid {
                    editable true
                }
            }
            version {
                type 'version'
            }
        }
    }

</markdown:renderHtml>
GSP:
<markdown:renderHtml>
    < grid:grid id='jqgridinitial' name='authorJQGrid'
    jqgrid.caption="'Author List'"
    jqgrid.width='"900"'
    columns.name.jqgrid.formatter='customWikiFormat'/>
</markdown:renderHtml>
