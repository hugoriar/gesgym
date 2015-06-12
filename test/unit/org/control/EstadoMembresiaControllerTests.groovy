package org.control

import org.control.EstadoMembresiaController
import grails.test.mixin.*

@TestFor(EstadoMembresiaController)
@Mock(EstadoMembresia)
class EstadoMembresiaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/estadoMembresia/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.estadoMembresiaInstanceList.size() == 0
        assert model.estadoMembresiaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.estadoMembresiaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.estadoMembresiaInstance != null
        assert view == '/estadoMembresia/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/estadoMembresia/show/1'
        assert controller.flash.message != null
        assert EstadoMembresia.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/estadoMembresia/list'

        populateValidParams(params)
        def estadoMembresia = new EstadoMembresia(params)

        assert estadoMembresia.save() != null

        params.id = estadoMembresia.id

        def model = controller.show()

        assert model.estadoMembresiaInstance == estadoMembresia
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/estadoMembresia/list'

        populateValidParams(params)
        def estadoMembresia = new EstadoMembresia(params)

        assert estadoMembresia.save() != null

        params.id = estadoMembresia.id

        def model = controller.edit()

        assert model.estadoMembresiaInstance == estadoMembresia
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/estadoMembresia/list'

        response.reset()

        populateValidParams(params)
        def estadoMembresia = new EstadoMembresia(params)

        assert estadoMembresia.save() != null

        // test invalid parameters in update
        params.id = estadoMembresia.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/estadoMembresia/edit"
        assert model.estadoMembresiaInstance != null

        estadoMembresia.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/estadoMembresia/show/$estadoMembresia.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        estadoMembresia.clearErrors()

        populateValidParams(params)
        params.id = estadoMembresia.id
        params.version = -1
        controller.update()

        assert view == "/estadoMembresia/edit"
        assert model.estadoMembresiaInstance != null
        assert model.estadoMembresiaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/estadoMembresia/list'

        response.reset()

        populateValidParams(params)
        def estadoMembresia = new EstadoMembresia(params)

        assert estadoMembresia.save() != null
        assert EstadoMembresia.count() == 1

        params.id = estadoMembresia.id

        controller.delete()

        assert EstadoMembresia.count() == 0
        assert EstadoMembresia.get(estadoMembresia.id) == null
        assert response.redirectedUrl == '/estadoMembresia/list'
    }
}
