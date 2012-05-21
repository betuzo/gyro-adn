package com.gyro.adn.domain

import org.springframework.dao.DataIntegrityViolationException

class TelefonoUsuarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [telefonoUsuarioInstanceList: TelefonoUsuario.list(params), telefonoUsuarioInstanceTotal: TelefonoUsuario.count()]
    }

    def create() {
        [telefonoUsuarioInstance: new TelefonoUsuario(params)]
    }

    def save() {
        def telefonoUsuarioInstance = new TelefonoUsuario(params)
        if (!telefonoUsuarioInstance.save(flush: true)) {
            render(view: "create", model: [telefonoUsuarioInstance: telefonoUsuarioInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'telefonoUsuario.label', default: 'TelefonoUsuario'), telefonoUsuarioInstance.id])
        redirect(action: "show", id: telefonoUsuarioInstance.id)
    }

    def show() {
        def telefonoUsuarioInstance = TelefonoUsuario.get(params.id)
        if (!telefonoUsuarioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefonoUsuario.label', default: 'TelefonoUsuario'), params.id])
            redirect(action: "list")
            return
        }

        [telefonoUsuarioInstance: telefonoUsuarioInstance]
    }

    def edit() {
        def telefonoUsuarioInstance = TelefonoUsuario.get(params.id)
        if (!telefonoUsuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefonoUsuario.label', default: 'TelefonoUsuario'), params.id])
            redirect(action: "list")
            return
        }

        [telefonoUsuarioInstance: telefonoUsuarioInstance]
    }

    def update() {
        def telefonoUsuarioInstance = TelefonoUsuario.get(params.id)
        if (!telefonoUsuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefonoUsuario.label', default: 'TelefonoUsuario'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (telefonoUsuarioInstance.version > version) {
                telefonoUsuarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'telefonoUsuario.label', default: 'TelefonoUsuario')] as Object[],
                          "Another user has updated this TelefonoUsuario while you were editing")
                render(view: "edit", model: [telefonoUsuarioInstance: telefonoUsuarioInstance])
                return
            }
        }

        telefonoUsuarioInstance.properties = params

        if (!telefonoUsuarioInstance.save(flush: true)) {
            render(view: "edit", model: [telefonoUsuarioInstance: telefonoUsuarioInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'telefonoUsuario.label', default: 'TelefonoUsuario'), telefonoUsuarioInstance.id])
        redirect(action: "show", id: telefonoUsuarioInstance.id)
    }

    def delete() {
        def telefonoUsuarioInstance = TelefonoUsuario.get(params.id)
        if (!telefonoUsuarioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefonoUsuario.label', default: 'TelefonoUsuario'), params.id])
            redirect(action: "list")
            return
        }

        try {
            telefonoUsuarioInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'telefonoUsuario.label', default: 'TelefonoUsuario'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'telefonoUsuario.label', default: 'TelefonoUsuario'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
