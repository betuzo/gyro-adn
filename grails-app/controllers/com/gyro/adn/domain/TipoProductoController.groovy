package com.gyro.adn.domain

import org.springframework.dao.DataIntegrityViolationException

class TipoProductoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [tipoProductoInstanceList: TipoProducto.list(params), tipoProductoInstanceTotal: TipoProducto.count()]
    }

    def create() {
        [tipoProductoInstance: new TipoProducto(params)]
    }

    def save() {
        def tipoProductoInstance = new TipoProducto(params)
        if (!tipoProductoInstance.save(flush: true)) {
            render(view: "create", model: [tipoProductoInstance: tipoProductoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'tipoProducto.label', default: 'TipoProducto'), tipoProductoInstance.id])
        redirect(action: "show", id: tipoProductoInstance.id)
    }

    def show() {
        def tipoProductoInstance = TipoProducto.get(params.id)
        if (!tipoProductoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoProducto.label', default: 'TipoProducto'), params.id])
            redirect(action: "list")
            return
        }

        [tipoProductoInstance: tipoProductoInstance]
    }

    def edit() {
        def tipoProductoInstance = TipoProducto.get(params.id)
        if (!tipoProductoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoProducto.label', default: 'TipoProducto'), params.id])
            redirect(action: "list")
            return
        }

        [tipoProductoInstance: tipoProductoInstance]
    }

    def update() {
        def tipoProductoInstance = TipoProducto.get(params.id)
        if (!tipoProductoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoProducto.label', default: 'TipoProducto'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (tipoProductoInstance.version > version) {
                tipoProductoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tipoProducto.label', default: 'TipoProducto')] as Object[],
                          "Another user has updated this TipoProducto while you were editing")
                render(view: "edit", model: [tipoProductoInstance: tipoProductoInstance])
                return
            }
        }

        tipoProductoInstance.properties = params

        if (!tipoProductoInstance.save(flush: true)) {
            render(view: "edit", model: [tipoProductoInstance: tipoProductoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoProducto.label', default: 'TipoProducto'), tipoProductoInstance.id])
        redirect(action: "show", id: tipoProductoInstance.id)
    }

    def delete() {
        def tipoProductoInstance = TipoProducto.get(params.id)
        if (!tipoProductoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoProducto.label', default: 'TipoProducto'), params.id])
            redirect(action: "list")
            return
        }

        try {
            tipoProductoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoProducto.label', default: 'TipoProducto'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoProducto.label', default: 'TipoProducto'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
