package com.mbds.grails.lecoincoin

import grails.converters.JSON
import grails.converters.XML
import grails.plugin.springsecurity.annotation.Secured

import javax.servlet.http.HttpServletResponse
import java.text.SimpleDateFormat

@Secured('ROLE_ADMIN')
class ApiController {
        AnnonceService a = new AnnonceService()
        def pattern = "dd-MM-yyyy"
//    GET / PUT / PATCH / DELETE
//    url : localhost:8081/projet/api/annonce(s)/{id}
    def annonce() {
        switch (request.getMethod()) {
            case "GET":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def annonceInstance = a.getSingleAnnonce(params.id)
                if (!annonceInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
                serializeData(annonceInstance, request.getHeader("Accept"))
                break
            case "PUT":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def annonceInstance = Annonce.get(params.id)
                if (!annonceInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
//
                if(request.JSON.title && request.JSON.description && request.JSON.price && request.JSON.dateUpdated) {
                    annonceInstance.title = request.JSON.title
                    annonceInstance.description = request.JSON.description
                    annonceInstance.price = Double.parseDouble(request.JSON.price)
                    annonceInstance.dateUpdated =new Date().parse(pattern, request.JSON.dateUpdated)
                    a.save(annonceInstance)
                    return response.status = 200
                }
            case "PATCH":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def annonceInstance = Annonce.get(params.id)
                if (!annonceInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
//
                if(request.JSON.description && request.JSON.price && request.JSON.dateUpdated){
                    annonceInstance.description = request.JSON.description
                    annonceInstance.price = Double.parseDouble(request.JSON.price)
                    annonceInstance.dateUpdated =new Date().parse(pattern, request.JSON.dateUpdated)
                    a.save(annonceInstance)
                    return response.status = 200
                }
                else if(request.JSON.price && request.JSON.dateUpdated){
                    annonceInstance.price = Double.parseDouble(request.JSON.price)
                    annonceInstance.dateUpdated =new Date().parse(pattern, request.JSON.dateUpdated)
                    a.save(annonceInstance)
                    return response.status = 200
                }
                else if(request.JSON.description && request.JSON.dateUpdated){
                    annonceInstance.description = request.JSON.description
                    annonceInstance.price = Double.parseDouble(request.JSON.price)
                    a.save(annonceInstance)
                    return response.status = 200
                }

            case "DELETE":
                if (!params.id)
                    return response.status = HttpServletResponse.SC_BAD_REQUEST

                a.delete(params.id)
                return response.status = HttpServletResponse.SC_NO_CONTENT
                /* deuxième possibilité
                         return response.status = 200
                */

            
                //serializeData(state, request.getHeader("Accept"))

            default:
                return response.status = HttpServletResponse.SC_METHOD_NOT_ALLOWED
                break
        }
        return response.status = HttpServletResponse.SC_NOT_ACCEPTABLE
    }

//    GET / POST
    def annonces() {
        switch (request.getMethod()) {
            case "GET":
                def annonceInstance = Annonce.list()
                if (!annonceInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
                serializeData(annonceInstance, request.getHeader("Accept"))
                break
            case "POST":
                if(request.JSON.title && request.JSON.description
                        && request.JSON.dateCreated && request.JSON.price){
                    Annonce aa = new Annonce()
                    aa.title = request.JSON.title
                    aa.description = request.JSON.description
                    aa.price = Double.parseDouble(request.JSON.price)
                    aa.dateCreated =new Date().parse(pattern, request.JSON.dateCreated)
                    aa.dateUpdated = aa.dateCreated
                    Illustration[] list = request.JSON.Illustration
                    for(int i=0;i<list.size();i++){
                        aa.addToIllustrations(new Illustration(filename:list[i]["filename"]))
                    }
                    a.save(aa)
                    return response.status = HttpServletResponse.SC_CREATED
                }
                return response.status = HttpServletResponse.SC_NOT_ACCEPTABLE
        }
        return response.status = HttpServletResponse.SC_NOT_ACCEPTABLE
    }

//    GET / PUT / PATCH / DELETE
    def user() {

    }

//    GET / POST
    def users() {

    }

    def serializeData(object, format) {
        switch (format) {
            case 'json':
            case 'application/json':
            case 'text/json':
                render object as JSON
                break
            case 'xml':
            case 'application/xml':
            case 'text/xml':
                render object as XML
                break
        }
    }

}