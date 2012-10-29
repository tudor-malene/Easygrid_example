import example.Author
import example.sec.UserRole
import example.sec.User
import example.sec.Role

class BootStrap {

    def init = { servletContext ->

        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
        def editRole = new Role(authority: 'ROLE_EDIT').save(flush: true)

        def testUser = new User(username: 'me', enabled: true, password: 'password')
        testUser.save(flush: true)

        UserRole.create testUser, userRole, true

        this.class.getResourceAsStream("authors.txt").eachLine{line ->

            try {
                Author author = new Author()
                def values = line.split('\t')
                author.name = values[0]
                author.minEstSales = values[1] ? (values[1].split('\\[')[0] as long) * 1000 * 1000 : 0
                author.maxEstSales = values[2] ? (values[2].split('\\[')[0] as long) * 1000 * 1000 : 0
                author.language = values[3]
                author.nrBooks = values[5]
                author.nationality = values[6]

                author.save(failOnError: true)
            } catch (Exception e) {
                e.printStackTrace()
                //do nothing
            }
        }
    }

    def destroy = {
    }

}
