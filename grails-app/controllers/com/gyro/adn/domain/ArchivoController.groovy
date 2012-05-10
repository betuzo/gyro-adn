package com.gyro.adn.domain

import org.springframework.dao.DataIntegrityViolationException

class ArchivoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [archivoInstanceList: Archivo.list(params), archivoInstanceTotal: Archivo.count()]
    }

    def create() {
        [archivoInstance: new Archivo(params)]
    }

    def save() {
        def archivoInstance = new Archivo(params)
        if (!archivoInstance.save(flush: true)) {
            render(view: "create", model: [archivoInstance: archivoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'archivo.label', default: 'Archivo'), archivoInstance.id])
        redirect(action: "show", id: archivoInstance.id)
    }

    def show() {
        def archivoInstance = Archivo.get(params.id)
        if (!archivoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'archivo.label', default: 'Archivo'), params.id])
            redirect(action: "list")
            return
        }

        [archivoInstance: archivoInstance]
    }

    def edit() {
        def archivoInstance = Archivo.get(params.id)
        if (!archivoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'archivo.label', default: 'Archivo'), params.id])
            redirect(action: "list")
            return
        }

        [archivoInstance: archivoInstance]
    }

    def update() {
        def archivoInstance = Archivo.get(params.id)
        if (!archivoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'archivo.label', default: 'Archivo'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (archivoInstance.version > version) {
                archivoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'archivo.label', default: 'Archivo')] as Object[],
                          "Another user has updated this Archivo while you were editing")
                render(view: "edit", model: [archivoInstance: archivoInstance])
                return
            }
        }

        archivoInstance.properties = params

        if (!archivoInstance.save(flush: true)) {
            render(view: "edit", model: [archivoInstance: archivoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'archivo.label', default: 'Archivo'), archivoInstance.id])
        redirect(action: "show", id: archivoInstance.id)
    }

    def delete() {
        def archivoInstance = Archivo.get(params.id)
        if (!archivoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'archivo.label', default: 'Archivo'), params.id])
            redirect(action: "list")
            return
        }

        try {
            archivoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'archivo.label', default: 'Archivo'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'archivo.label', default: 'Archivo'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
