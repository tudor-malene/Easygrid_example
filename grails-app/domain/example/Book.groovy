package example

class Book {

    String title
    String description
    Date date

    static belongsTo = [ author:Author ]

    static constraints = {
        description(nullable: true)
    }

    static mapping = {
        cache true
    }

}
