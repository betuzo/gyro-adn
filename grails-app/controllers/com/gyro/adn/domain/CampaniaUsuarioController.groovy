package com.gyro.adn.domain

import org.springframework.dao.DataIntegrityViolationException

class CampaniaUsuarioController {

    def mailchimpService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [campaniaUsuarioInstanceList: CampaniaUsuario.list(params), campaniaUsuarioInstanceTotal: CampaniaUsuario.count()]
    }

    def create() {
        [campaniaUsuarioInstance: new CampaniaUsuario(params)]
    }

    String getListIdByCampaignsId (String cid){
        def listId = null
        def filtersCampaigns = [campaign_id : cid]
        mailchimpService.campaigns(filtersCampaigns){ json ->
            def data = json?.get(CampaniaController.CAMPAIGN_STATS_DATA)
            data.each{ it ->
                it.each{ key, value ->
                    switch(key) {
                        case CampaniaController.CAMPAIGN_OPTION_LIST_ID:
                            listId = value
                        break
                    }
                }
            }
        }
        return listId
    }

    def save() {
        def campaniaUsuarioInstance = new CampaniaUsuario(params)
        if (!campaniaUsuarioInstance.save(flush: true)) {
            render(view: "create", model: [campaniaUsuarioInstance: campaniaUsuarioInstance])
            return
        }
        if (campaniaUsuarioInstance.campania?.cid?.length() > 0){
            def listId = getListIdByCampaignsId(campaniaUsuarioInstance.campania?.cid)
            
            mailchimpService.listSubscribe(listId, campaniaUsuarioInstance.usuario.email, null, CampaniaController.CAMPAIGN_CONTENT_HTML, true, false, true, false ) { json ->
                for(element in json) {
                    println element
                }
            }
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'campaniaUsuario.label', default: 'CampaniaUsuario'), campaniaUsuarioInstance.id])
        redirect(action: "show", id: campaniaUsuarioInstance.id)
    }

    def show() {
        def campaniaUsuarioInstance = CampaniaUsuario.get(params.id)
        if (!campaniaUsuarioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'campaniaUsuario.label', default: 'CampaniaUsuario'), params.id])
            redirect(action: "list")
            return
        }

        [campaniaUsuarioInstance: campaniaUsuarioInstance]
    }

    def edit() {
        def campaniaUsuarioInstance = CampaniaUsuario.get(params.id)
        if (!campaniaUsuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'campaniaUsuario.label', default: 'CampaniaUsuario'), params.id])
            redirect(action: "list")
            return
        }

        [campaniaUsuarioInstance: campaniaUsuarioInstance]
    }

    def update() {
        def campaniaUsuarioInstance = CampaniaUsuario.get(params.id)
        if (!campaniaUsuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'campaniaUsuario.label', default: 'CampaniaUsuario'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (campaniaUsuarioInstance.version > version) {
                campaniaUsuarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'campaniaUsuario.label', default: 'CampaniaUsuario')] as Object[],
                          "Another user has updated this CampaniaUsuario while you were editing")
                render(view: "edit", model: [campaniaUsuarioInstance: campaniaUsuarioInstance])
                return
            }
        }

        campaniaUsuarioInstance.properties = params

        if (!campaniaUsuarioInstance.save(flush: true)) {
            render(view: "edit", model: [campaniaUsuarioInstance: campaniaUsuarioInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'campaniaUsuario.label', default: 'CampaniaUsuario'), campaniaUsuarioInstance.id])
        redirect(action: "show", id: campaniaUsuarioInstance.id)
    }

    def delete() {
        def campaniaUsuarioInstance = CampaniaUsuario.get(params.id)
        if (!campaniaUsuarioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'campaniaUsuario.label', default: 'CampaniaUsuario'), params.id])
            redirect(action: "list")
            return
        }

        try {
            if (campaniaUsuarioInstance.campania?.cid?.length() > 0){
                def listId = getListIdByCampaignsId(campaniaUsuarioInstance.campania?.cid)
                mailchimpService.listUnsubscribe(listId, campaniaUsuarioInstance.usuario.email, false, false, false) { json ->
                    for(element in json) {
                        println element
                    }
                }
            }
            campaniaUsuarioInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'campaniaUsuario.label', default: 'CampaniaUsuario'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'campaniaUsuario.label', default: 'CampaniaUsuario'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
