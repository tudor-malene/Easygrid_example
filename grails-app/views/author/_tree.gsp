
<r:require modules="easygrid-jqgrid-dev,export"/>

<grid:grid name='jqgridTree' jqgrid.caption="'Author Tree'" jqgrid.width='"400"' />


<h1 id="source-code">Source Code</h1>

<markdown:renderHtml>

    jqgridTree {
         dataSourceType 'custom'
         gridImpl 'jqgrid'
         gridRenderer '/templates/treeGridRenderer'
         inlineEdit false
         jqgrid {
             'ExpandColumn' '"name"'
             treeGrid 'true'
             treeGridModel '"adjacency"'
             treedatatype '"json"'
             'ExpandColClick' "true"
         }
         dataProvider { gridConfig, filters, listParams ->
             println params
             switch (params.n_level) {
                 case "0":
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
                     hidden 'true'
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
                    treeProperty true
                    value { domain, params ->
                        (domain instanceof Book) ? "1" : '0'
                    }
                }
                parent {
                    label 'parent'
                    treeProperty true
                    value { domain, params ->
                        (domain instanceof Book) ? "a_$ {domain.author.id}" : 'null'
                    }
                }
                isLeaf {
                    label 'isLeaf'
                    treeProperty true
                    value { domain, params ->
                        (domain instanceof Book) ? "true" : "false"
                    }
                }
                expanded {
                    label 'expanded'
                    treeProperty true
                    value {
                        false
                    }
                }
            }
        }
</markdown:renderHtml>
GSP:
<markdown:renderHtml>
    < grid:grid id='jqgridinitial' name='authorJQGrid'
    jqgrid.caption="'Author List'"
    jqgrid.width='"400"'/>
</markdown:renderHtml>
