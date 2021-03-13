package lecoincoin

import com.mbds.grails.lecoincoin.Annonce
import com.mbds.grails.lecoincoin.Illustration
import com.mbds.grails.lecoincoin.Role
import com.mbds.grails.lecoincoin.User
import com.mbds.grails.lecoincoin.UserRole

class BootStrap {


        def init = { servletContext ->

        def adminRole = new Role(authority: "ROLE_ADMIN").save()
        def modRole = new Role(authority: "ROLE_MODO").save()
        def userRole = new Role(authority: "ROLE_USER").save()

        def adminUser = new User(username: "admin", password: "password").save()
        def modUser = new User(username: "moderateur", password: "password").save()
        def userUser = new User(username: "client", password: "password").save()

        UserRole.create adminUser, adminRole, true
        UserRole.create(modUser, modRole, true)
        UserRole.create(userUser, userRole, true)

        /*User.list().each {
            User userInstance ->
                (1..5).each {
                    Integer annonceIdx ->
                        def annonceInstance = new Annonce(
                                title: "Titre de l'annonce $annonceIdx",
                                description: "Description de l'annonce $annonceIdx",
                                price: 100 * annonceIdx
                        )
                        (1..5).each {
                            annonceInstance.addToIllustrations(new Illustration(filename: "grails.svg"))
                        }
                        //userInstance.addToAnnonces(annonceInstance)


                }
                userInstance.save(flush: true, failOnError: true)
        }*/


    }
    def destroy = {
    }
}
