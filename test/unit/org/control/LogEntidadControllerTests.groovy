package org.control


import org.junit.*
import grails.test.mixin.*

/**
 * LogEntidadControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(LogEntidadController)
@Mock(LogEntidad)
class LogEntidadControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/logEntidad/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.logEntidadInstanceList.size() == 0
        assert model.logEntidadInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.logEntidadInstance != null
    }

    void testSave() {
        controller.save()

        assert model.logEntidadInstance != null
        assert view == '/logEntidad/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/logEntidad/show/1'
        assert controller.flash.message != null
        assert LogEntidad.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/logEntidad/list'


        populateValidParams(params)
        def logEntidad = new LogEntidad(params)

        assert logEntidad.save() != null

        params.id = logEntidad.id

        def model = controller.show()

        assert model.logEntidadInstance == logEntidad
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/logEntidad/list'


        populateValidParams(params)
        def logEntidad = new LogEntidad(params)

        assert logEntidad.save() != null

        params.id = logEntidad.id

        def model = controller.edit()

        assert model.logEntidadInstance == logEntidad
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/logEntidad/list'

        response.reset()


        populateValidParams(params)
        def logEntidad = new LogEntidad(params)

        assert logEntidad.save() != null

        // test invalid parameters in update
        params.id = logEntidad.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/logEntidad/edit"
        assert model.logEntidadInstance != null

        logEntidad.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/logEntidad/show/$logEntidad.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        logEntidad.clearErrors()

        populateValidParams(params)
        params.id = logEntidad.id
        params.version = -1
        controller.update()

        assert view == "/logEntidad/edit"
        assert model.logEntidadInstance != null
        assert model.logEntidadInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/logEntidad/list'

        response.reset()

        populateValidParams(params)
        def logEntidad = new LogEntidad(params)

        assert logEntidad.save() != null
        assert LogEntidad.count() == 1

        params.id = logEntidad.id

        controller.delete()

        assert LogEntidad.count() == 0
        assert LogEntidad.get(logEntidad.id) == null
        assert response.redirectedUrl == '/logEntidad/list'
    }
}
