<%@ page import="example.Author" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'author.label', default: 'Author')}"/>

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

    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-author" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>

        <li><a href="${g.createLink(action: 'list', params: [impl: 'classical'])}">Grails</a></li>

        <li><a href="${g.createLink(action: 'list', params: [impl: 'jqgrid'])}">JQGrid</a></li>

        <li><a href="${g.createLink(action: 'list', params: [impl: 'visualization'])}">Google Visualization</a></li>

        <li><a href="${g.createLink(action: 'list', params: [impl: 'datatables'])}">Datatables </a></li>

        <li><a href="${g.createLink(action: 'list', params: [impl: 'authorDatatablesOverBill'])}">Datatables -over 1Billion </a></li>


    </ul>
</div>

<div id="list-author" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>


    <g:if test="${params.impl == 'jqgrid'}">
        <r:require modules="easygrid-jqgrid-dev"/>
        To be able to view the content you need to login with: me/password
        <grid:grid id='authorJQGrid'/>
        <grid:exportButton id='authorJQGrid'/>

        <pre><code>
        authorJQGrid {
            dataSourceType &#39;domain&#39;
            domainClass Author
            gridImpl &#39;jqgrid&#39;
            inlineEdit true
            jqgrid {
              width &#39;&quot;900&quot;&#39;
            }
            roles &#39;ROLE_USER&#39;
            columns {
                &#39;actions&#39; {
                   type &#39;actions&#39;
                }
                &#39;author.id.label&#39; {
                   type &#39;id&#39;
                }
                &#39;author.name.label&#39; {
                    property &#39;name&#39;
                    jqgrid {
                        editable false
                        // this will create a link to the wikipedia page
                        formatter &#39;customWikiFormat&#39;
                        searchClosure {params -&gt;
                            ilike(&#39;name&#39;, &quot;%${params.name}%&quot;)
                        }
                    }
                }
                &#39;author.minEstSales.label&#39; {
                    property &#39;minEstSales&#39;
                    formatName &#39;nrToString&#39;
                    jqgrid {
                        editable false
                        search false
                    }
                }
                &#39;author.maxEstSales.label&#39; {
                    property &#39;maxEstSales&#39;
                    formatName &#39;nrToString&#39;
                    jqgrid {
                        editable false
                        search false
                    }
                }
                &#39;author.language.label&#39; {
                    property &#39;language&#39;
                    jqgrid {
                        editable true
                        searchClosure {params -&gt;
                            ilike(&#39;language&#39;, &quot;%${params.language}%&quot;)
                        }
                    }
                }
                &#39;author.nrBooks.label&#39; {
                    property &#39;nrBooks&#39;
                    jqgrid {
                        editable true
                        search false
                    }
                }
                &#39;author.nationality.label&#39; {
                    property &#39;nationality&#39;
                    jqgrid {
                        editable true
                        searchClosure {params -&gt;
                            ilike(&#39;nationality&#39;, &quot;%${params.nationality}%&quot;)
                        }
                    }
                }
                &#39;version&#39; {
                    type &#39;version&#39;
                }
            }
        }
        </code></pre>


    </g:if>
    <g:elseif test="${params.impl == 'visualization'}">
        <r:require modules="easygrid-visualization-dev,jquery-dev"/>
        <grid:grid id='authorVisualization'/>
        <grid:exportButton id='authorVisualization'/>

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
                &#39;author.id.label&#39; {
                   type &#39;id&#39;
                }
                &#39;author.name.label&#39; {
                    property &#39;name&#39;
                    visualization {
                        search true
                        searchClosure {params -&gt;
                            ilike(&#39;name&#39;, &quot;%${params.name}%&quot;)
                        }
                    }
                }
                &#39;author.minEstSales.label&#39; {
                    property &#39;minEstSales&#39;
                    formatName &#39;nrToString&#39;
                }
                &#39;author.maxEstSales.label&#39; {
                    property &#39;maxEstSales&#39;
                    formatName &#39;nrToString&#39;
                    visualization {
                        search true
                        searchType &#39;number&#39;
                        searchClosure {params -&gt;
                            gt(&#39;maxEstSales&#39;, new BigInteger(params.maxEstSales))
                        }
                    }
                }
                &#39;author.language.label&#39; {
                    property &#39;language&#39;
                    visualization {
                        search true
                        searchClosure {params -&gt;
                            ilike(&#39;language&#39;, &quot;%${params.language}%&quot;)
                        }
                    }
                }
                &#39;author.nrBooks.label&#39; {
                    property &#39;nrBooks&#39;
                }
                &#39;author.nationality.label&#39; {
                    property &#39;nationality&#39;
                    visualization {
                        search true
                        searchClosure {params -&gt;
                            ilike(&#39;nationality&#39;, &quot;%${params.nationality}%&quot;)
                        }
                    }
                }
            }
        }
        </code></pre>


    </g:elseif>
    <g:elseif test="${params.impl == 'datatables'}">
        <r:require modules="easygrid-datatables-dev"/>
        <grid:grid id='authorDatatables'/>
        <grid:exportButton id='authorDatatables'/>
        <pre><code>
        authorDatatables {
            dataSourceType &#39;domain&#39;
            domainClass Author
            gridImpl &#39;datatable&#39;
            columns {
                &#39;author.id.label&#39; {
                    type &#39;id&#39;
                }
                &#39;author.name.label&#39; {
                property &#39;name&#39;
                    datatable {
                    search true
                    searchClosure {params -&gt;
                        ilike(&#39;name&#39;, &quot;%${params.name}%&quot;)
                    }
                    }
                }
                &#39;author.minEstSales.label&#39; {
                    property &#39;minEstSales&#39;
                    formatName &#39;nrToString&#39;
                }
                &#39;author.maxEstSales.label&#39; {
                    property &#39;maxEstSales&#39;
                    formatName &#39;nrToString&#39;
                    datatable {
                        search true
                        searchClosure {params -&gt;
                            gt(&#39;maxEstSales&#39;, new BigInteger(params.maxEstSales))
                        }
                    }
                }
                &#39;author.language.label&#39; {
                    property &#39;language&#39;
                    datatable {
                        search true
                        searchClosure {params -&gt;
                            ilike(&#39;language&#39;, &quot;%${params.language}%&quot;)
                        }
                    }
                }
                &#39;author.nrBooks.label&#39; {
                    property &#39;nrBooks&#39;
                }
                &#39;author.nationality.label&#39; {
                    property &#39;nationality&#39;
                    datatable {
                        search true
                        searchClosure {params -&gt;
                            ilike(&#39;nationality&#39;, &quot;%${params.nationality}%&quot;)
                        }
                    }
                }
            }
        }
        </code></pre>


    </g:elseif>
    <g:elseif test="${params.impl == 'authorDatatablesOverBill'}">
        <r:require modules="easygrid-datatables-dev"/>
        <grid:grid id='authorDatatablesOverBill'/>
        <grid:exportButton id='authorDatatablesOverBill'/>

        <pre><code>
        authorDatatablesOverBill {
            dataSourceType &#39;domain&#39;
            domainClass Author
            gridImpl &#39;datatable&#39;
            initialCriteria {
                gte(&#39;maxEstSales&#39;, 1000000000G)
            }
            columns {
                &#39;author.id.label&#39; {
                    type &#39;id&#39;
                }
                name
                &#39;author.minEstSales.label&#39; {
                    property &#39;minEstSales&#39;
                    formatName &#39;nrToString&#39;
                }
                &#39;author.maxEstSales.label&#39; {
                    property &#39;maxEstSales&#39;
                    formatName &#39;nrToString&#39;
                }
                language
                nrBooks
                nationality
            }
        }
        </code></pre>

    </g:elseif>
    <g:else>
        <grid:grid id='authorClassic'/>
        <grid:exportButton id='authorClassic'/>

        <pre><code>

        authorClassic {
            dataSourceType &#39;domain&#39;
            domainClass Author
            gridImpl &#39;classic&#39;
            classic {
            }
            columns {
            &#39;author.id.label&#39; {
               type &#39;id&#39;
            }
            name
            &#39;author.minEstSales.label&#39; {
                property &#39;minEstSales&#39;
                formatName &#39;nrToString&#39;
            }
            &#39;author.maxEstSales.label&#39; {
                property &#39;maxEstSales&#39;
                formatName &#39;nrToString&#39;
            }
            language
            nrBooks
            nationality
            }
        }</code></pre>
    </g:else>

</div>
</body>
</html>
