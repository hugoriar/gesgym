package org.control

import org.control.HuellaController
import grails.test.mixin.*

/**
 * HuellaControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(HuellaController)
@Mock(Huella)
class HuellaControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/huella/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.huellaInstanceList.size() == 0
        assert model.huellaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.huellaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.huellaInstance != null
        assert view == '/huella/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/huella/show/1'
        assert controller.flash.message != null
        assert Huella.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/huella/list'


        populateValidParams(params)
        def huella = new Huella(params)

        assert huella.save() != null

        params.id = huella.id

        def model = controller.show()

        assert model.huellaInstance == huella
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/huella/list'


        populateValidParams(params)
        def huella = new Huella(params)

        assert huella.save() != null

        params.id = huella.id

        def model = controller.edit()

        assert model.huellaInstance == huella
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/huella/list'

        response.reset()


        populateValidParams(params)
        def huella = new Huella(params)

        assert huella.save() != null

        // test invalid parameters in update
        params.id = huella.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/huella/edit"
        assert model.huellaInstance != null

        huella.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/huella/show/$huella.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        huella.clearErrors()

        populateValidParams(params)
        params.id = huella.id
        params.version = -1
        controller.update()

        assert view == "/huella/edit"
        assert model.huellaInstance != null
        assert model.huellaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/huella/list'

        response.reset()

        populateValidParams(params)
        def huella = new Huella(params)

        assert huella.save() != null
        assert Huella.count() == 1

        params.id = huella.id

        controller.delete()

        assert Huella.count() == 0
        assert Huella.get(huella.id) == null
        assert response.redirectedUrl == '/huella/list'
    }
}
