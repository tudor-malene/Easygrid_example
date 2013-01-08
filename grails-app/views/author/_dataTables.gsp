
<r:require modules="easygrid-datatables-dev"/>
<grid:exportButton name='authorDatatables'/>
<grid:grid name='authorDatatables'/>

<h1 id="source-code">Source Code</h1>

<markdown:renderHtml>
    authorDatatables {
        dataSourceType 'gorm'
        domainClass Author
        gridImpl 'dataTables'
        columns {
            id {
                type 'id'
            }
            name
            minEstSales {
                enableFilter false
                formatName 'nrToString'
            }
            maxEstSales {
                filterClosure {filter ->
                    gt('maxEstSales', filter.paramValue as BigInteger)
                }
                formatName 'nrToString'
            }
            language
            nrBooks  {
                enableFilter false
            }
            nationality
        }
    }
</markdown:renderHtml>

