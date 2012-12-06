
<r:require modules="easygrid-datatables-dev"/>
<grid:exportButton name='authorDatatables'/>
<grid:grid name='authorDatatables'/>

<h1 id="source-code">Source Code</h1>


                   <pre><code>
    authorDatatables {
        dataSourceType &#39;domain&#39;
        domainClass Author
        gridImpl &#39;dataTables&#39;
        columns {
            id {
                type &#39;id&#39;
            }
            name {
                filterClosure {params -&gt;
                    ilike(&#39;name&#39;, &quot;%${params.name}%&quot;)
                }
                dataTables {
                    search true
                }
            }
            minEstSales {
                formatName &#39;nrToString&#39;
            }
            maxEstSales {
                filterClosure {params -&gt;
                    gt(&#39;maxEstSales&#39;, new BigInteger(params.maxEstSales))
                }
                formatName &#39;nrToString&#39;
                dataTables {
                    search true
                }
            }
            language {
                filterClosure {params -&gt;
                    ilike(&#39;language&#39;, &quot;%${params.language}%&quot;)
                }
                dataTables {
                    search true
                }
            }
            nrBooks
            nationality {
                filterClosure {params -&gt;
                    ilike(&#39;nationality&#39;, &quot;%${params.nationality}%&quot;)
                }
                dataTables {
                    search true
                }
            }
        }
    }</code></pre>

