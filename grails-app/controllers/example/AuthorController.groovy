package example

import org.springframework.dao.DataIntegrityViolationException
import org.grails.plugin.easygrid.EasyGrid

@EasyGrid
class AuthorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    static grids = {

        authorClassic {
            dataSourceType 'domain'
            domainClass Author
            gridImpl 'classic'
//            roles 'ROLE_ADMIN'
            classic {
            }
            columns {
                'author.id.label' {
                    type 'id'
                }
                name
                'author.minEstSales.label' {
                    property 'minEstSales'
                    formatName 'nrToString'
                }
                'author.maxEstSales.label' {
                    property 'maxEstSales'
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
            roles 'ROLE_USER'
            columns {
                'actions' {
                    type 'actions'
                }
                'author.id.label' {
                    type 'id'
                }
                'author.name.label' {
                    property 'name'
                    jqgrid {
                        editable false
                        // this will create a link to the wikipedia page
                        formatter 'customWikiFormat'
                        searchClosure {params ->
                            ilike('name', "%${params.name}%")
                        }
                    }
                }
                'author.minEstSales.label' {
                    property 'minEstSales'
                    formatName 'nrToString'
                    jqgrid {
                        editable false
                        search false
                    }
                }
                'author.maxEstSales.label' {
                    property 'maxEstSales'
                    formatName 'nrToString'
                    jqgrid {
                        editable false
                        search false
                    }
                }
                'author.language.label' {
                    property 'language'
                    jqgrid {
                        editable true
                        searchClosure {params ->
                            ilike('language', "%${params.language}%")
                        }
                    }
                }
                'author.nrBooks.label' {
                    property 'nrBooks'
                    jqgrid {
                        editable true
                        search false
                    }
                }
                'author.nationality.label' {
                    property 'nationality'
                    jqgrid {
                        editable true
                        searchClosure {params ->
                            ilike('nationality', "%${params.nationality}%")
                        }
                    }
                }
                'version' {
                    type 'version'
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
                'author.id.label' {
                    type 'id'
                }
                'author.name.label' {
                    property 'name'
                    visualization {
                        search true
                        searchClosure {params ->
                            ilike('name', "%${params.name}%")
                        }
                    }
                }
                'author.minEstSales.label' {
                    property 'minEstSales'
                    formatName 'nrToString'
                }
                'author.maxEstSales.label' {
                    property 'maxEstSales'
                    formatName 'nrToString'
                    visualization {
                        search true
                        searchType 'number'
                        searchClosure {params ->
                            gt('maxEstSales', new BigInteger(params.maxEstSales))
                        }
                    }
                }
                'author.language.label' {
                    property 'language'
                    visualization {
                        search true
                        searchClosure {params ->
                            ilike('language', "%${params.language}%")
                        }
                    }
                }
                'author.nrBooks.label' {
                    property 'nrBooks'
                }
                'author.nationality.label' {
                    property 'nationality'
                    visualization {
                        search true
                        searchClosure {params ->
                            ilike('nationality', "%${params.nationality}%")
                        }
                    }
                }
            }
        }

        authorDatatables {
            dataSourceType 'domain'
            domainClass Author
            gridImpl 'datatable'
//            roles 'ROLE_ADMIN'
            columns {
                'author.id.label' {
                    type 'id'
                }
                'author.name.label' {
                    property 'name'
                    datatable {
                        search true
                        searchClosure {params ->
                            ilike('name', "%${params.name}%")
                        }
                    }
                }
                'author.minEstSales.label' {
                    property 'minEstSales'
                    formatName 'nrToString'
                }
                'author.maxEstSales.label' {
                    property 'maxEstSales'
                    formatName 'nrToString'
                    datatable {
                        search true
                        searchClosure {params ->
                            gt('maxEstSales', new BigInteger(params.maxEstSales))
                        }
                    }
                }
                'author.language.label' {
                    property 'language'
                    datatable {
                        search true
                        searchClosure {params ->
                            ilike('language', "%${params.language}%")
                        }
                    }
                }
                'author.nrBooks.label' {
                    property 'nrBooks'
                }
                'author.nationality.label' {
                    property 'nationality'
                    datatable {
                        search true
                        searchClosure {params ->
                            ilike('nationality', "%${params.nationality}%")
                        }
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
//            roles 'ROLE_ADMIN'
            columns {
                'author.id.label' {
                    type 'id'
                }
                name
                'author.minEstSales.label' {
                    property 'minEstSales'
                    formatName 'nrToString'
                }
                'author.maxEstSales.label' {
                    property 'maxEstSales'
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
//        params.max = Math.min(max ?: 10, 100)
//        [authorInstanceList: Author.list(params), authorInstanceTotal: Author.count()]
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
