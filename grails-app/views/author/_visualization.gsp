<r:require modules="easygrid-visualization-dev,jquery-dev,export"/>

<grid:grid name='authorVisualization'/>
<grid:exportButton name='authorVisualization' formats="['csv', 'excel']"/>


<h1 id="source-code">Source Code</h1>

<markdown:renderHtml>

    def authorVisualizationGrid = {
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
