package org.control

import org.control.PromocionMatriculaController
import grails.test.mixin.*

/**
 * PromocionMatriculaControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(PromocionMatriculaController)
@Mock(PromocionMatricula)
class PromocionMatriculaControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/promocionMatricula/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.promocionMatriculaInstanceList.size() == 0
        assert model.promocionMatriculaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.promocionMatriculaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.promocionMatriculaInstance != null
        assert view == '/promocionMatricula/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/promocionMatricula/show/1'
        assert controller.flash.message != null
        assert PromocionMatricula.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/promocionMatricula/list'


        populateValidParams(params)
        def promocionMatricula = new PromocionMatricula(params)

        assert promocionMatricula.save() != null

        params.id = promocionMatricula.id

        def model = controller.show()

        assert model.promocionMatriculaInstance == promocionMatricula
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/promocionMatricula/list'


        populateValidParams(params)
        def promocionMatricula = new PromocionMatricula(params)

        assert promocionMatricula.save() != null

        params.id = promocionMatricula.id

        def model = controller.edit()

        assert model.promocionMatriculaInstance == promocionMatricula
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/promocionMatricula/list'

        response.reset()


        populateValidParams(params)
        def promocionMatricula = new PromocionMatricula(params)

        assert promocionMatricula.save() != null

        // test invalid parameters in update
        params.id = promocionMatricula.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/promocionMatricula/edit"
        assert model.promocionMatriculaInstance != null

        promocionMatricula.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/promocionMatricula/show/$promocionMatricula.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        promocionMatricula.clearErrors()

        populateValidParams(params)
        params.id = promocionMatricula.id
        params.version = -1
        controller.update()

        assert view == "/promocionMatricula/edit"
        assert model.promocionMatriculaInstance != null
        assert model.promocionMatriculaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/promocionMatricula/list'

        response.reset()

        populateValidParams(params)
        def promocionMatricula = new PromocionMatricula(params)

        assert promocionMatricula.save() != null
        assert PromocionMatricula.count() == 1

        params.id = promocionMatricula.id

        controller.delete()

        assert PromocionMatricula.count() == 0
        assert PromocionMatricula.get(promocionMatricula.id) == null
        assert response.redirectedUrl == '/promocionMatricula/list'
    }
}
