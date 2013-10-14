<r:require modules="easygrid-datatables-dev,export"/>
<grid:filterForm name="authorDatatables" />
<grid:grid name='authorDatatables' />
<grid:exportButton name='authorDatatables'/>

<h1 id="source-code">Source Code</h1>

<markdown:renderHtml>
    authorDatatables {
        dataSourceType 'gorm'
        domainClass Author
        gridImpl 'dataTables'
        fixedColumns true
            filterForm {
                fields {
                    'ff.name' {
                        label 'name'
                        type 'text'
                        filterClosure { Filter filter ->
                            ilike('name', "%$ {filter.paramValue}%")
                        }
                    }
                    'estSales' {
                        label 'estSales'
                        type 'interval'
                        filterClosure { Filter filter ->
                            if (filter.params.estSales.from && filter.params.estSales.to) {
                                between('maxEstSales', filter.params.estSales.from as BigInteger, filter.params.estSales.to as BigInteger)
                            }
                        }
                    }
                }
            }
        columns {
            name{
                formatName 'authorWikiFormat'
                                    export{
                        //define a different value for the export
                        value {Author author ->
                            "($ {author.id}) $ {author.name}"
                        }
                    }
            }
            minEstSales {
                enableFilter false
                formatName 'nrToString'
            }
            maxEstSales {
                filterClosure { filter ->
                    gt('maxEstSales', filter.paramValue as BigInteger)
                }
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

