package org.control


import org.junit.*
import grails.test.mixin.*

/**
 * LogAtributoControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(LogAtributoController)
@Mock(LogAtributo)
class LogAtributoControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/logAtributo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.logAtributoInstanceList.size() == 0
        assert model.logAtributoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.logAtributoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.logAtributoInstance != null
        assert view == '/logAtributo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/logAtributo/show/1'
        assert controller.flash.message != null
        assert LogAtributo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/logAtributo/list'


        populateValidParams(params)
        def logAtributo = new LogAtributo(params)

        assert logAtributo.save() != null

        params.id = logAtributo.id

        def model = controller.show()

        assert model.logAtributoInstance == logAtributo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/logAtributo/list'


        populateValidParams(params)
        def logAtributo = new LogAtributo(params)

        assert logAtributo.save() != null

        params.id = logAtributo.id

        def model = controller.edit()

        assert model.logAtributoInstance == logAtributo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/logAtributo/list'

        response.reset()


        populateValidParams(params)
        def logAtributo = new LogAtributo(params)

        assert logAtributo.save() != null

        // test invalid parameters in update
        params.id = logAtributo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/logAtributo/edit"
        assert model.logAtributoInstance != null

        logAtributo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/logAtributo/show/$logAtributo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        logAtributo.clearErrors()

        populateValidParams(params)
        params.id = logAtributo.id
        params.version = -1
        controller.update()

        assert view == "/logAtributo/edit"
        assert model.logAtributoInstance != null
        assert model.logAtributoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/logAtributo/list'

        response.reset()

        populateValidParams(params)
        def logAtributo = new LogAtributo(params)

        assert logAtributo.save() != null
        assert LogAtributo.count() == 1

        params.id = logAtributo.id

        controller.delete()

        assert LogAtributo.count() == 0
        assert LogAtributo.get(logAtributo.id) == null
        assert response.redirectedUrl == '/logAtributo/list'
    }
}
