package example

class Author {

    String name
    BigInteger minEstSales
    BigInteger maxEstSales
    String language
    String nrBooks
    String nationality

//    Date birthDate

    static hasMany = [ books:Book ]

    static constraints = {
    }
}
