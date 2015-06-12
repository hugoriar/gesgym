package org.control.ventas

import org.control.ventas.VarianteController
import grails.test.mixin.*

/**
 * VarianteControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(VarianteController)
@Mock(Variante)
class VarianteControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/variante/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.varianteInstanceList.size() == 0
        assert model.varianteInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.varianteInstance != null
    }

    void testSave() {
        controller.save()

        assert model.varianteInstance != null
        assert view == '/variante/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/variante/show/1'
        assert controller.flash.message != null
        assert Variante.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/variante/list'


        populateValidParams(params)
        def variante = new Variante(params)

        assert variante.save() != null

        params.id = variante.id

        def model = controller.show()

        assert model.varianteInstance == variante
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/variante/list'


        populateValidParams(params)
        def variante = new Variante(params)

        assert variante.save() != null

        params.id = variante.id

        def model = controller.edit()

        assert model.varianteInstance == variante
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/variante/list'

        response.reset()


        populateValidParams(params)
        def variante = new Variante(params)

        assert variante.save() != null

        // test invalid parameters in update
        params.id = variante.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/variante/edit"
        assert model.varianteInstance != null

        variante.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/variante/show/$variante.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        variante.clearErrors()

        populateValidParams(params)
        params.id = variante.id
        params.version = -1
        controller.update()

        assert view == "/variante/edit"
        assert model.varianteInstance != null
        assert model.varianteInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/variante/list'

        response.reset()

        populateValidParams(params)
        def variante = new Variante(params)

        assert variante.save() != null
        assert Variante.count() == 1

        params.id = variante.id

        controller.delete()

        assert Variante.count() == 0
        assert Variante.get(variante.id) == null
        assert response.redirectedUrl == '/variante/list'
    }
}
