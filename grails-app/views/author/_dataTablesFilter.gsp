<r:require modules="easygrid-datatables-dev,export"/>
<sec:ifNotLoggedIn>
    <h3>To be able to view the content you need to <a
            href="${createLink(controller: 'login', action: 'auth')}">login</a>  with: me/password</h3>
</sec:ifNotLoggedIn>

<grid:grid name='authorDatatablesOverBill' fixedColumns='true'
           columns.name.dataTables.sWidth='"350px"'
           columns.minEstSales.dataTables.sWidth='"100px"'
           columns.maxEstSales.dataTables.sWidth='"100px"'
           columns.language.dataTables.sWidth='"100px"'
           columns.nrBooks.dataTables.sWidth='"100px"'
           columns.nationality.dataTables.sWidth='"100px"'
           dataTables.sScrollX='"100%"'
           dataTables.sScrollXInner='"120%"'
           dataTables.bScrollCollapse="true"/>

<grid:exportButton name='authorDatatablesOverBill'/>

<h1 id="source-code">Source Code</h1>

<markdown:renderHtml>

    authorDatatablesOverBill {
        dataSourceType 'gorm'
        domainClass Author
        gridImpl 'dataTables'
        initialCriteria {
            gte('maxEstSales', 1000000000G)
        }
        roles 'ROLE_USER'
        columns {
            name {
                formatName 'authorWikiFormat'
            }
            minEstSales {
                formatName 'nrToString'
            }
            maxEstSales {
                formatName 'nrToString'
            }
            language
            nrBooks
            nationality
        }
    }

</markdown:renderHtml>
<markdown:renderHtml>
    < grid:grid name='authorDatatablesOverBill' fixedColumns='true'
               columns.name.dataTables.sWidth='"350px"'
               columns.minEstSales.dataTables.sWidth='"100px"'
               columns.maxEstSales.dataTables.sWidth='"100px"'
               columns.language.dataTables.sWidth='"100px"'
               columns.nrBooks.dataTables.sWidth='"100px"'
               columns.nationality.dataTables.sWidth='"100px"'
               dataTables.sScrollX='"100%"'
               dataTables.sScrollXInner='"120%"'
               dataTables.bScrollCollapse="true"/>

</markdown:renderHtml>