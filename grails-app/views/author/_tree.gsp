<r:require modules="easygrid-jqgrid-dev,export"/>

<grid:grid name='jqgridTree'>
    <grid:set caption="Author Tree" width="400" height="200"/>
</grid:grid>

<h1 id="source-code">Source Code</h1>

<markdown:renderHtml>

    def jqgridTreeGrid = {
        dataSourceType 'custom'
        gridImpl 'jqgrid'
        inlineEdit false
        jqgrid {
            ExpandColumn('name')
            treeGrid true
            treeGridModel "adjacency"
            treedatatype "json"
            ExpandColClick true
            mtype 'GET'
        }
        dataProvider { gridConfig, filters, listParams ->
            println params
            switch (params.n_level) {
                case "0":
                    println params.nodeid
                    Book.findAllByAuthor(Author.findById(params.nodeid[2..-1] as long))
                    break;
                default:
                    Author.list().findAll { it.books }
            }
        }
        dataCount { filters ->
            switch (params.n_level) {
                case "0":
                    Book.countByAuthor(Author.findById(params.nodeid[2..-1] as long))
                    break;
                default:
                    Author.list().findAll { it.books }.size()
            }
        }
        columns {
            id {
                label 'Id'
                jqgrid {
                    hidden true
                }
                value { domain ->
                    (domain instanceof Book) ? "b_$ {domain.id}" : "a_$ {domain.id}"

                }
            }
            name {
                label 'Tree'
                enableFilter false
                value { domain ->
                    (domain instanceof Book) ? domain.title : domain.name
                }
            }
            level {
                label 'level'
                render false
                value { domain, params ->
                    (domain instanceof Book) ? "1" : '0'
                }
            }
            parent {
                label 'parent'
                render false
                value { domain, params ->
                    (domain instanceof Book) ? "a_$ {domain.author.id}" : 'null'
                }
            }
            isLeaf {
                label 'isLeaf'
                render false
                value { domain, params ->
                    (domain instanceof Book) ? "true" : "false"
                }
            }
            expanded {
                label 'expanded'
                render false
                value {
                    false
                }
            }
        }
    }

</markdown:renderHtml>
GSP:
<markdown:renderHtml>

    < grid:grid name='jqgridTree'>
        < grid:set caption="Author Tree" width="400" height="200"/>
    </ grid:grid>

</markdown:renderHtml>
