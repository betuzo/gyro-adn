package com.gyro.adn.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(JefeCampaniaController)
@Mock(JefeCampania)
class JefeCampaniaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/jefeCampania/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.jefeCampaniaInstanceList.size() == 0
        assert model.jefeCampaniaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.jefeCampaniaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.jefeCampaniaInstance != null
        assert view == '/jefeCampania/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/jefeCampania/show/1'
        assert controller.flash.message != null
        assert JefeCampania.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/jefeCampania/list'


        populateValidParams(params)
        def jefeCampania = new JefeCampania(params)

        assert jefeCampania.save() != null

        params.id = jefeCampania.id

        def model = controller.show()

        assert model.jefeCampaniaInstance == jefeCampania
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/jefeCampania/list'


        populateValidParams(params)
        def jefeCampania = new JefeCampania(params)

        assert jefeCampania.save() != null

        params.id = jefeCampania.id

        def model = controller.edit()

        assert model.jefeCampaniaInstance == jefeCampania
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/jefeCampania/list'

        response.reset()


        populateValidParams(params)
        def jefeCampania = new JefeCampania(params)

        assert jefeCampania.save() != null

        // test invalid parameters in update
        params.id = jefeCampania.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/jefeCampania/edit"
        assert model.jefeCampaniaInstance != null

        jefeCampania.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/jefeCampania/show/$jefeCampania.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        jefeCampania.clearErrors()

        populateValidParams(params)
        params.id = jefeCampania.id
        params.version = -1
        controller.update()

        assert view == "/jefeCampania/edit"
        assert model.jefeCampaniaInstance != null
        assert model.jefeCampaniaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/jefeCampania/list'

        response.reset()

        populateValidParams(params)
        def jefeCampania = new JefeCampania(params)

        assert jefeCampania.save() != null
        assert JefeCampania.count() == 1

        params.id = jefeCampania.id

        controller.delete()

        assert JefeCampania.count() == 0
        assert JefeCampania.get(jefeCampania.id) == null
        assert response.redirectedUrl == '/jefeCampania/list'
    }
}
