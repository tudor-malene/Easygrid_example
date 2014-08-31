import grails.plugin.springsecurity.SpringSecurityUtils

easygrid {

    // here we define different formatters
    // these are closures  which are called before the data is displayed to format the cell data
    // these are specified in the column section using : formatName
    formats {

        nrToString = { nr ->
            if (nr / 1000000000 >= 1) {
                "${(nr / 1000000000) as int} billion"
            } else if (nr / 1000000 >= 1) {
                "${(nr / 1000000) as int} million"
            } else if (nr / 1000 >= 1) {
                "${(nr / 1000) as int}k"
            } else {
                "${nr}"
            }
        }
        authorWikiFormat = {
            "<a href='http://en.wikipedia.org/wiki/${it.replace(" ", "_")}'>${it}</a>";
        }
    }

    defaults {
        //un-comment if you use spring security or implement your own with your framework
        securityProvider = { grid, oper ->
            if (!grid.roles) {
                return true
            }
            def grantedRoles
            if (Map.isAssignableFrom(grid.roles.getClass())) {
                grantedRoles = grid.roles.findAll { op, role -> oper == op }.collect { op, role -> role }
            } else if (List.isAssignableFrom(grid.roles.getClass())) {
                grantedRoles = grid.roles
            } else {
                grantedRoles = [grid.roles]
            }
            SpringSecurityUtils.ifAllGranted(grantedRoles.join(','))
        }

        jqgrid {
            filterToolbar {
                searchOperators = false
            }
        }

    }
}
