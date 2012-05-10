package com.gyro.adn.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(CompaniaSubclasificacionController)
@Mock(CompaniaSubclasificacion)
class CompaniaSubclasificacionControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/companiaSubclasificacion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.companiaSubclasificacionInstanceList.size() == 0
        assert model.companiaSubclasificacionInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.companiaSubclasificacionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.companiaSubclasificacionInstance != null
        assert view == '/companiaSubclasificacion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/companiaSubclasificacion/show/1'
        assert controller.flash.message != null
        assert CompaniaSubclasificacion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/companiaSubclasificacion/list'


        populateValidParams(params)
        def companiaSubclasificacion = new CompaniaSubclasificacion(params)

        assert companiaSubclasificacion.save() != null

        params.id = companiaSubclasificacion.id

        def model = controller.show()

        assert model.companiaSubclasificacionInstance == companiaSubclasificacion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/companiaSubclasificacion/list'


        populateValidParams(params)
        def companiaSubclasificacion = new CompaniaSubclasificacion(params)

        assert companiaSubclasificacion.save() != null

        params.id = companiaSubclasificacion.id

        def model = controller.edit()

        assert model.companiaSubclasificacionInstance == companiaSubclasificacion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/companiaSubclasificacion/list'

        response.reset()


        populateValidParams(params)
        def companiaSubclasificacion = new CompaniaSubclasificacion(params)

        assert companiaSubclasificacion.save() != null

        // test invalid parameters in update
        params.id = companiaSubclasificacion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/companiaSubclasificacion/edit"
        assert model.companiaSubclasificacionInstance != null

        companiaSubclasificacion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/companiaSubclasificacion/show/$companiaSubclasificacion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        companiaSubclasificacion.clearErrors()

        populateValidParams(params)
        params.id = companiaSubclasificacion.id
        params.version = -1
        controller.update()

        assert view == "/companiaSubclasificacion/edit"
        assert model.companiaSubclasificacionInstance != null
        assert model.companiaSubclasificacionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/companiaSubclasificacion/list'

        response.reset()

        populateValidParams(params)
        def companiaSubclasificacion = new CompaniaSubclasificacion(params)

        assert companiaSubclasificacion.save() != null
        assert CompaniaSubclasificacion.count() == 1

        params.id = companiaSubclasificacion.id

        controller.delete()

        assert CompaniaSubclasificacion.count() == 0
        assert CompaniaSubclasificacion.get(companiaSubclasificacion.id) == null
        assert response.redirectedUrl == '/companiaSubclasificacion/list'
    }
}
