package com.gyro.adn.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(CompaniaController)
@Mock(Compania)
class CompaniaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/compania/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.companiaInstanceList.size() == 0
        assert model.companiaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.companiaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.companiaInstance != null
        assert view == '/compania/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/compania/show/1'
        assert controller.flash.message != null
        assert Compania.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/compania/list'


        populateValidParams(params)
        def compania = new Compania(params)

        assert compania.save() != null

        params.id = compania.id

        def model = controller.show()

        assert model.companiaInstance == compania
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/compania/list'


        populateValidParams(params)
        def compania = new Compania(params)

        assert compania.save() != null

        params.id = compania.id

        def model = controller.edit()

        assert model.companiaInstance == compania
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/compania/list'

        response.reset()


        populateValidParams(params)
        def compania = new Compania(params)

        assert compania.save() != null

        // test invalid parameters in update
        params.id = compania.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/compania/edit"
        assert model.companiaInstance != null

        compania.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/compania/show/$compania.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        compania.clearErrors()

        populateValidParams(params)
        params.id = compania.id
        params.version = -1
        controller.update()

        assert view == "/compania/edit"
        assert model.companiaInstance != null
        assert model.companiaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/compania/list'

        response.reset()

        populateValidParams(params)
        def compania = new Compania(params)

        assert compania.save() != null
        assert Compania.count() == 1

        params.id = compania.id

        controller.delete()

        assert Compania.count() == 0
        assert Compania.get(compania.id) == null
        assert response.redirectedUrl == '/compania/list'
    }
}
