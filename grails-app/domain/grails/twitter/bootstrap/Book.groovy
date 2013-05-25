package grails.twitter.bootstrap

class Book {
    String title
    String isbn

    static constraints = {
        title(blank: false)
        isbn(blank: false)
    }
}
