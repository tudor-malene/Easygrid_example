<r:require modules="easygrid-datatables-dev,export"/>
%{--<grid:filterForm name="authorDatatables" />--}%

<grid:grid name='authorDatatables' />
<grid:exportButton name='authorDatatables'/>

<h1 id="source-code">Source Code</h1>

<markdown:renderHtml>

    def authorDatatablesGrid = {
        domainClass Author
        gridImpl 'dataTables'
        columns {
            name {
                formatName 'authorWikiFormat'
                export {
                    //define a different value for export
                    value { Author author ->
                        "($ {author.id}) $ {author.name}"
                    }
                }
            }
            minEstSales {
                enableFilter false
                formatName 'nrToString'
            }
            maxEstSales {
                enableFilter false
                formatName 'nrToString'
            }
            language
            nrBooks {
                enableFilter false
            }
            nationality
        }
    }

</markdown:renderHtml>

<markdown:renderHtml>
    < grid:grid name='authorDatatables' />
</markdown:renderHtml>