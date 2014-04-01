
<r:require modules="easygrid-visualization-dev,jquery-dev,export"/>

<grid:grid
        name='authorVisualizationChart'
        id='authorChart'
        gridRenderer="/templates/visualizationChartRenderer" >
    <grid:set height="450px" width="900px" title="Author" vAxis="{title: 'Name',  titleTextStyle: {color: 'red'}}"/>
</grid:grid>

<h1 id="source-code">Source Code</h1>

<markdown:renderHtml>

    authorVisualizationChart {
        dataSourceType 'gorm'
        domainClass Author
            initialCriteria {
                gte('maxEstSales', 500000000G)
            }
        gridImpl 'visualization'
        columns {
            name
            minEstSales {
                visualization {
                    valueType = com.google.visualization.datasource.datatable.value.ValueType.NUMBER
                }
            }
            maxEstSales {
                visualization {
                    valueType = com.google.visualization.datasource.datatable.value.ValueType.NUMBER
                }
            }
        }
    }

</markdown:renderHtml>

<h1 id="gsp">GSP</h1>
<pre>
    <code>
        <markdown:renderHtml>
            &lt;r:require modules="easygrid-visualization-dev,jquery-dev,export"/&gt;

            < grid:grid
                    name='authorVisualizationChart'
                    id='authorChart'
                    gridRenderer="/templates/visualizationChartRenderer"
                    visualization.title="'Author'"
                    visualization.vAxis="{title: 'Name',  titleTextStyle: {color: 'red'}}"
                    width="900px"
                    height="450px"
                    />

        </markdown:renderHtml>
    </code>
</pre>
