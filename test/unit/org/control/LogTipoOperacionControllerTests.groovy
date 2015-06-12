package org.control


import org.junit.*
import grails.test.mixin.*

/**
 * LogTipoOperacionControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(LogTipoOperacionController)
@Mock(LogTipoOperacion)
class LogTipoOperacionControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/logTipoOperacion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.logTipoOperacionInstanceList.size() == 0
        assert model.logTipoOperacionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.logTipoOperacionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.logTipoOperacionInstance != null
        assert view == '/logTipoOperacion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/logTipoOperacion/show/1'
        assert controller.flash.message != null
        assert LogTipoOperacion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/logTipoOperacion/list'


        populateValidParams(params)
        def logTipoOperacion = new LogTipoOperacion(params)

        assert logTipoOperacion.save() != null

        params.id = logTipoOperacion.id

        def model = controller.show()

        assert model.logTipoOperacionInstance == logTipoOperacion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/logTipoOperacion/list'


        populateValidParams(params)
        def logTipoOperacion = new LogTipoOperacion(params)

        assert logTipoOperacion.save() != null

        params.id = logTipoOperacion.id

        def model = controller.edit()

        assert model.logTipoOperacionInstance == logTipoOperacion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/logTipoOperacion/list'

        response.reset()


        populateValidParams(params)
        def logTipoOperacion = new LogTipoOperacion(params)

        assert logTipoOperacion.save() != null

        // test invalid parameters in update
        params.id = logTipoOperacion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/logTipoOperacion/edit"
        assert model.logTipoOperacionInstance != null

        logTipoOperacion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/logTipoOperacion/show/$logTipoOperacion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        logTipoOperacion.clearErrors()

        populateValidParams(params)
        params.id = logTipoOperacion.id
        params.version = -1
        controller.update()

        assert view == "/logTipoOperacion/edit"
        assert model.logTipoOperacionInstance != null
        assert model.logTipoOperacionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/logTipoOperacion/list'

        response.reset()

        populateValidParams(params)
        def logTipoOperacion = new LogTipoOperacion(params)

        assert logTipoOperacion.save() != null
        assert LogTipoOperacion.count() == 1

        params.id = logTipoOperacion.id

        controller.delete()

        assert LogTipoOperacion.count() == 0
        assert LogTipoOperacion.get(logTipoOperacion.id) == null
        assert response.redirectedUrl == '/logTipoOperacion/list'
    }
}
