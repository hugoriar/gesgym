package org.control


import org.junit.*
import grails.test.mixin.*

/**
 * AdjuntoControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(AdjuntoController)
@Mock(Adjunto)
class AdjuntoControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/adjunto/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.adjuntoInstanceList.size() == 0
        assert model.adjuntoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.adjuntoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.adjuntoInstance != null
        assert view == '/adjunto/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/adjunto/show/1'
        assert controller.flash.message != null
        assert Adjunto.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/adjunto/list'


        populateValidParams(params)
        def adjunto = new Adjunto(params)

        assert adjunto.save() != null

        params.id = adjunto.id

        def model = controller.show()

        assert model.adjuntoInstance == adjunto
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/adjunto/list'


        populateValidParams(params)
        def adjunto = new Adjunto(params)

        assert adjunto.save() != null

        params.id = adjunto.id

        def model = controller.edit()

        assert model.adjuntoInstance == adjunto
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/adjunto/list'

        response.reset()


        populateValidParams(params)
        def adjunto = new Adjunto(params)

        assert adjunto.save() != null

        // test invalid parameters in update
        params.id = adjunto.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/adjunto/edit"
        assert model.adjuntoInstance != null

        adjunto.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/adjunto/show/$adjunto.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        adjunto.clearErrors()

        populateValidParams(params)
        params.id = adjunto.id
        params.version = -1
        controller.update()

        assert view == "/adjunto/edit"
        assert model.adjuntoInstance != null
        assert model.adjuntoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/adjunto/list'

        response.reset()

        populateValidParams(params)
        def adjunto = new Adjunto(params)

        assert adjunto.save() != null
        assert Adjunto.count() == 1

        params.id = adjunto.id

        controller.delete()

        assert Adjunto.count() == 0
        assert Adjunto.get(adjunto.id) == null
        assert response.redirectedUrl == '/adjunto/list'
    }
}
