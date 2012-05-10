package com.gyro.adn.domain

import org.springframework.dao.DataIntegrityViolationException

class CompaniaContactoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [companiaContactoInstanceList: CompaniaContacto.list(params), companiaContactoInstanceTotal: CompaniaContacto.count()]
    }

    def create() {
        [companiaContactoInstance: new CompaniaContacto(params)]
    }

    def save() {
        def companiaContactoInstance = new CompaniaContacto(params)
        if (!companiaContactoInstance.save(flush: true)) {
            render(view: "create", model: [companiaContactoInstance: companiaContactoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'companiaContacto.label', default: 'CompaniaContacto'), companiaContactoInstance.id])
        redirect(action: "show", id: companiaContactoInstance.id)
    }

    def show() {
        def companiaContactoInstance = CompaniaContacto.get(params.id)
        if (!companiaContactoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'companiaContacto.label', default: 'CompaniaContacto'), params.id])
            redirect(action: "list")
            return
        }

        [companiaContactoInstance: companiaContactoInstance]
    }

    def edit() {
        def companiaContactoInstance = CompaniaContacto.get(params.id)
        if (!companiaContactoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'companiaContacto.label', default: 'CompaniaContacto'), params.id])
            redirect(action: "list")
            return
        }

        [companiaContactoInstance: companiaContactoInstance]
    }

    def update() {
        def companiaContactoInstance = CompaniaContacto.get(params.id)
        if (!companiaContactoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'companiaContacto.label', default: 'CompaniaContacto'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (companiaContactoInstance.version > version) {
                companiaContactoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'companiaContacto.label', default: 'CompaniaContacto')] as Object[],
                          "Another user has updated this CompaniaContacto while you were editing")
                render(view: "edit", model: [companiaContactoInstance: companiaContactoInstance])
                return
            }
        }

        companiaContactoInstance.properties = params

        if (!companiaContactoInstance.save(flush: true)) {
            render(view: "edit", model: [companiaContactoInstance: companiaContactoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'companiaContacto.label', default: 'CompaniaContacto'), companiaContactoInstance.id])
        redirect(action: "show", id: companiaContactoInstance.id)
    }

    def delete() {
        def companiaContactoInstance = CompaniaContacto.get(params.id)
        if (!companiaContactoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'companiaContacto.label', default: 'CompaniaContacto'), params.id])
            redirect(action: "list")
            return
        }

        try {
            companiaContactoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'companiaContacto.label', default: 'CompaniaContacto'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'companiaContacto.label', default: 'CompaniaContacto'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
