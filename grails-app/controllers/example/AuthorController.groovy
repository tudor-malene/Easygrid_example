package example

import org.springframework.dao.DataIntegrityViolationException
import org.grails.plugin.easygrid.Easygrid

@Easygrid
class AuthorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    static grids = {

        authorClassic {
            dataSourceType 'domain'
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
            dataSourceType 'domain'
            domainClass Author
            gridImpl 'jqgrid'
            inlineEdit true
            jqgrid {
                width '"900"'
            }
            columns {
                actions {
                    type 'actions'
                }
                id {
                    type 'id'
                }
                name {
                    filterClosure {params ->
                        ilike('name', "%${params.name}%")
                    }
                    jqgrid {
                        editable false
                        // this will create a link to the wikipedia page
                        formatter 'customWikiFormat'
                    }
                }
                minEstSales {
                    formatName 'nrToString'
                    jqgrid {
                        editable false
                        search false
                    }
                }
                maxEstSales {
                    formatName 'nrToString'
                    jqgrid {
                        editable false
                        search false
                    }
                }
                language {
                    filterClosure {params ->
                        ilike('language', "%${params.language}%")
                    }
                    jqgrid {
                        editable true
                    }
                }
                nrBooks {
                    jqgrid {
                        editable true
                        search false
                    }
                }
                nationality {
                    filterClosure {params ->
                        ilike('nationality', "%${params.nationality}%")
                    }
                    jqgrid {
                        editable true
                    }
                }
                version {
                    type 'version'
                }
            }
            autocomplete {
                idProp 'id'
//                labelProp 'name'
                labelValue { val, params ->
                    "${val.name} (${val.nationality})"
                }
                textBoxFilterClosure { params ->
                    ilike('name', "%${params.term}%")
                }
                constraintsFilterClosure { params ->
                    if (params.nationality) {
                        eq('nationality', params.nationality)
                    }
                }
            }
        }

        authorVisualization {
            dataSourceType 'domain'
            domainClass Author
            gridImpl 'visualization'
            visualization {
                page 'enable'
                allowHtml true
                alternatingRowStyle true
                showRowNumber false
                pageSize 10
            }
            columns {
                id {
                    type 'id'
                }
                name {
                    filterClosure {params ->
                        ilike('name', "%${params.name}%")
                    }
                    visualization {
                        search true
                    }
                }
                minEstSales {
                    formatName 'nrToString'
                }
                maxEstSales {
                    formatName 'nrToString'
                    filterClosure {params ->
                        gt('maxEstSales', new BigInteger(params.maxEstSales))
                    }
                    visualization {
                        search true
                        searchType 'number'
                    }
                }
                language {
                    filterClosure {params ->
                        ilike('language', "%${params.language}%")
                    }
                    visualization {
                        search true
                    }
                }
                nrBooks
                nationality {
                    filterClosure {params ->
                        ilike('nationality', "%${params.nationality}%")
                    }
                    visualization {
                        search true
                    }
                }
            }
        }

        authorDatatables {
            dataSourceType 'domain'
            domainClass Author
            gridImpl 'datatable'
            columns {
                id {
                    type 'id'
                }
                name {
                    filterClosure {params ->
                        ilike('name', "%${params.name}%")
                    }
                    datatable {
                        search true
                    }
                }
                minEstSales {
                    formatName 'nrToString'
                }
                maxEstSales {
                    filterClosure {params ->
                        gt('maxEstSales', new BigInteger(params.maxEstSales))
                    }
                    formatName 'nrToString'
                    datatable {
                        search true
                    }
                }
                language {
                    filterClosure {params ->
                        ilike('language', "%${params.language}%")
                    }
                    datatable {
                        search true
                    }
                }
                nrBooks
                nationality {
                    filterClosure {params ->
                        ilike('nationality', "%${params.nationality}%")
                    }
                    datatable {
                        search true
                    }
                }
            }
        }

        authorDatatablesOverBill {
            dataSourceType 'domain'
            domainClass Author
            gridImpl 'datatable'
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
