package example

import grids.test.GridsConfig
import org.grails.plugin.easygrid.Easygrid
import org.grails.plugin.easygrid.Filter
import org.springframework.dao.DataIntegrityViolationException

//@Easygrid  (externalGrids = GridsConfig)
@Easygrid
class AuthorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]


    def authorClassicGrid = {
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

    def authorJQGridSelectionGrid = {
        dataSourceType 'gorm'
        domainClass Author
        gridImpl 'jqgrid'
        inlineEdit false
        jqgrid {
            width '"900"'
        }
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
                enableFilter false
                formatName 'nrToString'
            }
            language
            nrBooks {
                enableFilter false
            }
            nationality
        }
        autocomplete {
            idProp 'id'
//                labelProp 'name'
            labelValue { val, params ->
                "${val.name} (${val.nationality})"
            }
            textBoxFilterClosure { filter ->
                ilike('name', "%${filter.paramValue}%")
            }
            constraintsFilterClosure { params ->
                if (params.nationality) {
                    eq('nationality', params.nationality)
                }
            }
        }
    }

    def authorJQGridGrid = {
        dataSourceType 'gorm'
        domainClass Author
        gridImpl 'jqgrid'
        inlineEdit true
        enableFilter true
        export {
            export_title 'Author'
            pdf {
                'border.color' java.awt.Color.BLUE
            }
        }
        filterForm {
            fields {
                'ff.name' {
                    label 'name'
                    type 'text'
                    filterClosure { Filter filter ->
                        ilike('name', "%${filter.paramValue}%")
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


    def authorVisualizationGrid = {
        dataSourceType 'gorm'
        domainClass Author
        gridImpl 'visualization'
        filterForm {
            fields {
                'ff.name' {
                    label 'name'
                    type 'text'
                    filterClosure { Filter filter ->
                        ilike('name', "%${filter.paramValue}%")
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
                filterClosure { filter ->
                    gt('maxEstSales', filter.paramValue as BigInteger)
                }
                visualization {
                    searchType 'number'
                }
            }
            language
            nrBooks {
                enableFilter false
            }
            nationality
        }
    }

    def authorVisualizationChartGrid = {
        dataSourceType 'gorm'
        domainClass Author
        initialCriteria {
            gte('maxEstSales', 500000000G)
        }
        gridImpl 'visualization'
        columns {
            name
            minEstSales {
                visualization {
                    valueType = com.google.visualization.datasource.datatable.value.ValueType.NUMBER
                }
            }
            maxEstSales {
                visualization {
                    valueType = com.google.visualization.datasource.datatable.value.ValueType.NUMBER
                }
            }
        }
    }

    def authorDatatablesGrid = {
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
                        ilike('name', "%${filter.paramValue}%")
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
            name {
                formatName 'authorWikiFormat'
                export {
                    //define a different value for the export
                    value { Author author ->
                        "(${author.id}) ${author.name}"
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


    def authorDatatablesOverBillGrid = {
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

    def jqgridTreeGrid = {
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
                    hidden 'true'
                }
                value { domain ->
                    (domain instanceof Book) ? "b_${domain.id}" : "a_${domain.id}"

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
                    (domain instanceof Book) ? "a_${domain.author.id}" : 'null'
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


    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
    }

    def create() {
        [authorInstance: new Author(params)]
    }

    def save() {
        def authorInstance = new Author(params)
        if (!authorInstance.save(flush: true)) {
            render(view: "create", model: [authorInstance: authorInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'author.label', default: 'Author'), authorInstance.id])
        redirect(action: "show", id: authorInstance.id)
    }

    def show(Long id) {
        def authorInstance = Author.get(id)
        if (!authorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'author.label', default: 'Author'), id])
            redirect(action: "list")
            return
        }

        [authorInstance: authorInstance]
    }

    def edit(Long id) {
        def authorInstance = Author.get(id)
        if (!authorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'author.label', default: 'Author'), id])
            redirect(action: "list")
            return
        }

        [authorInstance: authorInstance]
    }

    def update(Long id, Long version) {
        def authorInstance = Author.get(id)
        if (!authorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'author.label', default: 'Author'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (authorInstance.version > version) {
                authorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'author.label', default: 'Author')] as Object[],
                        "Another user has updated this Author while you were editing")
                render(view: "edit", model: [authorInstance: authorInstance])
                return
            }
        }

        authorInstance.properties = params

        if (!authorInstance.save(flush: true)) {
            render(view: "edit", model: [authorInstance: authorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'author.label', default: 'Author'), authorInstance.id])
        redirect(action: "show", id: authorInstance.id)
    }

    def delete(Long id) {
        def authorInstance = Author.get(id)
        if (!authorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'author.label', default: 'Author'), id])
            redirect(action: "list")
            return
        }

        try {
            authorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'author.label', default: 'Author'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'author.label', default: 'Author'), id])
            redirect(action: "show", id: id)
        }
    }
}