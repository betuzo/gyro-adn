package com.gyro.adn.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(CompaniaClasificacionController)
@Mock(CompaniaClasificacion)
class CompaniaClasificacionControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/companiaClasificacion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.companiaClasificacionInstanceList.size() == 0
        assert model.companiaClasificacionInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.companiaClasificacionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.companiaClasificacionInstance != null
        assert view == '/companiaClasificacion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/companiaClasificacion/show/1'
        assert controller.flash.message != null
        assert CompaniaClasificacion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/companiaClasificacion/list'


        populateValidParams(params)
        def companiaClasificacion = new CompaniaClasificacion(params)

        assert companiaClasificacion.save() != null

        params.id = companiaClasificacion.id

        def model = controller.show()

        assert model.companiaClasificacionInstance == companiaClasificacion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/companiaClasificacion/list'


        populateValidParams(params)
        def companiaClasificacion = new CompaniaClasificacion(params)

        assert companiaClasificacion.save() != null

        params.id = companiaClasificacion.id

        def model = controller.edit()

        assert model.companiaClasificacionInstance == companiaClasificacion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/companiaClasificacion/list'

        response.reset()


        populateValidParams(params)
        def companiaClasificacion = new CompaniaClasificacion(params)

        assert companiaClasificacion.save() != null

        // test invalid parameters in update
        params.id = companiaClasificacion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/companiaClasificacion/edit"
        assert model.companiaClasificacionInstance != null

        companiaClasificacion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/companiaClasificacion/show/$companiaClasificacion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        companiaClasificacion.clearErrors()

        populateValidParams(params)
        params.id = companiaClasificacion.id
        params.version = -1
        controller.update()

        assert view == "/companiaClasificacion/edit"
        assert model.companiaClasificacionInstance != null
        assert model.companiaClasificacionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/companiaClasificacion/list'

        response.reset()

        populateValidParams(params)
        def companiaClasificacion = new CompaniaClasificacion(params)

        assert companiaClasificacion.save() != null
        assert CompaniaClasificacion.count() == 1

        params.id = companiaClasificacion.id

        controller.delete()

        assert CompaniaClasificacion.count() == 0
        assert CompaniaClasificacion.get(companiaClasificacion.id) == null
        assert response.redirectedUrl == '/companiaClasificacion/list'
    }
}
