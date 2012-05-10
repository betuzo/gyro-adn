package com.gyro.adn.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(TelefonoContactoController)
@Mock(TelefonoContacto)
class TelefonoContactoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/telefonoContacto/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.telefonoContactoInstanceList.size() == 0
        assert model.telefonoContactoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.telefonoContactoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.telefonoContactoInstance != null
        assert view == '/telefonoContacto/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/telefonoContacto/show/1'
        assert controller.flash.message != null
        assert TelefonoContacto.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/telefonoContacto/list'


        populateValidParams(params)
        def telefonoContacto = new TelefonoContacto(params)

        assert telefonoContacto.save() != null

        params.id = telefonoContacto.id

        def model = controller.show()

        assert model.telefonoContactoInstance == telefonoContacto
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/telefonoContacto/list'


        populateValidParams(params)
        def telefonoContacto = new TelefonoContacto(params)

        assert telefonoContacto.save() != null

        params.id = telefonoContacto.id

        def model = controller.edit()

        assert model.telefonoContactoInstance == telefonoContacto
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/telefonoContacto/list'

        response.reset()


        populateValidParams(params)
        def telefonoContacto = new TelefonoContacto(params)

        assert telefonoContacto.save() != null

        // test invalid parameters in update
        params.id = telefonoContacto.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/telefonoContacto/edit"
        assert model.telefonoContactoInstance != null

        telefonoContacto.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/telefonoContacto/show/$telefonoContacto.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        telefonoContacto.clearErrors()

        populateValidParams(params)
        params.id = telefonoContacto.id
        params.version = -1
        controller.update()

        assert view == "/telefonoContacto/edit"
        assert model.telefonoContactoInstance != null
        assert model.telefonoContactoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/telefonoContacto/list'

        response.reset()

        populateValidParams(params)
        def telefonoContacto = new TelefonoContacto(params)

        assert telefonoContacto.save() != null
        assert TelefonoContacto.count() == 1

        params.id = telefonoContacto.id

        controller.delete()

        assert TelefonoContacto.count() == 0
        assert TelefonoContacto.get(telefonoContacto.id) == null
        assert response.redirectedUrl == '/telefonoContacto/list'
    }
}
