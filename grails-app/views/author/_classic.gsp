<r:require modules="export"/>

<grid:grid name='authorClassic'/>
<grid:exportButton name='authorClassic'/>

<h1 id="source-code">Source Code</h1>
<markdown:renderHtml>

    authorClassic {
        dataSourceType 'gorm'
        domainClass Author
        gridImpl 'classic'
        columns {
            id {
                type 'id'
            }
            name
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