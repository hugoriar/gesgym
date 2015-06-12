package org.control

import org.control.VisitaController
import grails.test.mixin.*

/**
 * VisitaControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(VisitaController)
@Mock(Visita)
class VisitaControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/visita/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.visitaInstanceList.size() == 0
        assert model.visitaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.visitaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.visitaInstance != null
        assert view == '/visita/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/visita/show/1'
        assert controller.flash.message != null
        assert Visita.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/visita/list'


        populateValidParams(params)
        def visita = new Visita(params)

        assert visita.save() != null

        params.id = visita.id

        def model = controller.show()

        assert model.visitaInstance == visita
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/visita/list'


        populateValidParams(params)
        def visita = new Visita(params)

        assert visita.save() != null

        params.id = visita.id

        def model = controller.edit()

        assert model.visitaInstance == visita
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/visita/list'

        response.reset()


        populateValidParams(params)
        def visita = new Visita(params)

        assert visita.save() != null

        // test invalid parameters in update
        params.id = visita.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/visita/edit"
        assert model.visitaInstance != null

        visita.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/visita/show/$visita.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        visita.clearErrors()

        populateValidParams(params)
        params.id = visita.id
        params.version = -1
        controller.update()

        assert view == "/visita/edit"
        assert model.visitaInstance != null
        assert model.visitaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/visita/list'

        response.reset()

        populateValidParams(params)
        def visita = new Visita(params)

        assert visita.save() != null
        assert Visita.count() == 1

        params.id = visita.id

        controller.delete()

        assert Visita.count() == 0
        assert Visita.get(visita.id) == null
        assert response.redirectedUrl == '/visita/list'
    }
}
