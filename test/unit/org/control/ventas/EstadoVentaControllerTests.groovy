package org.control.ventas

import org.control.ventas.EstadoVentaController
import grails.test.mixin.*

/**
 * EstadoVentaControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(EstadoVentaController)
@Mock(EstadoVenta)
class EstadoVentaControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/estadoVenta/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.estadoVentaInstanceList.size() == 0
        assert model.estadoVentaInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.estadoVentaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.estadoVentaInstance != null
        assert view == '/estadoVenta/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/estadoVenta/show/1'
        assert controller.flash.message != null
        assert EstadoVenta.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/estadoVenta/list'


        populateValidParams(params)
        def estadoVenta = new EstadoVenta(params)

        assert estadoVenta.save() != null

        params.id = estadoVenta.id

        def model = controller.show()

        assert model.estadoVentaInstance == estadoVenta
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/estadoVenta/list'


        populateValidParams(params)
        def estadoVenta = new EstadoVenta(params)

        assert estadoVenta.save() != null

        params.id = estadoVenta.id

        def model = controller.edit()

        assert model.estadoVentaInstance == estadoVenta
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/estadoVenta/list'

        response.reset()


        populateValidParams(params)
        def estadoVenta = new EstadoVenta(params)

        assert estadoVenta.save() != null

        // test invalid parameters in update
        params.id = estadoVenta.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/estadoVenta/edit"
        assert model.estadoVentaInstance != null

        estadoVenta.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/estadoVenta/show/$estadoVenta.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        estadoVenta.clearErrors()

        populateValidParams(params)
        params.id = estadoVenta.id
        params.version = -1
        controller.update()

        assert view == "/estadoVenta/edit"
        assert model.estadoVentaInstance != null
        assert model.estadoVentaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/estadoVenta/list'

        response.reset()

        populateValidParams(params)
        def estadoVenta = new EstadoVenta(params)

        assert estadoVenta.save() != null
        assert EstadoVenta.count() == 1

        params.id = estadoVenta.id

        controller.delete()

        assert EstadoVenta.count() == 0
        assert EstadoVenta.get(estadoVenta.id) == null
        assert response.redirectedUrl == '/estadoVenta/list'
    }
}
