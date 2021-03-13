package com.mbds.grails.lecoincoin

import fonctions.FonctionUtiles
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import java.text.SimpleDateFormat


@Secured(['ROLE_ADMIN', 'ROLE_MODO'])
class AnnonceController {

    AnnonceService annonceService
    def static nbpaggination = 1

    /*@Secured(['ROLE_ADMIN', 'ROLE_MODO'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond annonceService.list(params), model:[annonceCount: annonceService.count()]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MODO'])
    def show(Long id) {
        respond annonceService.get(id)
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        respond new Annonce(params)
    }

    @Secured(['ROLE_ADMIN'])
    def save(Annonce annonce) {
        if (annonce == null) {
            notFound()
            return
        }

        try {
            annonceService.save(annonce)
        } catch (ValidationException e) {
            respond annonce.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*' { respond annonce, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MODO'])
    def edit(Long id) {
        respond annonceService.get(id), model: [userList: User.list(), baseUrl: grailsApplication.config.annonces.illustrations.url]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MODO'])
    def update() {
        def annonce = Annonce.get(params.id)
        annonce.title = params.title
        annonce.description = params.description
        annonce.price = Double.parseDouble(params.price)
//        annonce.author = User.get(params.author.id)

        if (annonce == null) {
            notFound()
            return
        }
        /**
         * 1. Récupérer le fichier dans la requête
         * 2. Sauvegarder le fichier localement
         * 3. Créer un illustration sur le fichier que vous avez sauvegardé
         * 4. Attacher l'illustration nouvellement créée à l'annonce

        MultipartFile file = request.getFile("file")
        String namefile = file.originalFilename
        file.transferTo(new File(grailsApplication.config.annonces.illustrations.path+namefile))

        try {
            annonce.addToIllustrations(new Illustration(filename: namefile))
            annonceService.save(annonce)
            0        } catch (ValidationException e) {
            respond annonce.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*'{ respond annonce, [status: OK] }
        }
    }

    @Secured(['ROLE_ADMIN'])
    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        annonceService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'annonce.label', default: 'Annonce'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'annonce.label', default: 'Annonce'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }*/

    @Secured(['ROLE_ADMIN', 'ROLE_MODO'])
    def index() {
        def pages = params.page
        def xy = FonctionUtiles.getXYPaggination(Integer.parseInt(pages), nbpaggination)
        def offset = xy[0]
        def max = xy[1]
        int count = annonceService.count()
        def nbBoutons = FonctionUtiles.getNombreBoutonsPaggination(count, nbpaggination)
        def liste = annonceService.getAllPagginate(Integer.valueOf(max), Integer.valueOf(offset))
        render(view: "/annonce/index", model: [liste: liste, nbBoutons: nbBoutons])
    }

    def redactionAnnonce() {

    }

    /*
        Insertion d'une annonce
     */
    def save(){
        def pattern = "yyyy-MM-dd"
        Annonce annonce = new Annonce(
                title: params.titre,
                description: params.description,
                dateCreated: new SimpleDateFormat(pattern).parse(params.dateCreation),
                dateUpdated: new SimpleDateFormat(pattern).parse(params.dateCreation),
                price: params.prix,
                "illustrations[0]": [filename: params.illustration]
        )
        println(annonce as JSON)
        try{
            annonceService.save(annonce)
            flash.message = "Bien enregistré!"
        }catch(Exception e){
            flash.error = "Non enregistré!"
        }
        redirect action: "redactionAnnonce", method: "GET"
        //render annonce as JSON

    }

    def delete(){
        def id = params.id
        annonceService.delete(id)
        forward controller:"annonce",action:"index",params:[page:'1']
    }
}
