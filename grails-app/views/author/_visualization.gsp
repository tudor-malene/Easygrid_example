<r:require modules="easygrid-visualization-dev,jquery-dev"/>

<grid:exportButton name='authorVisualization'/>
<grid:grid name='authorVisualization'/>

<h1 id="source-code">Source Code</h1>

<markdown:renderHtml>

    authorVisualization {
        dataSourceType 'gorm'
        domainClass Author
        gridImpl 'visualization'
        visualization {
            page 'enable'
            allowHtml true
            alternatingRowStyle true
            showRowNumber false
            pageSize 10
        }
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
                formatName 'nrToString'
                filterClosure {filter ->
                    gt('maxEstSales', filter.paramValue as BigInteger)
                }
                visualization {
                    searchType 'number'
                }
            }
            language
            nrBooks {
                enableFilter false
            }
            nationality
        }
    }

</markdown:renderHtml>

