<r:require modules="easygrid-visualization-dev,jquery-dev,export"/>

<grid:filterForm name="authorVisualization"/>

<grid:grid name='authorVisualization'/>
<grid:exportButton name='authorVisualization' formats="['csv', 'excel']"/>

%{--
<grid:grid
        name='authorVisualizationChart'
        id='authorChart'
        gridRenderer="/templates/visualizationChartRenderer"
        visualization.title= "'Author'"
        visualization.vAxis= "{title: 'Name',  titleTextStyle: {color: 'red'}}"
/>
--}%

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

<pre><code>
    GSP:

    &lt;r:require modules="easygrid-visualization-dev,jquery-dev,export"/&gt;
    &lt;grid:grid name='authorVisualization'/&gt;
    &lt;grid:exportButton name='authorVisualization' formats="['csv', 'excel']"/&gt;
</code></pre>


