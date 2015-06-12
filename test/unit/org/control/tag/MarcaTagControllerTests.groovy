package org.control.tag



import org.junit.*
import grails.test.mixin.*

/**
 * MarcaTagControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(MarcaTagController)
@Mock(MarcaTag)
class MarcaTagControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/marcaTag/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.marcaTagInstanceList.size() == 0
        assert model.marcaTagInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.marcaTagInstance != null
    }

    void testSave() {
        controller.save()

        assert model.marcaTagInstance != null
        assert view == '/marcaTag/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/marcaTag/show/1'
        assert controller.flash.message != null
        assert MarcaTag.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/marcaTag/list'


        populateValidParams(params)
        def marcaTag = new MarcaTag(params)

        assert marcaTag.save() != null

        params.id = marcaTag.id

        def model = controller.show()

        assert model.marcaTagInstance == marcaTag
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/marcaTag/list'


        populateValidParams(params)
        def marcaTag = new MarcaTag(params)

        assert marcaTag.save() != null

        params.id = marcaTag.id

        def model = controller.edit()

        assert model.marcaTagInstance == marcaTag
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/marcaTag/list'

        response.reset()


        populateValidParams(params)
        def marcaTag = new MarcaTag(params)

        assert marcaTag.save() != null

        // test invalid parameters in update
        params.id = marcaTag.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/marcaTag/edit"
        assert model.marcaTagInstance != null

        marcaTag.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/marcaTag/show/$marcaTag.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        marcaTag.clearErrors()

        populateValidParams(params)
        params.id = marcaTag.id
        params.version = -1
        controller.update()

        assert view == "/marcaTag/edit"
        assert model.marcaTagInstance != null
        assert model.marcaTagInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/marcaTag/list'

        response.reset()

        populateValidParams(params)
        def marcaTag = new MarcaTag(params)

        assert marcaTag.save() != null
        assert MarcaTag.count() == 1

        params.id = marcaTag.id

        controller.delete()

        assert MarcaTag.count() == 0
        assert MarcaTag.get(marcaTag.id) == null
        assert response.redirectedUrl == '/marcaTag/list'
    }
}
