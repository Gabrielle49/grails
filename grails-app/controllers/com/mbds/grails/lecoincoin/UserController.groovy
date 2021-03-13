package com.mbds.grails.lecoincoin

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class UserController {

    @Secured(['ROLE_ADMIN'])
    def index() {
    }

    def redactionUser() {
    }
}
