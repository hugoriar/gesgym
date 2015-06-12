package org.control

import org.control.ConceptoPagoController
import grails.test.mixin.*

/**
 * ConceptoPagoControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(ConceptoPagoController)
@Mock(ConceptoPago)
class ConceptoPagoControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/conceptoPago/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.conceptoPagoInstanceList.size() == 0
        assert model.conceptoPagoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.conceptoPagoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.conceptoPagoInstance != null
        assert view == '/conceptoPago/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/conceptoPago/show/1'
        assert controller.flash.message != null
        assert ConceptoPago.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/conceptoPago/list'


        populateValidParams(params)
        def conceptoPago = new ConceptoPago(params)

        assert conceptoPago.save() != null

        params.id = conceptoPago.id

        def model = controller.show()

        assert model.conceptoPagoInstance == conceptoPago
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/conceptoPago/list'


        populateValidParams(params)
        def conceptoPago = new ConceptoPago(params)

        assert conceptoPago.save() != null

        params.id = conceptoPago.id

        def model = controller.edit()

        assert model.conceptoPagoInstance == conceptoPago
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/conceptoPago/list'

        response.reset()


        populateValidParams(params)
        def conceptoPago = new ConceptoPago(params)

        assert conceptoPago.save() != null

        // test invalid parameters in update
        params.id = conceptoPago.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/conceptoPago/edit"
        assert model.conceptoPagoInstance != null

        conceptoPago.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/conceptoPago/show/$conceptoPago.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        conceptoPago.clearErrors()

        populateValidParams(params)
        params.id = conceptoPago.id
        params.version = -1
        controller.update()

        assert view == "/conceptoPago/edit"
        assert model.conceptoPagoInstance != null
        assert model.conceptoPagoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/conceptoPago/list'

        response.reset()

        populateValidParams(params)
        def conceptoPago = new ConceptoPago(params)

        assert conceptoPago.save() != null
        assert ConceptoPago.count() == 1

        params.id = conceptoPago.id

        controller.delete()

        assert ConceptoPago.count() == 0
        assert ConceptoPago.get(conceptoPago.id) == null
        assert response.redirectedUrl == '/conceptoPago/list'
    }
}
