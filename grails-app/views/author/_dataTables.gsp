<r:require modules="easygrid-datatables-dev,export"/>
<grid:filterForm name="authorDatatables" />
<grid:grid name='authorDatatables' />
<grid:exportButton name='authorDatatables'/>

<h1 id="source-code">Source Code</h1>

<markdown:renderHtml>
    authorDatatables {
        dataSourceType 'gorm'
        domainClass Author
        gridImpl 'dataTables'
        fixedColumns true
        columns {
            name{
                formatName 'authorWikiFormat'
            }
            minEstSales {
                enableFilter false
                formatName 'nrToString'
            }
            maxEstSales {
                filterClosure { filter ->
                    gt('maxEstSales', filter.paramValue as BigInteger)
                }
                formatName 'nrToString'
            }
            language
            nrBooks {
                enableFilter false
            }
            nationality
        }
    }
</markdown:renderHtml>

