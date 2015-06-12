package org.control.tag



import org.junit.*
import grails.test.mixin.*

/**
 * ModeloTagControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(ModeloTagController)
@Mock(ModeloTag)
class ModeloTagControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/modeloTag/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.modeloTagInstanceList.size() == 0
        assert model.modeloTagInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.modeloTagInstance != null
    }

    void testSave() {
        controller.save()

        assert model.modeloTagInstance != null
        assert view == '/modeloTag/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/modeloTag/show/1'
        assert controller.flash.message != null
        assert ModeloTag.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/modeloTag/list'


        populateValidParams(params)
        def modeloTag = new ModeloTag(params)

        assert modeloTag.save() != null

        params.id = modeloTag.id

        def model = controller.show()

        assert model.modeloTagInstance == modeloTag
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/modeloTag/list'


        populateValidParams(params)
        def modeloTag = new ModeloTag(params)

        assert modeloTag.save() != null

        params.id = modeloTag.id

        def model = controller.edit()

        assert model.modeloTagInstance == modeloTag
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/modeloTag/list'

        response.reset()


        populateValidParams(params)
        def modeloTag = new ModeloTag(params)

        assert modeloTag.save() != null

        // test invalid parameters in update
        params.id = modeloTag.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/modeloTag/edit"
        assert model.modeloTagInstance != null

        modeloTag.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/modeloTag/show/$modeloTag.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        modeloTag.clearErrors()

        populateValidParams(params)
        params.id = modeloTag.id
        params.version = -1
        controller.update()

        assert view == "/modeloTag/edit"
        assert model.modeloTagInstance != null
        assert model.modeloTagInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/modeloTag/list'

        response.reset()

        populateValidParams(params)
        def modeloTag = new ModeloTag(params)

        assert modeloTag.save() != null
        assert ModeloTag.count() == 1

        params.id = modeloTag.id

        controller.delete()

        assert ModeloTag.count() == 0
        assert ModeloTag.get(modeloTag.id) == null
        assert response.redirectedUrl == '/modeloTag/list'
    }
}
