package org.control

import org.control.ParentescoController
import grails.test.mixin.*

/**
 * ParentescoControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(ParentescoController)
@Mock(Parentesco)
class ParentescoControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/parentesco/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.parentescoInstanceList.size() == 0
        assert model.parentescoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.parentescoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.parentescoInstance != null
        assert view == '/parentesco/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/parentesco/show/1'
        assert controller.flash.message != null
        assert Parentesco.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/parentesco/list'


        populateValidParams(params)
        def parentesco = new Parentesco(params)

        assert parentesco.save() != null

        params.id = parentesco.id

        def model = controller.show()

        assert model.parentescoInstance == parentesco
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/parentesco/list'


        populateValidParams(params)
        def parentesco = new Parentesco(params)

        assert parentesco.save() != null

        params.id = parentesco.id

        def model = controller.edit()

        assert model.parentescoInstance == parentesco
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/parentesco/list'

        response.reset()


        populateValidParams(params)
        def parentesco = new Parentesco(params)

        assert parentesco.save() != null

        // test invalid parameters in update
        params.id = parentesco.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/parentesco/edit"
        assert model.parentescoInstance != null

        parentesco.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/parentesco/show/$parentesco.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        parentesco.clearErrors()

        populateValidParams(params)
        params.id = parentesco.id
        params.version = -1
        controller.update()

        assert view == "/parentesco/edit"
        assert model.parentescoInstance != null
        assert model.parentescoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/parentesco/list'

        response.reset()

        populateValidParams(params)
        def parentesco = new Parentesco(params)

        assert parentesco.save() != null
        assert Parentesco.count() == 1

        params.id = parentesco.id

        controller.delete()

        assert Parentesco.count() == 0
        assert Parentesco.get(parentesco.id) == null
        assert response.redirectedUrl == '/parentesco/list'
    }
}
