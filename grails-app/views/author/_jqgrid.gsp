<r:script>
    function customWikiFormat(cellvalue, options, rowObject) {
        // format the cellvalue to new format
        var authorTokens = cellvalue.split(' ');
        var author = '';
        authorTokens.map(function (item) {
            author = author + "_" + item;
        })
        return "<a href='http://en.wikipedia.org/wiki/" + author.substring(1) + "'>" + cellvalue + "</a> ";
    }
</r:script>


<r:require modules="easygrid-jqgrid-dev"/>

<grid:exportButton id='jqgridmodified' name='authorJQGrid'/>
%{--<grid:grid id='jqgridmodified' name='authorJQGrid' columns[7].jqgrid.editable='false' />--}%

<grid:grid id='jqgridinitial' name='authorJQGrid' />


<h1 id="source-code">Source Code</h1>

<pre><code>
    authorJQGrid {
        dataSourceType &#39;domain&#39;
        domainClass Author
        gridImpl &#39;jqgrid&#39;
        inlineEdit true
        jqgrid {
            width &#39;&quot;900&quot;&#39;
        }
        columns {
            actions {
                type &#39;actions&#39;
            }
            id {
                type &#39;id&#39;
            }
            name {
                filterClosure {params -&gt;
                    ilike(&#39;name&#39;, &quot;%&#36;{params.name}%&quot;)
                }
                jqgrid {
                    editable false
                    // this will create a link to the wikipedia page
                    formatter &#39;customWikiFormat&#39;
                }
            }
            minEstSales {
                formatName &#39;nrToString&#39;
                jqgrid {
                    editable false
                    search false
                }
            }
            maxEstSales {
                formatName &#39;nrToString&#39;
                jqgrid {
                    editable false
                    search false
                }
            }
            language {
                filterClosure {params -&gt;
                    ilike(&#39;language&#39;, &quot;%&#36;{params.language}%&quot;)
                }
                jqgrid {
                    editable true
                }
            }
            nrBooks {
                jqgrid {
                    editable true
                    search false
                }
            }
            nationality {
                filterClosure {params -&gt;
                    ilike(&#39;nationality&#39;, &quot;%&#36;{params.nationality}%&quot;)
                }
                jqgrid {
                    editable true
                }
            }
            version {
                type &#39;version&#39;
            }
        }
    }
 </code></pre>