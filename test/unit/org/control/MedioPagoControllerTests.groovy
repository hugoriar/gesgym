package org.control

import org.control.MedioPagoController
import grails.test.mixin.*

@TestFor(MedioPagoController)
@Mock(MedioPago)
class MedioPagoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/medioPago/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.medioPagoInstanceList.size() == 0
        assert model.medioPagoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.medioPagoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.medioPagoInstance != null
        assert view == '/medioPago/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/medioPago/show/1'
        assert controller.flash.message != null
        assert MedioPago.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/medioPago/list'

        populateValidParams(params)
        def medioPago = new MedioPago(params)

        assert medioPago.save() != null

        params.id = medioPago.id

        def model = controller.show()

        assert model.medioPagoInstance == medioPago
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/medioPago/list'

        populateValidParams(params)
        def medioPago = new MedioPago(params)

        assert medioPago.save() != null

        params.id = medioPago.id

        def model = controller.edit()

        assert model.medioPagoInstance == medioPago
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/medioPago/list'

        response.reset()

        populateValidParams(params)
        def medioPago = new MedioPago(params)

        assert medioPago.save() != null

        // test invalid parameters in update
        params.id = medioPago.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/medioPago/edit"
        assert model.medioPagoInstance != null

        medioPago.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/medioPago/show/$medioPago.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        medioPago.clearErrors()

        populateValidParams(params)
        params.id = medioPago.id
        params.version = -1
        controller.update()

        assert view == "/medioPago/edit"
        assert model.medioPagoInstance != null
        assert model.medioPagoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/medioPago/list'

        response.reset()

        populateValidParams(params)
        def medioPago = new MedioPago(params)

        assert medioPago.save() != null
        assert MedioPago.count() == 1

        params.id = medioPago.id

        controller.delete()

        assert MedioPago.count() == 0
        assert MedioPago.get(medioPago.id) == null
        assert response.redirectedUrl == '/medioPago/list'
    }
}
