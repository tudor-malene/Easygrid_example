<grid:exportButton name='authorClassic'/>

<grid:grid name='authorClassic'/>

<h1 id="source-code">Source Code</h1>
<pre><code>
    authorClassic {
        dataSourceType &#39;domain&#39;
        domainClass Author
        gridImpl &#39;classic&#39;
        columns {
            id {
                type &#39;id&#39;
            }
            name
            minEstSales {
                formatName &#39;nrToString&#39;
            }
            maxEstSales {
                formatName &#39;nrToString&#39;
            }
            language
            nrBooks
            nationality
        }
    }
</code></pre>