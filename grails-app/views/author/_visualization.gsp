<r:require modules="easygrid-visualization-dev,jquery-dev,export"/>

<grid:filterForm name="authorVisualization"/>
<grid:grid name='authorVisualization'/>
<grid:exportButton name='authorVisualization' formats="['csv', 'excel']"/>


<h1 id="source-code">Source Code</h1>

<markdown:renderHtml>

    def authorVisualizationGrid = {
         dataSourceType 'gorm'
         domainClass Author
         gridImpl 'visualization'
         filterForm {
             fields {
                 'ff.name' {
                     label 'name'
                     type 'text'
                 }
                 'estSales' {
                     label 'estSales'
                     type 'interval'
                     filterClosure { Filter filter ->
                         if (params.estSales.from && params.estSales.to) {
                             between('maxEstSales', params.estSales.from as BigInteger, params.estSales.to as BigInteger)
                         }
                     }
                 }
             }
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

<h1 id="gsp">GSP</h1>
<pre>
<code>
    &lt;r:require modules="easygrid-visualization-dev,jquery-dev,export"/&gt;

    &lt;grid:grid name='authorVisualization'/&gt;
    &lt;grid:exportButton name='authorVisualization' formats="['csv', 'excel']"/&gt;
</code>
</pre>
