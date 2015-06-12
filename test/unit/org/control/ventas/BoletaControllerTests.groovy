package org.control.ventas

import org.control.ventas.BoletaController
import grails.test.mixin.*

/**
 * BoletaControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(BoletaController)
@Mock(Boleta)
class BoletaControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/boleta/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.boletaInstanceList.size() == 0
        assert model.boletaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.boletaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.boletaInstance != null
        assert view == '/boleta/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/boleta/show/1'
        assert controller.flash.message != null
        assert Boleta.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/boleta/list'


        populateValidParams(params)
        def boleta = new Boleta(params)

        assert boleta.save() != null

        params.id = boleta.id

        def model = controller.show()

        assert model.boletaInstance == boleta
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/boleta/list'


        populateValidParams(params)
        def boleta = new Boleta(params)

        assert boleta.save() != null

        params.id = boleta.id

        def model = controller.edit()

        assert model.boletaInstance == boleta
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/boleta/list'

        response.reset()


        populateValidParams(params)
        def boleta = new Boleta(params)

        assert boleta.save() != null

        // test invalid parameters in update
        params.id = boleta.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/boleta/edit"
        assert model.boletaInstance != null

        boleta.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/boleta/show/$boleta.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        boleta.clearErrors()

        populateValidParams(params)
        params.id = boleta.id
        params.version = -1
        controller.update()

        assert view == "/boleta/edit"
        assert model.boletaInstance != null
        assert model.boletaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/boleta/list'

        response.reset()

        populateValidParams(params)
        def boleta = new Boleta(params)

        assert boleta.save() != null
        assert Boleta.count() == 1

        params.id = boleta.id

        controller.delete()

        assert Boleta.count() == 0
        assert Boleta.get(boleta.id) == null
        assert response.redirectedUrl == '/boleta/list'
    }
}
