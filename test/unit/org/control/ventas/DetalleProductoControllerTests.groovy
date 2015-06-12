package org.control.ventas

import org.control.ventas.DetalleProductoController
import grails.test.mixin.*

/**
 * DetalleProductoControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(DetalleProductoController)
@Mock(DetalleProducto)
class DetalleProductoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/detalleProducto/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.detalleProductoInstanceList.size() == 0
        assert model.detalleProductoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.detalleProductoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.detalleProductoInstance != null
        assert view == '/detalleProducto/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/detalleProducto/show/1'
        assert controller.flash.message != null
        assert DetalleProducto.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/detalleProducto/list'


        populateValidParams(params)
        def detalleProducto = new DetalleProducto(params)

        assert detalleProducto.save() != null

        params.id = detalleProducto.id

        def model = controller.show()

        assert model.detalleProductoInstance == detalleProducto
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/detalleProducto/list'


        populateValidParams(params)
        def detalleProducto = new DetalleProducto(params)

        assert detalleProducto.save() != null

        params.id = detalleProducto.id

        def model = controller.edit()

        assert model.detalleProductoInstance == detalleProducto
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/detalleProducto/list'

        response.reset()


        populateValidParams(params)
        def detalleProducto = new DetalleProducto(params)

        assert detalleProducto.save() != null

        // test invalid parameters in update
        params.id = detalleProducto.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/detalleProducto/edit"
        assert model.detalleProductoInstance != null

        detalleProducto.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/detalleProducto/show/$detalleProducto.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        detalleProducto.clearErrors()

        populateValidParams(params)
        params.id = detalleProducto.id
        params.version = -1
        controller.update()

        assert view == "/detalleProducto/edit"
        assert model.detalleProductoInstance != null
        assert model.detalleProductoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/detalleProducto/list'

        response.reset()

        populateValidParams(params)
        def detalleProducto = new DetalleProducto(params)

        assert detalleProducto.save() != null
        assert DetalleProducto.count() == 1

        params.id = detalleProducto.id

        controller.delete()

        assert DetalleProducto.count() == 0
        assert DetalleProducto.get(detalleProducto.id) == null
        assert response.redirectedUrl == '/detalleProducto/list'
    }
}
