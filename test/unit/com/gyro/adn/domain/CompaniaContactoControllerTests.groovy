package com.gyro.adn.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(CompaniaContactoController)
@Mock(CompaniaContacto)
class CompaniaContactoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/companiaContacto/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.companiaContactoInstanceList.size() == 0
        assert model.companiaContactoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.companiaContactoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.companiaContactoInstance != null
        assert view == '/companiaContacto/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/companiaContacto/show/1'
        assert controller.flash.message != null
        assert CompaniaContacto.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/companiaContacto/list'


        populateValidParams(params)
        def companiaContacto = new CompaniaContacto(params)

        assert companiaContacto.save() != null

        params.id = companiaContacto.id

        def model = controller.show()

        assert model.companiaContactoInstance == companiaContacto
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/companiaContacto/list'


        populateValidParams(params)
        def companiaContacto = new CompaniaContacto(params)

        assert companiaContacto.save() != null

        params.id = companiaContacto.id

        def model = controller.edit()

        assert model.companiaContactoInstance == companiaContacto
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/companiaContacto/list'

        response.reset()


        populateValidParams(params)
        def companiaContacto = new CompaniaContacto(params)

        assert companiaContacto.save() != null

        // test invalid parameters in update
        params.id = companiaContacto.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/companiaContacto/edit"
        assert model.companiaContactoInstance != null

        companiaContacto.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/companiaContacto/show/$companiaContacto.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        companiaContacto.clearErrors()

        populateValidParams(params)
        params.id = companiaContacto.id
        params.version = -1
        controller.update()

        assert view == "/companiaContacto/edit"
        assert model.companiaContactoInstance != null
        assert model.companiaContactoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/companiaContacto/list'

        response.reset()

        populateValidParams(params)
        def companiaContacto = new CompaniaContacto(params)

        assert companiaContacto.save() != null
        assert CompaniaContacto.count() == 1

        params.id = companiaContacto.id

        controller.delete()

        assert CompaniaContacto.count() == 0
        assert CompaniaContacto.get(companiaContacto.id) == null
        assert response.redirectedUrl == '/companiaContacto/list'
    }
}
