
<r:require modules="easygrid-datatables-dev,export"/>
<h3>To be able to view the content you need to <a href="${createLink(controller: 'login', action: 'auth')}">login</a>  with: me/password</h3>

<grid:grid name='authorDatatablesOverBill'/>
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
                filterClosure {filter ->
                    gt('maxEstSales', filter.paramValue as BigInteger)
                }
            }
            language
            nrBooks  {
                enableFilter false
            }
            nationality
        }
    }
}

</markdown:renderHtml>