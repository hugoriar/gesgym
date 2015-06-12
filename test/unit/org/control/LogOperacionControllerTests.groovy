package org.control


import org.junit.*
import grails.test.mixin.*

/**
 * LogOperacionControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(LogOperacionController)
@Mock(LogOperacion)
class LogOperacionControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/logOperacion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.logOperacionInstanceList.size() == 0
        assert model.logOperacionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.logOperacionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.logOperacionInstance != null
        assert view == '/logOperacion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/logOperacion/show/1'
        assert controller.flash.message != null
        assert LogOperacion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/logOperacion/list'


        populateValidParams(params)
        def logOperacion = new LogOperacion(params)

        assert logOperacion.save() != null

        params.id = logOperacion.id

        def model = controller.show()

        assert model.logOperacionInstance == logOperacion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/logOperacion/list'


        populateValidParams(params)
        def logOperacion = new LogOperacion(params)

        assert logOperacion.save() != null

        params.id = logOperacion.id

        def model = controller.edit()

        assert model.logOperacionInstance == logOperacion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/logOperacion/list'

        response.reset()


        populateValidParams(params)
        def logOperacion = new LogOperacion(params)

        assert logOperacion.save() != null

        // test invalid parameters in update
        params.id = logOperacion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/logOperacion/edit"
        assert model.logOperacionInstance != null

        logOperacion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/logOperacion/show/$logOperacion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        logOperacion.clearErrors()

        populateValidParams(params)
        params.id = logOperacion.id
        params.version = -1
        controller.update()

        assert view == "/logOperacion/edit"
        assert model.logOperacionInstance != null
        assert model.logOperacionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/logOperacion/list'

        response.reset()

        populateValidParams(params)
        def logOperacion = new LogOperacion(params)

        assert logOperacion.save() != null
        assert LogOperacion.count() == 1

        params.id = logOperacion.id

        controller.delete()

        assert LogOperacion.count() == 0
        assert LogOperacion.get(logOperacion.id) == null
        assert response.redirectedUrl == '/logOperacion/list'
    }
}
