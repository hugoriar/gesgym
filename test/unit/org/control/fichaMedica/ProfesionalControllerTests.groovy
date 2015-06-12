package org.control.fichaMedica

import org.control.fichaMedica.ProfesionalController
import grails.test.mixin.*

@TestFor(ProfesionalController)
@Mock(Profesional)
class ProfesionalControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/profesional/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.profesionalInstanceList.size() == 0
        assert model.profesionalInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.profesionalInstance != null
    }

    void testSave() {
        controller.save()

        assert model.profesionalInstance != null
        assert view == '/profesional/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/profesional/show/1'
        assert controller.flash.message != null
        assert Profesional.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/profesional/list'

        populateValidParams(params)
        def profesional = new Profesional(params)

        assert profesional.save() != null

        params.id = profesional.id

        def model = controller.show()

        assert model.profesionalInstance == profesional
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/profesional/list'

        populateValidParams(params)
        def profesional = new Profesional(params)

        assert profesional.save() != null

        params.id = profesional.id

        def model = controller.edit()

        assert model.profesionalInstance == profesional
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/profesional/list'

        response.reset()

        populateValidParams(params)
        def profesional = new Profesional(params)

        assert profesional.save() != null

        // test invalid parameters in update
        params.id = profesional.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/profesional/edit"
        assert model.profesionalInstance != null

        profesional.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/profesional/show/$profesional.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        profesional.clearErrors()

        populateValidParams(params)
        params.id = profesional.id
        params.version = -1
        controller.update()

        assert view == "/profesional/edit"
        assert model.profesionalInstance != null
        assert model.profesionalInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/profesional/list'

        response.reset()

        populateValidParams(params)
        def profesional = new Profesional(params)

        assert profesional.save() != null
        assert Profesional.count() == 1

        params.id = profesional.id

        controller.delete()

        assert Profesional.count() == 0
        assert Profesional.get(profesional.id) == null
        assert response.redirectedUrl == '/profesional/list'
    }
}
