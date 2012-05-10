package com.gyro.adn.domain

import org.springframework.dao.DataIntegrityViolationException

class CompaniaSubclasificacionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [companiaSubclasificacionInstanceList: CompaniaSubclasificacion.list(params), companiaSubclasificacionInstanceTotal: CompaniaSubclasificacion.count()]
    }

    def create() {
        [companiaSubclasificacionInstance: new CompaniaSubclasificacion(params)]
    }

    def save() {
        def companiaSubclasificacionInstance = new CompaniaSubclasificacion(params)
        if (!companiaSubclasificacionInstance.save(flush: true)) {
            render(view: "create", model: [companiaSubclasificacionInstance: companiaSubclasificacionInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'companiaSubclasificacion.label', default: 'CompaniaSubclasificacion'), companiaSubclasificacionInstance.id])
        redirect(action: "show", id: companiaSubclasificacionInstance.id)
    }

    def show() {
        def companiaSubclasificacionInstance = CompaniaSubclasificacion.get(params.id)
        if (!companiaSubclasificacionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'companiaSubclasificacion.label', default: 'CompaniaSubclasificacion'), params.id])
            redirect(action: "list")
            return
        }

        [companiaSubclasificacionInstance: companiaSubclasificacionInstance]
    }

    def edit() {
        def companiaSubclasificacionInstance = CompaniaSubclasificacion.get(params.id)
        if (!companiaSubclasificacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'companiaSubclasificacion.label', default: 'CompaniaSubclasificacion'), params.id])
            redirect(action: "list")
            return
        }

        [companiaSubclasificacionInstance: companiaSubclasificacionInstance]
    }

    def update() {
        def companiaSubclasificacionInstance = CompaniaSubclasificacion.get(params.id)
        if (!companiaSubclasificacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'companiaSubclasificacion.label', default: 'CompaniaSubclasificacion'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (companiaSubclasificacionInstance.version > version) {
                companiaSubclasificacionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'companiaSubclasificacion.label', default: 'CompaniaSubclasificacion')] as Object[],
                          "Another user has updated this CompaniaSubclasificacion while you were editing")
                render(view: "edit", model: [companiaSubclasificacionInstance: companiaSubclasificacionInstance])
                return
            }
        }

        companiaSubclasificacionInstance.properties = params

        if (!companiaSubclasificacionInstance.save(flush: true)) {
            render(view: "edit", model: [companiaSubclasificacionInstance: companiaSubclasificacionInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'companiaSubclasificacion.label', default: 'CompaniaSubclasificacion'), companiaSubclasificacionInstance.id])
        redirect(action: "show", id: companiaSubclasificacionInstance.id)
    }

    def delete() {
        def companiaSubclasificacionInstance = CompaniaSubclasificacion.get(params.id)
        if (!companiaSubclasificacionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'companiaSubclasificacion.label', default: 'CompaniaSubclasificacion'), params.id])
            redirect(action: "list")
            return
        }

        try {
            companiaSubclasificacionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'companiaSubclasificacion.label', default: 'CompaniaSubclasificacion'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'companiaSubclasificacion.label', default: 'CompaniaSubclasificacion'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
