package org.control

import org.control.ModalidadController
import grails.test.mixin.*

/**
 * ModalidadControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(ModalidadController)
@Mock(Modalidad)
class ModalidadControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/modalidad/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.modalidadInstanceList.size() == 0
        assert model.modalidadInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.modalidadInstance != null
    }

    void testSave() {
        controller.save()

        assert model.modalidadInstance != null
        assert view == '/modalidad/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/modalidad/show/1'
        assert controller.flash.message != null
        assert Modalidad.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/modalidad/list'


        populateValidParams(params)
        def modalidad = new Modalidad(params)

        assert modalidad.save() != null

        params.id = modalidad.id

        def model = controller.show()

        assert model.modalidadInstance == modalidad
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/modalidad/list'


        populateValidParams(params)
        def modalidad = new Modalidad(params)

        assert modalidad.save() != null

        params.id = modalidad.id

        def model = controller.edit()

        assert model.modalidadInstance == modalidad
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/modalidad/list'

        response.reset()


        populateValidParams(params)
        def modalidad = new Modalidad(params)

        assert modalidad.save() != null

        // test invalid parameters in update
        params.id = modalidad.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/modalidad/edit"
        assert model.modalidadInstance != null

        modalidad.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/modalidad/show/$modalidad.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        modalidad.clearErrors()

        populateValidParams(params)
        params.id = modalidad.id
        params.version = -1
        controller.update()

        assert view == "/modalidad/edit"
        assert model.modalidadInstance != null
        assert model.modalidadInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/modalidad/list'

        response.reset()

        populateValidParams(params)
        def modalidad = new Modalidad(params)

        assert modalidad.save() != null
        assert Modalidad.count() == 1

        params.id = modalidad.id

        controller.delete()

        assert Modalidad.count() == 0
        assert Modalidad.get(modalidad.id) == null
        assert response.redirectedUrl == '/modalidad/list'
    }
}
