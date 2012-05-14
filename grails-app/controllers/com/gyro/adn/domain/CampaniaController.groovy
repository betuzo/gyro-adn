package com.gyro.adn.domain

import org.springframework.dao.DataIntegrityViolationException
import com.nwire.mailchimp.IMailChimpServices;

class CampaniaController {

    def gchimpService

    def afterInterceptor = { model ->
        def apiKey = gchimpService.apiKey
        def keySize = apiKey.size()
        def maskSize = keySize - 8

        model.apiKey = '*' * maskSize  + apiKey[maskSize..keySize-1]
        model.defaultListId = gchimpService.defaultListId
    }

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [campaniaInstanceList: Campania.list(params), campaniaInstanceTotal: Campania.count()]
    }

    def create() {
        [campaniaInstance: new Campania(params)]
    }

    def save() {
        def campaniaInstance = new Campania(params)
        if (!campaniaInstance.save(flush: true)) {
            render(view: "create", model: [campaniaInstance: campaniaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'campania.label', default: 'Campania'), campaniaInstance.id])
        redirect(action: "show", id: campaniaInstance.id)
    }

    def show() {
        def campaniaInstance = Campania.get(params.id)
        if (!campaniaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'campania.label', default: 'Campania'), params.id])
            redirect(action: "list")
            return
        }
        if (campaniaInstance.cid?.length() > 0){
            def campaignStats = gchimpService.campaignStats(campaniaInstance.cid)
            campaniaInstance.estadisticas = campaignStats
        }
        
        [campaniaInstance: campaniaInstance]
    }

    def edit() {
        def campaniaInstance = Campania.get(params.id)
        if (!campaniaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'campania.label', default: 'Campania'), params.id])
            redirect(action: "list")
            return
        }

        [campaniaInstance: campaniaInstance]
    }

    def update() {
        def campaniaInstance = Campania.get(params.id)
        if (!campaniaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'campania.label', default: 'Campania'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (campaniaInstance.version > version) {
                campaniaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'campania.label', default: 'Campania')] as Object[],
                          "Another user has updated this Campania while you were editing")
                render(view: "edit", model: [campaniaInstance: campaniaInstance])
                return
            }
        }

        campaniaInstance.properties = params

        if (!campaniaInstance.save(flush: true)) {
            render(view: "edit", model: [campaniaInstance: campaniaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'campania.label', default: 'Campania'), campaniaInstance.id])
        redirect(action: "show", id: campaniaInstance.id)
    }

    def delete() {
        def campaniaInstance = Campania.get(params.id)
        if (!campaniaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'campania.label', default: 'Campania'), params.id])
            redirect(action: "list")
            return
        }

        try {
            campaniaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'campania.label', default: 'Campania'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'campania.label', default: 'Campania'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    def companiaSelectedProducto = {
        def compania = Compania.get(params.id)
        render g.select(optionKey: 'id', 
                        from: compania.productos, 
                        id: 'producto', 
                        name: 'producto.id', 
                        class: 'many-to-one', 
                        required: '', 
                        value: params.idProducto)
    }

    def companiaSelectedContacto = {
        def compania = Compania.get(params.id)
        render g.select(optionKey: 'id', 
                        from: compania.contactos, 
                        id: 'contacto', 
                        name: 'contacto.id', 
                        class: 'many-to-one', 
                        required: '', 
                        value: params.idContacto)
    }
}
