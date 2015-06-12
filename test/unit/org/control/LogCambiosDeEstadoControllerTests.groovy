package org.control

import org.control.LogCambiosDeEstadoController
import grails.test.mixin.*

/**
 * LogCambiosDeEstadoControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(LogCambiosDeEstadoController)
@Mock(LogCambiosDeEstado)
class LogCambiosDeEstadoControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/logCambiosDeEstado/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.logCambiosDeEstadoInstanceList.size() == 0
        assert model.logCambiosDeEstadoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.logCambiosDeEstadoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.logCambiosDeEstadoInstance != null
        assert view == '/logCambiosDeEstado/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/logCambiosDeEstado/show/1'
        assert controller.flash.message != null
        assert LogCambiosDeEstado.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/logCambiosDeEstado/list'


        populateValidParams(params)
        def logCambiosDeEstado = new LogCambiosDeEstado(params)

        assert logCambiosDeEstado.save() != null

        params.id = logCambiosDeEstado.id

        def model = controller.show()

        assert model.logCambiosDeEstadoInstance == logCambiosDeEstado
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/logCambiosDeEstado/list'


        populateValidParams(params)
        def logCambiosDeEstado = new LogCambiosDeEstado(params)

        assert logCambiosDeEstado.save() != null

        params.id = logCambiosDeEstado.id

        def model = controller.edit()

        assert model.logCambiosDeEstadoInstance == logCambiosDeEstado
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/logCambiosDeEstado/list'

        response.reset()


        populateValidParams(params)
        def logCambiosDeEstado = new LogCambiosDeEstado(params)

        assert logCambiosDeEstado.save() != null

        // test invalid parameters in update
        params.id = logCambiosDeEstado.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/logCambiosDeEstado/edit"
        assert model.logCambiosDeEstadoInstance != null

        logCambiosDeEstado.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/logCambiosDeEstado/show/$logCambiosDeEstado.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        logCambiosDeEstado.clearErrors()

        populateValidParams(params)
        params.id = logCambiosDeEstado.id
        params.version = -1
        controller.update()

        assert view == "/logCambiosDeEstado/edit"
        assert model.logCambiosDeEstadoInstance != null
        assert model.logCambiosDeEstadoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/logCambiosDeEstado/list'

        response.reset()

        populateValidParams(params)
        def logCambiosDeEstado = new LogCambiosDeEstado(params)

        assert logCambiosDeEstado.save() != null
        assert LogCambiosDeEstado.count() == 1

        params.id = logCambiosDeEstado.id

        controller.delete()

        assert LogCambiosDeEstado.count() == 0
        assert LogCambiosDeEstado.get(logCambiosDeEstado.id) == null
        assert response.redirectedUrl == '/logCambiosDeEstado/list'
    }
}
