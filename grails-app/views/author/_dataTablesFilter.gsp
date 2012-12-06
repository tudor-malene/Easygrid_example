
<r:require modules="easygrid-datatables-dev"/>
<h3>To be able to view the content you need to <a href="${createLink(controller: 'login', action: 'auth')}">login</a>  with: me/password</h3>

<grid:exportButton name='authorDatatablesOverBill'/>
<grid:grid name='authorDatatablesOverBill'/>

<h1 id="source-code">Source Code</h1>

                        <pre><code>
    authorDatatablesOverBill {
        dataSourceType &#39;domain&#39;
        domainClass Author
        gridImpl &#39;dataTables&#39;
        initialCriteria {
            gte(&#39;maxEstSales&#39;, 1000000000G)
        }
        roles &#39;ROLE_USER&#39;
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
    }</code></pre>
