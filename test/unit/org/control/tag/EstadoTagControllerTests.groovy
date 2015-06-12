package org.control.tag



import org.junit.*
import grails.test.mixin.*

/**
 * EstadoTagControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(EstadoTagController)
@Mock(EstadoTag)
class EstadoTagControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/estadoTag/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.estadoTagInstanceList.size() == 0
        assert model.estadoTagInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.estadoTagInstance != null
    }

    void testSave() {
        controller.save()

        assert model.estadoTagInstance != null
        assert view == '/estadoTag/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/estadoTag/show/1'
        assert controller.flash.message != null
        assert EstadoTag.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/estadoTag/list'


        populateValidParams(params)
        def estadoTag = new EstadoTag(params)

        assert estadoTag.save() != null

        params.id = estadoTag.id

        def model = controller.show()

        assert model.estadoTagInstance == estadoTag
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/estadoTag/list'


        populateValidParams(params)
        def estadoTag = new EstadoTag(params)

        assert estadoTag.save() != null

        params.id = estadoTag.id

        def model = controller.edit()

        assert model.estadoTagInstance == estadoTag
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/estadoTag/list'

        response.reset()


        populateValidParams(params)
        def estadoTag = new EstadoTag(params)

        assert estadoTag.save() != null

        // test invalid parameters in update
        params.id = estadoTag.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/estadoTag/edit"
        assert model.estadoTagInstance != null

        estadoTag.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/estadoTag/show/$estadoTag.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        estadoTag.clearErrors()

        populateValidParams(params)
        params.id = estadoTag.id
        params.version = -1
        controller.update()

        assert view == "/estadoTag/edit"
        assert model.estadoTagInstance != null
        assert model.estadoTagInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/estadoTag/list'

        response.reset()

        populateValidParams(params)
        def estadoTag = new EstadoTag(params)

        assert estadoTag.save() != null
        assert EstadoTag.count() == 1

        params.id = estadoTag.id

        controller.delete()

        assert EstadoTag.count() == 0
        assert EstadoTag.get(estadoTag.id) == null
        assert response.redirectedUrl == '/estadoTag/list'
    }
}
