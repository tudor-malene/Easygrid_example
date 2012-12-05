package example

import org.springframework.dao.DataIntegrityViolationException
import org.grails.plugin.easygrid.Easygrid

@Easygrid
class BookController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]


    static grids = {
        customDatasourceBooks {
            gridImpl 'jqgrid'
            labelPrefix 'book'
            dataSourceType 'custom'
            labelPrefix 'book'
            dataProvider {gridConfig, filters, listParams ->
                [
                        new Book( author: Author.findByNameIlike('%Tolstoy%'), title: 'War and peace', description: 'bla bla', date:new GregorianCalendar(1821, 10, 11).time),
                ]
            }
            dataCount {filters ->
                1
            }
            jqgrid{
                width 900
            }
            columns {
                id {
                    type 'id'
                }
                author {
                    value {Book book ->
                        book.author.name
                    }
                    jqgrid {
                        search false
                    }
                }
                title{
                    jqgrid {
                        search false
                    }
                }
                description{
                    jqgrid {
                        search false
                    }
                }
                date{
                    jqgrid {
                        search false
                    }
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
        [bookInstance: new Book(params)]
    }

    def save() {
        def bookInstance = new Book(params)
        if (!bookInstance.save(flush: true)) {
            render(view: "create", model: [bookInstance: bookInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'book.label', default: 'Book'), bookInstance.id])
        redirect(action: "show", id: bookInstance.id)
    }

    def show(Long id) {
        def bookInstance = Book.get(id)
        if (!bookInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'book.label', default: 'Book'), id])
            redirect(action: "list")
            return
        }

        [bookInstance: bookInstance]
    }

    def edit(Long id) {
        def bookInstance = Book.get(id)
        if (!bookInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'book.label', default: 'Book'), id])
            redirect(action: "list")
            return
        }

        [bookInstance: bookInstance]
    }

    def update(Long id, Long version) {
        def bookInstance = Book.get(id)
        if (!bookInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'book.label', default: 'Book'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (bookInstance.version > version) {
                bookInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'book.label', default: 'Book')] as Object[],
                        "Another user has updated this Book while you were editing")
                render(view: "edit", model: [bookInstance: bookInstance])
                return
            }
        }

        bookInstance.properties = params

        if (!bookInstance.save(flush: true)) {
            render(view: "edit", model: [bookInstance: bookInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'book.label', default: 'Book'), bookInstance.id])
        redirect(action: "show", id: bookInstance.id)
    }

    def delete(Long id) {
        def bookInstance = Book.get(id)
        if (!bookInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'book.label', default: 'Book'), id])
            redirect(action: "list")
            return
        }

        try {
            bookInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'book.label', default: 'Book'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'book.label', default: 'Book'), id])
            redirect(action: "show", id: id)
        }
    }
}
