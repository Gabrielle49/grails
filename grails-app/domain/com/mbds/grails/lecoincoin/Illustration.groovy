package com.mbds.grails.lecoincoin

class Illustration {

    // On va utiliser le filename pour construire deux chemins
    // URL = annonces.illustrations.url -> Adresse externe + chemin vers les images + filename
    // Path = annonces.illustrations.path -> Adresse interne + chemin vers les images + filename
    String filename

    static belongsTo = [annonce: Annonce]

    static constraints = {
        filename    nullable: false, blank: false
    }
}
