<r:require modules="easygrid-visualization-dev,jquery-dev,export"/>

<grid:grid name='authorVisualization'  />
<grid:exportButton name='authorVisualization' formats="['csv', 'excel']"/>

<h1 id="source-code">Source Code</h1>

<markdown:renderHtml>

    authorVisualization {
        dataSourceType 'gorm'
        domainClass Author
        gridImpl 'visualization'
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
                filterClosure { filter ->
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

GSP:
<markdown:renderHtml>
    <r:require modules="easygrid-visualization-dev,jquery-dev,export"/>

    <grid:grid name='authorVisualization'  />
    <grid:exportButton name='authorVisualization' formats="['csv', 'excel']"/>
</markdown:renderHtml>

