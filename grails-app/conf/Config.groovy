import groovy.text.SimpleTemplateEngine
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [
        all: '*/*',
        atom: 'application/atom+xml',
        css: 'text/css',
        csv: 'text/csv',
        form: 'application/x-www-form-urlencoded',
        html: ['text/html', 'application/xhtml+xml'],
        js: 'text/javascript',
        json: ['application/json', 'text/json'],
        multipartForm: 'multipart/form-data',
        rss: 'application/rss+xml',
        text: 'text/plain',
        xml: ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart = false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error 'org.codehaus.groovy.grails.web.servlet',        // controllers
            'org.codehaus.groovy.grails.web.pages',          // GSP
            'org.codehaus.groovy.grails.web.sitemesh',       // layouts
            'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
            'org.codehaus.groovy.grails.web.mapping',        // URL mapping
            'org.codehaus.groovy.grails.commons',            // core / classloading
            'org.codehaus.groovy.grails.plugins',            // plugins
            'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
            'org.springframework',
            'org.hibernate',
            'net.sf.ehcache.hibernate'
}

// Added by Easygrid:

easygrid {

    //default values added to each defined grid
    defaults {
        defaultMaxRows = 20
        labelFormat = new SimpleTemplateEngine().createTemplate('${prefix}.${column}.label')
        //called before inline editing : transforms the parameters into the actual object to be stored
        beforeSave = {params -> params}
        gridImpl = 'jqgrid'
        exportService = org.grails.plugin.easygrid.EasyGridExportService

        //jqgrid default properties
        jqgrid {
            width = '"100%"'
            height = 250
        }

        // spring security implementation
        securityProvider = { grid, oper ->
            if (!grid.roles) {
                return true
            }
            def grantedRoles
            if (Map.class.isAssignableFrom(grid.roles.getClass())) {
                grantedRoles = grid.roles.findAll {op, role -> oper == op}.collect {op, role -> role}
            } else if (List.class.isAssignableFrom(grid.roles.class)) {
                grantedRoles = grid.roles
            } else {
                grantedRoles = [grid.roles]
            }
            SpringSecurityUtils.ifAllGranted(grantedRoles.inject('') {roles, role -> "${roles},${role}"})
        }

    }

    // each grid has a "type" - which must be one of the datasources
    dataSourceImplementations {
        domain {
            // mandatory attribute: domainClass or initialCriteria
            dataSourceService = org.grails.plugin.easygrid.datasource.GormDatasourceService
        }

        list {
            //mandatory attributes: context, attributeName
            dataSourceService = org.grails.plugin.easygrid.datasource.ListDatasourceService
        }

        custom {
            // mandatory attributes: 'dataProvider', 'dataCount'
            dataSourceService = org.grails.plugin.easygrid.datasource.CustomDatasourceService
        }
    }

    // will be specified using the 'gridImpl' property
    gridImplementations {
        //grails classic implementation
        classic {
            gridRenderer = '/templates/classicGridRenderer'
            gridImplService = org.grails.plugin.easygrid.grids.ClassicGridService
            inlineEdit = false
            formats = [
                    (Date.class): {it.format("dd/MM/yyyy")},
                    (Boolean.class): { it ? "Yes" : "No" }
            ]
        }

        jqgrid {
            gridRenderer = '/templates/jqGridRenderer'
            gridImplService = org.grails.plugin.easygrid.grids.JqueryGridService
            inlineEdit = true
            editRenderer = '/templates/jqGridEditResponse'
            formats = [
                    (Date.class): {it.format("dd/MM/yyyy")},
                    (Calendar.class): {Calendar cal -> cal.format("dd/MM/yyyy")},
                    (Boolean.class): { it ? "Yes" : "No" }
            ]
        }

        datatable {
            gridImplService = org.grails.plugin.easygrid.grids.DatatableGridService
            gridRenderer = '/templates/datatableGridRenderer'
            inlineEdit = false
            formats = [
                    (Date.class): {it.format("dd/MM/yyyy")},
                    (Boolean.class): { it ? "Yes" : "No" }
            ]
        }

        visualization {
            gridImplService = org.grails.plugin.easygrid.grids.VisualizationGridService
            gridRenderer = '/templates/visualizationGridRenderer'
            inlineEdit = false
            formats = [
                    (Date.class): {def cal = com.ibm.icu.util.Calendar.getInstance(); cal.setTime(it); cal.setTimeZone(com.ibm.icu.util.TimeZone.getTimeZone("GMT")); cal}, //wtf?
            ]
        }

    }

    columns {

        //default values for the columns
        defaults {
            jqgrid {
                editable = true
            }
            classic {
                sortable = true
            }
            visualization {
                valueType = com.google.visualization.datasource.datatable.value.ValueType.TEXT
            }
            datatable {
                width = "'100%'"
            }
            export {
                width = 25
            }
        }

        // predefined column types
        types {
            id {
                property = 'id'

                jqgrid {
                    width = 40
                    fixed = true
                    search = false
                    editable = false
//                formatter = 'editFormatter'
                }
                visualization {
                    valueType = com.google.visualization.datasource.datatable.value.ValueType.NUMBER
                }
                export {
                    width = 10
                }

            }

            actions {
                value = {''}
                jqgrid {
                    name = 'actions'
                    formatter = '"actions"'
                    editable = false
                    sortable = false
                    resizable = false
                    fixed = true
                    width = 60
                    search = false
                    formatoptions = '{"keys":true}'
                }
                export {
                    hidden = true
                }
            }

            version {
                property = 'version'
                jqgrid {
                    hidden = true
                }
                export {
                    hidden = true
                }
                visualization {
                    valueType = com.google.visualization.datasource.datatable.value.ValueType.NUMBER
                }
            }
        }
    }

    // here we define different formatters
    formats {
        stdDateFormatter = {
            it.format("dd/MM/yyyy")
        }
        visualizationDateFormatter = {
            def cal = com.ibm.icu.util.Calendar.getInstance(); cal.setTime(it); cal.setTimeZone(java.util.TimeZone.getTimeZone("GMT")); cal
        }
        stdBoolFormatter = {
            it ? "Yes" : "No"
        }

        nrToString = {nr ->
            if (nr / 1000000000 >= 1) {
                "${(nr / 1000000000) as int} billion"
            } else if (nr / 1000000 >= 1) {
                "${(nr / 1000000) as int} million"
            } else if (nr / 1000 >= 1) {
                "${(nr / 1000) as int}k"
            } else {
                nr
            }
        }
    }
}

// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'example.sec.User'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'example.sec.UserRole'
grails.plugins.springsecurity.authority.className = 'example.sec.Role'
