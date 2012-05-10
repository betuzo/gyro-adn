package com.gyro.adn.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(CampaniaController)
@Mock(Campania)
class CampaniaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/campania/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.campaniaInstanceList.size() == 0
        assert model.campaniaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.campaniaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.campaniaInstance != null
        assert view == '/campania/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/campania/show/1'
        assert controller.flash.message != null
        assert Campania.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/campania/list'


        populateValidParams(params)
        def campania = new Campania(params)

        assert campania.save() != null

        params.id = campania.id

        def model = controller.show()

        assert model.campaniaInstance == campania
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/campania/list'


        populateValidParams(params)
        def campania = new Campania(params)

        assert campania.save() != null

        params.id = campania.id

        def model = controller.edit()

        assert model.campaniaInstance == campania
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/campania/list'

        response.reset()


        populateValidParams(params)
        def campania = new Campania(params)

        assert campania.save() != null

        // test invalid parameters in update
        params.id = campania.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/campania/edit"
        assert model.campaniaInstance != null

        campania.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/campania/show/$campania.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        campania.clearErrors()

        populateValidParams(params)
        params.id = campania.id
        params.version = -1
        controller.update()

        assert view == "/campania/edit"
        assert model.campaniaInstance != null
        assert model.campaniaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/campania/list'

        response.reset()

        populateValidParams(params)
        def campania = new Campania(params)

        assert campania.save() != null
        assert Campania.count() == 1

        params.id = campania.id

        controller.delete()

        assert Campania.count() == 0
        assert Campania.get(campania.id) == null
        assert response.redirectedUrl == '/campania/list'
    }
}
