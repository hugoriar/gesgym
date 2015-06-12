package org.control.ventas

import org.control.ventas.FotoProductoController
import grails.test.mixin.*

/**
 * FotoProductoControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(FotoProductoController)
@Mock(FotoProducto)
class FotoProductoControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/fotoProducto/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.fotoProductoInstanceList.size() == 0
        assert model.fotoProductoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.fotoProductoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.fotoProductoInstance != null
        assert view == '/fotoProducto/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/fotoProducto/show/1'
        assert controller.flash.message != null
        assert FotoProducto.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/fotoProducto/list'


        populateValidParams(params)
        def fotoProducto = new FotoProducto(params)

        assert fotoProducto.save() != null

        params.id = fotoProducto.id

        def model = controller.show()

        assert model.fotoProductoInstance == fotoProducto
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/fotoProducto/list'


        populateValidParams(params)
        def fotoProducto = new FotoProducto(params)

        assert fotoProducto.save() != null

        params.id = fotoProducto.id

        def model = controller.edit()

        assert model.fotoProductoInstance == fotoProducto
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/fotoProducto/list'

        response.reset()


        populateValidParams(params)
        def fotoProducto = new FotoProducto(params)

        assert fotoProducto.save() != null

        // test invalid parameters in update
        params.id = fotoProducto.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/fotoProducto/edit"
        assert model.fotoProductoInstance != null

        fotoProducto.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/fotoProducto/show/$fotoProducto.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        fotoProducto.clearErrors()

        populateValidParams(params)
        params.id = fotoProducto.id
        params.version = -1
        controller.update()

        assert view == "/fotoProducto/edit"
        assert model.fotoProductoInstance != null
        assert model.fotoProductoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/fotoProducto/list'

        response.reset()

        populateValidParams(params)
        def fotoProducto = new FotoProducto(params)

        assert fotoProducto.save() != null
        assert FotoProducto.count() == 1

        params.id = fotoProducto.id

        controller.delete()

        assert FotoProducto.count() == 0
        assert FotoProducto.get(fotoProducto.id) == null
        assert response.redirectedUrl == '/fotoProducto/list'
    }
}
