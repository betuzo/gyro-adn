package com.gyro.adn.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(TelefonoUsuarioController)
@Mock(TelefonoUsuario)
class TelefonoUsuarioControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/telefonoUsuario/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.telefonoUsuarioInstanceList.size() == 0
        assert model.telefonoUsuarioInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.telefonoUsuarioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.telefonoUsuarioInstance != null
        assert view == '/telefonoUsuario/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/telefonoUsuario/show/1'
        assert controller.flash.message != null
        assert TelefonoUsuario.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/telefonoUsuario/list'


        populateValidParams(params)
        def telefonoUsuario = new TelefonoUsuario(params)

        assert telefonoUsuario.save() != null

        params.id = telefonoUsuario.id

        def model = controller.show()

        assert model.telefonoUsuarioInstance == telefonoUsuario
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/telefonoUsuario/list'


        populateValidParams(params)
        def telefonoUsuario = new TelefonoUsuario(params)

        assert telefonoUsuario.save() != null

        params.id = telefonoUsuario.id

        def model = controller.edit()

        assert model.telefonoUsuarioInstance == telefonoUsuario
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/telefonoUsuario/list'

        response.reset()


        populateValidParams(params)
        def telefonoUsuario = new TelefonoUsuario(params)

        assert telefonoUsuario.save() != null

        // test invalid parameters in update
        params.id = telefonoUsuario.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/telefonoUsuario/edit"
        assert model.telefonoUsuarioInstance != null

        telefonoUsuario.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/telefonoUsuario/show/$telefonoUsuario.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        telefonoUsuario.clearErrors()

        populateValidParams(params)
        params.id = telefonoUsuario.id
        params.version = -1
        controller.update()

        assert view == "/telefonoUsuario/edit"
        assert model.telefonoUsuarioInstance != null
        assert model.telefonoUsuarioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/telefonoUsuario/list'

        response.reset()

        populateValidParams(params)
        def telefonoUsuario = new TelefonoUsuario(params)

        assert telefonoUsuario.save() != null
        assert TelefonoUsuario.count() == 1

        params.id = telefonoUsuario.id

        controller.delete()

        assert TelefonoUsuario.count() == 0
        assert TelefonoUsuario.get(telefonoUsuario.id) == null
        assert response.redirectedUrl == '/telefonoUsuario/list'
    }
}
