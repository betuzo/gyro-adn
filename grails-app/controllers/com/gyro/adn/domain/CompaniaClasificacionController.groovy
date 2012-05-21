package com.gyro.adn.domain

import org.springframework.dao.DataIntegrityViolationException

class CompaniaClasificacionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [companiaClasificacionInstanceList: CompaniaClasificacion.list(params), companiaClasificacionInstanceTotal: CompaniaClasificacion.count()]
    }

    def create() {
        [companiaClasificacionInstance: new CompaniaClasificacion(params)]
    }

    def save() {
        def companiaClasificacionInstance = new CompaniaClasificacion(params)
        if (!companiaClasificacionInstance.save(flush: true)) {
            render(view: "create", model: [companiaClasificacionInstance: companiaClasificacionInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'companiaClasificacion.label', default: 'CompaniaClasificacion'), companiaClasificacionInstance.id])
        redirect(action: "show", id: companiaClasificacionInstance.id)
    }

    def show() {
        def companiaClasificacionInstance = CompaniaClasificacion.get(params.id)
        if (!companiaClasificacionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'companiaClasificacion.label', default: 'CompaniaClasificacion'), params.id])
            redirect(action: "list")
            return
        }

        [companiaClasificacionInstance: companiaClasificacionInstance]
    }

    def edit() {
        def companiaClasificacionInstance = CompaniaClasificacion.get(params.id)
        if (!companiaClasificacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'companiaClasificacion.label', default: 'CompaniaClasificacion'), params.id])
            redirect(action: "list")
            return
        }

        [companiaClasificacionInstance: companiaClasificacionInstance]
    }

    def update() {
        def companiaClasificacionInstance = CompaniaClasificacion.get(params.id)
        if (!companiaClasificacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'companiaClasificacion.label', default: 'CompaniaClasificacion'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (companiaClasificacionInstance.version > version) {
                companiaClasificacionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'companiaClasificacion.label', default: 'CompaniaClasificacion')] as Object[],
                          "Another user has updated this CompaniaClasificacion while you were editing")
                render(view: "edit", model: [companiaClasificacionInstance: companiaClasificacionInstance])
                return
            }
        }

        companiaClasificacionInstance.properties = params

        if (!companiaClasificacionInstance.save(flush: true)) {
            render(view: "edit", model: [companiaClasificacionInstance: companiaClasificacionInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'companiaClasificacion.label', default: 'CompaniaClasificacion'), companiaClasificacionInstance.id])
        redirect(action: "show", id: companiaClasificacionInstance.id)
    }

    def delete() {
        def companiaClasificacionInstance = CompaniaClasificacion.get(params.id)
        if (!companiaClasificacionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'companiaClasificacion.label', default: 'CompaniaClasificacion'), params.id])
            redirect(action: "list")
            return
        }

        try {
            companiaClasificacionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'companiaClasificacion.label', default: 'CompaniaClasificacion'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'companiaClasificacion.label', default: 'CompaniaClasificacion'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
