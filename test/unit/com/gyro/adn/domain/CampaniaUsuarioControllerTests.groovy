package com.gyro.adn.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(CampaniaUsuarioController)
@Mock(CampaniaUsuario)
class CampaniaUsuarioControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/campaniaUsuario/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.campaniaUsuarioInstanceList.size() == 0
        assert model.campaniaUsuarioInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.campaniaUsuarioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.campaniaUsuarioInstance != null
        assert view == '/campaniaUsuario/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/campaniaUsuario/show/1'
        assert controller.flash.message != null
        assert CampaniaUsuario.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/campaniaUsuario/list'


        populateValidParams(params)
        def campaniaUsuario = new CampaniaUsuario(params)

        assert campaniaUsuario.save() != null

        params.id = campaniaUsuario.id

        def model = controller.show()

        assert model.campaniaUsuarioInstance == campaniaUsuario
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/campaniaUsuario/list'


        populateValidParams(params)
        def campaniaUsuario = new CampaniaUsuario(params)

        assert campaniaUsuario.save() != null

        params.id = campaniaUsuario.id

        def model = controller.edit()

        assert model.campaniaUsuarioInstance == campaniaUsuario
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/campaniaUsuario/list'

        response.reset()


        populateValidParams(params)
        def campaniaUsuario = new CampaniaUsuario(params)

        assert campaniaUsuario.save() != null

        // test invalid parameters in update
        params.id = campaniaUsuario.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/campaniaUsuario/edit"
        assert model.campaniaUsuarioInstance != null

        campaniaUsuario.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/campaniaUsuario/show/$campaniaUsuario.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        campaniaUsuario.clearErrors()

        populateValidParams(params)
        params.id = campaniaUsuario.id
        params.version = -1
        controller.update()

        assert view == "/campaniaUsuario/edit"
        assert model.campaniaUsuarioInstance != null
        assert model.campaniaUsuarioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/campaniaUsuario/list'

        response.reset()

        populateValidParams(params)
        def campaniaUsuario = new CampaniaUsuario(params)

        assert campaniaUsuario.save() != null
        assert CampaniaUsuario.count() == 1

        params.id = campaniaUsuario.id

        controller.delete()

        assert CampaniaUsuario.count() == 0
        assert CampaniaUsuario.get(campaniaUsuario.id) == null
        assert response.redirectedUrl == '/campaniaUsuario/list'
    }
}
