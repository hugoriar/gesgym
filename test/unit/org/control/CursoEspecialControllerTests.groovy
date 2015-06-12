package org.control


import org.junit.*
import grails.test.mixin.*

/**
 * CursoEspecialControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(CursoEspecialController)
@Mock(CursoEspecial)
class CursoEspecialControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cursoEspecial/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cursoEspecialInstanceList.size() == 0
        assert model.cursoEspecialInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.cursoEspecialInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cursoEspecialInstance != null
        assert view == '/cursoEspecial/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cursoEspecial/show/1'
        assert controller.flash.message != null
        assert CursoEspecial.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cursoEspecial/list'


        populateValidParams(params)
        def cursoEspecial = new CursoEspecial(params)

        assert cursoEspecial.save() != null

        params.id = cursoEspecial.id

        def model = controller.show()

        assert model.cursoEspecialInstance == cursoEspecial
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cursoEspecial/list'


        populateValidParams(params)
        def cursoEspecial = new CursoEspecial(params)

        assert cursoEspecial.save() != null

        params.id = cursoEspecial.id

        def model = controller.edit()

        assert model.cursoEspecialInstance == cursoEspecial
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cursoEspecial/list'

        response.reset()


        populateValidParams(params)
        def cursoEspecial = new CursoEspecial(params)

        assert cursoEspecial.save() != null

        // test invalid parameters in update
        params.id = cursoEspecial.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cursoEspecial/edit"
        assert model.cursoEspecialInstance != null

        cursoEspecial.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cursoEspecial/show/$cursoEspecial.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cursoEspecial.clearErrors()

        populateValidParams(params)
        params.id = cursoEspecial.id
        params.version = -1
        controller.update()

        assert view == "/cursoEspecial/edit"
        assert model.cursoEspecialInstance != null
        assert model.cursoEspecialInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cursoEspecial/list'

        response.reset()

        populateValidParams(params)
        def cursoEspecial = new CursoEspecial(params)

        assert cursoEspecial.save() != null
        assert CursoEspecial.count() == 1

        params.id = cursoEspecial.id

        controller.delete()

        assert CursoEspecial.count() == 0
        assert CursoEspecial.get(cursoEspecial.id) == null
        assert response.redirectedUrl == '/cursoEspecial/list'
    }
}
