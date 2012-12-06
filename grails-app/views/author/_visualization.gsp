<r:require modules="easygrid-visualization-dev,jquery-dev"/>

<grid:exportButton name='authorVisualization'/>
<grid:grid name='authorVisualization'/>

<h1 id="source-code">Source Code</h1>

             <pre><code>
    authorVisualization {
        dataSourceType &#39;domain&#39;
        domainClass Author
        gridImpl &#39;visualization&#39;
        visualization {
            page &#39;enable&#39;
            allowHtml true
            alternatingRowStyle true
            showRowNumber false
            pageSize 10
        }
        columns {
            id {
                type &#39;id&#39;
            }
            name {
                filterClosure {params -&gt;
                    ilike(&#39;name&#39;, &quot;%${params.name}%&quot;)
                }
                visualization {
                    search true
                }
            }
            minEstSales {
                formatName &#39;nrToString&#39;
            }
            maxEstSales {
                formatName &#39;nrToString&#39;
                filterClosure {params -&gt;
                    gt(&#39;maxEstSales&#39;, new BigInteger(params.maxEstSales))
                }
                visualization {
                    search true
                    searchType &#39;number&#39;
                }
            }
            language {
                filterClosure {params -&gt;
                    ilike(&#39;language&#39;, &quot;%${params.language}%&quot;)
                }
                visualization {
                    search true
                }
            }
            nrBooks
            nationality {
                filterClosure {params -&gt;
                    ilike(&#39;nationality&#39;, &quot;%${params.nationality}%&quot;)
                }
                visualization {
                    search true
                }
            }
        }
    }</code></pre>
