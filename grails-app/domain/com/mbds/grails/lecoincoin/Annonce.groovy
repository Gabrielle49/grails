package com.mbds.grails.lecoincoin

class Annonce {

    String title
    String description
    Double price

    Date dateCreated
    Date dateUpdated

    static hasMany = [illustrations: Illustration]

    //static belongsTo = [author: User]

    static constraints = {
        title       nullable: false, blank: false
        description nullable: false, blank: false
        price       min: 0D
        illustrations cascade: 'all-delete-orphan'
    }

    static mapping = {
        description type: 'text'
    }
}
