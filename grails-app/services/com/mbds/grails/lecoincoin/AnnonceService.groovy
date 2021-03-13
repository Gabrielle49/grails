package com.mbds.grails.lecoincoin

import grails.gorm.services.Service
import grails.gorm.transactions.Transactional

@Transactional
class AnnonceService {

    @Transactional
    def save(Annonce annonce){
        try {
            annonce.save()
            if (!annonce.save()) {
                annonce.errors.allErrors.each {
                    throw new Exception('Annonce')
                }
            }
        }catch(Exception e){
            throw e;
        }
    }

    @Transactional(readOnly = true)
    def getAllPagginate(int max, int offset){
        def liste = Annonce.list(max:max,offset:offset)
        return liste
    }

    @Transactional(readOnly = true)
    def count(){
        return Annonce.count()
    }

    @Transactional
    def delete(def id){
        Annonce.deleteAll(Annonce.get(id))
    }

    @Transactional
    def getSingleAnnonce(def id){
        Annonce.get(id)
    }



}