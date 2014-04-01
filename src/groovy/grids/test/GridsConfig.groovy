package grids.test

import example.Author
import org.grails.plugin.easygrid.Filter

class GridsConfig {

    static grids = {
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


        authorJQGrid {
            dataSourceType 'gorm'
            domainClass Author
            gridImpl 'jqgrid'
            inlineEdit true
            enableFilter true
            export {
                export_title 'Author'
//                pdf {
//                    'border.color' java.awt.Color.BLUE
//                }
            }
            filterForm {
                field {
                    'ff.name' {
                        label 'name'
                        type 'text'
                        filterClosure { Filter filter ->
                            ilike('name', "%${filter.paramValue}%")
                        }
                    }
                    'estSales' {
                        label 'estSales'
                        type 'between'
                        filterClosure { Filter filter ->
                            between('maxEstSales', filter.params.estSales.from as BigInteger, filter.params.estSales.to as BigInteger)
                        }
                    }
                }
            }
            columns {
                actions {
                    type 'actions'
                }
                id {
                    type 'id'
                }
                name {
                    jqgrid {
                        editable false
                    }
                }
                minEstSales {
                    enableFilter false
                    formatName 'nrToString'
                    jqgrid {
                        editable false
                    }
                }
                maxEstSales {
                    enableFilter false
                    formatName 'nrToString'
                    jqgrid {
                        editable false
                    }
                }
                language {
                    jqgrid {
                        editable true
                    }
                }
                nrBooks {
                    enableFilter false
                    jqgrid {
                        editable true
                    }
                }
                nationality {
                    jqgrid {
                        editable true
                    }
                }
                version {
                    type 'version'
                }
            }
        }
    }
}