package com.gyro.adn.domain

import org.springframework.dao.DataIntegrityViolationException

class JefeCampaniaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [jefeCampaniaInstanceList: JefeCampania.list(params), jefeCampaniaInstanceTotal: JefeCampania.count()]
    }

    def create() {
        [jefeCampaniaInstance: new JefeCampania(params)]
    }

    def save() {
        def jefeCampaniaInstance = new JefeCampania(params)
        jefeCampaniaInstance.enabled = true
        jefeCampaniaInstance.accountExpired = false
        jefeCampaniaInstance.accountLocked = false
        jefeCampaniaInstance.passwordExpired = false
        if (!jefeCampaniaInstance.save(flush: true)) {
            render(view: "create", model: [jefeCampaniaInstance: jefeCampaniaInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'jefeCampania.label', default: 'JefeCampania'), jefeCampaniaInstance.id])
        redirect(action: "show", id: jefeCampaniaInstance.id)
    }

    def show() {
        def jefeCampaniaInstance = JefeCampania.get(params.id)
        if (!jefeCampaniaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'jefeCampania.label', default: 'JefeCampania'), params.id])
            redirect(action: "list")
            return
        }

        [jefeCampaniaInstance: jefeCampaniaInstance]
    }

    def edit() {
        def jefeCampaniaInstance = JefeCampania.get(params.id)
        if (!jefeCampaniaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'jefeCampania.label', default: 'JefeCampania'), params.id])
            redirect(action: "list")
            return
        }

        [jefeCampaniaInstance: jefeCampaniaInstance]
    }

    def update() {
        def jefeCampaniaInstance = JefeCampania.get(params.id)
        if (!jefeCampaniaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'jefeCampania.label', default: 'JefeCampania'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (jefeCampaniaInstance.version > version) {
                jefeCampaniaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'jefeCampania.label', default: 'JefeCampania')] as Object[],
                          "Another user has updated this JefeCampania while you were editing")
                render(view: "edit", model: [jefeCampaniaInstance: jefeCampaniaInstance])
                return
            }
        }

        jefeCampaniaInstance.properties = params

        if (!jefeCampaniaInstance.save(flush: true)) {
            render(view: "edit", model: [jefeCampaniaInstance: jefeCampaniaInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'jefeCampania.label', default: 'JefeCampania'), jefeCampaniaInstance.id])
        redirect(action: "show", id: jefeCampaniaInstance.id)
    }

    def delete() {
        def jefeCampaniaInstance = JefeCampania.get(params.id)
        if (!jefeCampaniaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'jefeCampania.label', default: 'JefeCampania'), params.id])
            redirect(action: "list")
            return
        }

        try {
            jefeCampaniaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'jefeCampania.label', default: 'JefeCampania'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'jefeCampania.label', default: 'JefeCampania'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
