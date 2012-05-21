package com.gyro.adn.domain

import org.springframework.dao.DataIntegrityViolationException

class TelefonoContactoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [telefonoContactoInstanceList: TelefonoContacto.list(params), telefonoContactoInstanceTotal: TelefonoContacto.count()]
    }

    def create() {
        [telefonoContactoInstance: new TelefonoContacto(params)]
    }

    def save() {
        def telefonoContactoInstance = new TelefonoContacto(params)
        if (!telefonoContactoInstance.save(flush: true)) {
            render(view: "create", model: [telefonoContactoInstance: telefonoContactoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'telefonoContacto.label', default: 'TelefonoContacto'), telefonoContactoInstance.id])
        redirect(action: "show", id: telefonoContactoInstance.id)
    }

    def show() {
        def telefonoContactoInstance = TelefonoContacto.get(params.id)
        if (!telefonoContactoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefonoContacto.label', default: 'TelefonoContacto'), params.id])
            redirect(action: "list")
            return
        }

        [telefonoContactoInstance: telefonoContactoInstance]
    }

    def edit() {
        def telefonoContactoInstance = TelefonoContacto.get(params.id)
        if (!telefonoContactoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefonoContacto.label', default: 'TelefonoContacto'), params.id])
            redirect(action: "list")
            return
        }

        [telefonoContactoInstance: telefonoContactoInstance]
    }

    def update() {
        def telefonoContactoInstance = TelefonoContacto.get(params.id)
        if (!telefonoContactoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefonoContacto.label', default: 'TelefonoContacto'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (telefonoContactoInstance.version > version) {
                telefonoContactoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'telefonoContacto.label', default: 'TelefonoContacto')] as Object[],
                          "Another user has updated this TelefonoContacto while you were editing")
                render(view: "edit", model: [telefonoContactoInstance: telefonoContactoInstance])
                return
            }
        }

        telefonoContactoInstance.properties = params

        if (!telefonoContactoInstance.save(flush: true)) {
            render(view: "edit", model: [telefonoContactoInstance: telefonoContactoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'telefonoContacto.label', default: 'TelefonoContacto'), telefonoContactoInstance.id])
        redirect(action: "show", id: telefonoContactoInstance.id)
    }

    def delete() {
        def telefonoContactoInstance = TelefonoContacto.get(params.id)
        if (!telefonoContactoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefonoContacto.label', default: 'TelefonoContacto'), params.id])
            redirect(action: "list")
            return
        }

        try {
            telefonoContactoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'telefonoContacto.label', default: 'TelefonoContacto'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'telefonoContacto.label', default: 'TelefonoContacto'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
