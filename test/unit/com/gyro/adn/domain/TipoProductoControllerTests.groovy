package com.gyro.adn.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(TipoProductoController)
@Mock(TipoProducto)
class TipoProductoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/tipoProducto/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.tipoProductoInstanceList.size() == 0
        assert model.tipoProductoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.tipoProductoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.tipoProductoInstance != null
        assert view == '/tipoProducto/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/tipoProducto/show/1'
        assert controller.flash.message != null
        assert TipoProducto.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoProducto/list'


        populateValidParams(params)
        def tipoProducto = new TipoProducto(params)

        assert tipoProducto.save() != null

        params.id = tipoProducto.id

        def model = controller.show()

        assert model.tipoProductoInstance == tipoProducto
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoProducto/list'


        populateValidParams(params)
        def tipoProducto = new TipoProducto(params)

        assert tipoProducto.save() != null

        params.id = tipoProducto.id

        def model = controller.edit()

        assert model.tipoProductoInstance == tipoProducto
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/tipoProducto/list'

        response.reset()


        populateValidParams(params)
        def tipoProducto = new TipoProducto(params)

        assert tipoProducto.save() != null

        // test invalid parameters in update
        params.id = tipoProducto.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/tipoProducto/edit"
        assert model.tipoProductoInstance != null

        tipoProducto.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/tipoProducto/show/$tipoProducto.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        tipoProducto.clearErrors()

        populateValidParams(params)
        params.id = tipoProducto.id
        params.version = -1
        controller.update()

        assert view == "/tipoProducto/edit"
        assert model.tipoProductoInstance != null
        assert model.tipoProductoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/tipoProducto/list'

        response.reset()

        populateValidParams(params)
        def tipoProducto = new TipoProducto(params)

        assert tipoProducto.save() != null
        assert TipoProducto.count() == 1

        params.id = tipoProducto.id

        controller.delete()

        assert TipoProducto.count() == 0
        assert TipoProducto.get(tipoProducto.id) == null
        assert response.redirectedUrl == '/tipoProducto/list'
    }
}
