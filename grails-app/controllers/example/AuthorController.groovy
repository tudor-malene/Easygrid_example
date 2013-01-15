package example

import org.grails.plugin.easygrid.Easygrid
import org.springframework.dao.DataIntegrityViolationException

@Easygrid
class AuthorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

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

        authorJQGridSelection {
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
                constraintsFilterClosure { filter ->
                    if (filter.params.nationality) {
                        eq('nationality', filter.params.nationality)
                    }
                }
            }
        }

        authorJQGrid {
            dataSourceType 'gorm'
            domainClass Author
            gridImpl 'jqgrid'
            inlineEdit true
            jqgrid {
                width '"900"'
            }
            export {
                export_title 'Author'
                pdf {
                    'border.color' java.awt.Color.BLUE
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
                        // this will create a link to the wikipedia page
                        formatter 'customWikiFormat'
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

        authorVisualization {
            dataSourceType 'gorm'
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

        authorDatatables {
            dataSourceType 'gorm'
            domainClass Author
            gridImpl 'dataTables'
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

        authorDatatablesOverBill {
            dataSourceType 'gorm'
            domainClass Author
            gridImpl 'dataTables'
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
                    enableFilter false
                    formatName 'nrToString'
                }
                maxEstSales {
                    formatName 'nrToString'
                    filterClosure { filter ->
                        gt('maxEstSales', filter.paramValue as BigInteger)
                    }
                }
                language
                nrBooks {
                    enableFilter false
                }
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
