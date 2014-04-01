<r:require modules="easygrid-datatables-dev,export"/>
<sec:ifNotLoggedIn>
    <h3>To be able to view the content you need to <a
            href="${createLink(controller: 'login', action: 'auth')}">login</a>  with: me/password</h3>
</sec:ifNotLoggedIn>

<grid:grid name='authorDatatablesOverBill'>
    <grid:set sScrollX="100%" sScrollXInner="100%" bScrollCollapse="true"/>
    <grid:set col="name" sWidth="250px"/>
    <grid:set col="minEstSales" sWidth="70px" />
    <grid:set col="maxEstSales" sWidth="70px"/>
    <grid:set col="language" sWidth="80px"/>
    <grid:set col="nrBooks" sWidth="40px"/>
    <grid:set col="nationality" sWidth="40px"/>
</grid:grid>

<grid:exportButton name='authorDatatablesOverBill'/>

<h1 id="source-code">Source Code</h1>

<markdown:renderHtml>

    def authorDatatablesOverBillGrid = {
          domainClass Author
          gridImpl 'dataTables'
          initialCriteria {
              gte('maxEstSales', 1000000000G)
          }
          roles([list: 'ROLE_USER', add: 'ROLE_USER'])
          columns {
              name {
                  formatName 'authorWikiFormat'
              }
              minEstSales {
                  formatName 'nrToString'
                  enableFilter false
              }
              maxEstSales {
                  formatName 'nrToString'
                  enableFilter false
              }
              language
              nrBooks
              nationality
          }
      }

</markdown:renderHtml>
<markdown:renderHtml>
    < grid:grid name='authorDatatablesOverBill'>
        < grid:set sScrollX="100%" sScrollXInner="100%" bScrollCollapse="true"/>
        < grid:set col="name" sWidth="250px"/>
        < grid:set col="minEstSales" sWidth="70px" />
        < grid:set col="maxEstSales" sWidth="70px"/>
        < grid:set col="language" sWidth="80px"/>
        < grid:set col="nrBooks" sWidth="40px"/>
        < grid:set col="nationality" sWidth="40px"/>
    < /grid:grid>


</markdown:renderHtml>