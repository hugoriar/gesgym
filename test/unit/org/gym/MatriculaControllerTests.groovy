package org.gym



import org.junit.*
import grails.test.mixin.*

/**
 * MatriculaControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(MatriculaController)
@Mock(Matricula)
class MatriculaControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/matricula/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.matriculaInstanceList.size() == 0
        assert model.matriculaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.matriculaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.matriculaInstance != null
        assert view == '/matricula/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/matricula/show/1'
        assert controller.flash.message != null
        assert Matricula.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/matricula/list'


        populateValidParams(params)
        def matricula = new Matricula(params)

        assert matricula.save() != null

        params.id = matricula.id

        def model = controller.show()

        assert model.matriculaInstance == matricula
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/matricula/list'


        populateValidParams(params)
        def matricula = new Matricula(params)

        assert matricula.save() != null

        params.id = matricula.id

        def model = controller.edit()

        assert model.matriculaInstance == matricula
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/matricula/list'

        response.reset()


        populateValidParams(params)
        def matricula = new Matricula(params)

        assert matricula.save() != null

        // test invalid parameters in update
        params.id = matricula.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/matricula/edit"
        assert model.matriculaInstance != null

        matricula.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/matricula/show/$matricula.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        matricula.clearErrors()

        populateValidParams(params)
        params.id = matricula.id
        params.version = -1
        controller.update()

        assert view == "/matricula/edit"
        assert model.matriculaInstance != null
        assert model.matriculaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/matricula/list'

        response.reset()

        populateValidParams(params)
        def matricula = new Matricula(params)

        assert matricula.save() != null
        assert Matricula.count() == 1

        params.id = matricula.id

        controller.delete()

        assert Matricula.count() == 0
        assert Matricula.get(matricula.id) == null
        assert response.redirectedUrl == '/matricula/list'
    }
}
