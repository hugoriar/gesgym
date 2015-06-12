package org.control

import org.control.CategoriaConceptoPagoController
import grails.test.mixin.*

/**
 * CategoriaConceptoPagoControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(CategoriaConceptoPagoController)
@Mock(CategoriaConceptoPago)
class CategoriaConceptoPagoControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/categoriaConceptoPago/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.categoriaConceptoPagoInstanceList.size() == 0
        assert model.categoriaConceptoPagoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.categoriaConceptoPagoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.categoriaConceptoPagoInstance != null
        assert view == '/categoriaConceptoPago/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/categoriaConceptoPago/show/1'
        assert controller.flash.message != null
        assert CategoriaConceptoPago.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/categoriaConceptoPago/list'


        populateValidParams(params)
        def categoriaConceptoPago = new CategoriaConceptoPago(params)

        assert categoriaConceptoPago.save() != null

        params.id = categoriaConceptoPago.id

        def model = controller.show()

        assert model.categoriaConceptoPagoInstance == categoriaConceptoPago
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/categoriaConceptoPago/list'


        populateValidParams(params)
        def categoriaConceptoPago = new CategoriaConceptoPago(params)

        assert categoriaConceptoPago.save() != null

        params.id = categoriaConceptoPago.id

        def model = controller.edit()

        assert model.categoriaConceptoPagoInstance == categoriaConceptoPago
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/categoriaConceptoPago/list'

        response.reset()


        populateValidParams(params)
        def categoriaConceptoPago = new CategoriaConceptoPago(params)

        assert categoriaConceptoPago.save() != null

        // test invalid parameters in update
        params.id = categoriaConceptoPago.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/categoriaConceptoPago/edit"
        assert model.categoriaConceptoPagoInstance != null

        categoriaConceptoPago.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/categoriaConceptoPago/show/$categoriaConceptoPago.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        categoriaConceptoPago.clearErrors()

        populateValidParams(params)
        params.id = categoriaConceptoPago.id
        params.version = -1
        controller.update()

        assert view == "/categoriaConceptoPago/edit"
        assert model.categoriaConceptoPagoInstance != null
        assert model.categoriaConceptoPagoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/categoriaConceptoPago/list'

        response.reset()

        populateValidParams(params)
        def categoriaConceptoPago = new CategoriaConceptoPago(params)

        assert categoriaConceptoPago.save() != null
        assert CategoriaConceptoPago.count() == 1

        params.id = categoriaConceptoPago.id

        controller.delete()

        assert CategoriaConceptoPago.count() == 0
        assert CategoriaConceptoPago.get(categoriaConceptoPago.id) == null
        assert response.redirectedUrl == '/categoriaConceptoPago/list'
    }
}
