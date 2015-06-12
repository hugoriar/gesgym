package org.control


import org.junit.*
import grails.test.mixin.*

/**
 * ConfiguracionBytesControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(ConfiguracionBytesController)
@Mock(ConfiguracionBytes)
class ConfiguracionBytesControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/configuracionBytes/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.configuracionBytesInstanceList.size() == 0
        assert model.configuracionBytesInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.configuracionBytesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.configuracionBytesInstance != null
        assert view == '/configuracionBytes/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/configuracionBytes/show/1'
        assert controller.flash.message != null
        assert ConfiguracionBytes.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/configuracionBytes/list'


        populateValidParams(params)
        def configuracionBytes = new ConfiguracionBytes(params)

        assert configuracionBytes.save() != null

        params.id = configuracionBytes.id

        def model = controller.show()

        assert model.configuracionBytesInstance == configuracionBytes
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/configuracionBytes/list'


        populateValidParams(params)
        def configuracionBytes = new ConfiguracionBytes(params)

        assert configuracionBytes.save() != null

        params.id = configuracionBytes.id

        def model = controller.edit()

        assert model.configuracionBytesInstance == configuracionBytes
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/configuracionBytes/list'

        response.reset()


        populateValidParams(params)
        def configuracionBytes = new ConfiguracionBytes(params)

        assert configuracionBytes.save() != null

        // test invalid parameters in update
        params.id = configuracionBytes.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/configuracionBytes/edit"
        assert model.configuracionBytesInstance != null

        configuracionBytes.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/configuracionBytes/show/$configuracionBytes.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        configuracionBytes.clearErrors()

        populateValidParams(params)
        params.id = configuracionBytes.id
        params.version = -1
        controller.update()

        assert view == "/configuracionBytes/edit"
        assert model.configuracionBytesInstance != null
        assert model.configuracionBytesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/configuracionBytes/list'

        response.reset()

        populateValidParams(params)
        def configuracionBytes = new ConfiguracionBytes(params)

        assert configuracionBytes.save() != null
        assert ConfiguracionBytes.count() == 1

        params.id = configuracionBytes.id

        controller.delete()

        assert ConfiguracionBytes.count() == 0
        assert ConfiguracionBytes.get(configuracionBytes.id) == null
        assert response.redirectedUrl == '/configuracionBytes/list'
    }
}
