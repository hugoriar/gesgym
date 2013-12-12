package org.gym



import org.junit.*
import grails.test.mixin.*

/**
 * DireccionEmpresaControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(DireccionEmpresaController)
@Mock(DireccionEmpresa)
class DireccionEmpresaControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/direccionEmpresa/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.direccionEmpresaInstanceList.size() == 0
        assert model.direccionEmpresaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.direccionEmpresaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.direccionEmpresaInstance != null
        assert view == '/direccionEmpresa/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/direccionEmpresa/show/1'
        assert controller.flash.message != null
        assert DireccionEmpresa.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/direccionEmpresa/list'


        populateValidParams(params)
        def direccionEmpresa = new DireccionEmpresa(params)

        assert direccionEmpresa.save() != null

        params.id = direccionEmpresa.id

        def model = controller.show()

        assert model.direccionEmpresaInstance == direccionEmpresa
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/direccionEmpresa/list'


        populateValidParams(params)
        def direccionEmpresa = new DireccionEmpresa(params)

        assert direccionEmpresa.save() != null

        params.id = direccionEmpresa.id

        def model = controller.edit()

        assert model.direccionEmpresaInstance == direccionEmpresa
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/direccionEmpresa/list'

        response.reset()


        populateValidParams(params)
        def direccionEmpresa = new DireccionEmpresa(params)

        assert direccionEmpresa.save() != null

        // test invalid parameters in update
        params.id = direccionEmpresa.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/direccionEmpresa/edit"
        assert model.direccionEmpresaInstance != null

        direccionEmpresa.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/direccionEmpresa/show/$direccionEmpresa.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        direccionEmpresa.clearErrors()

        populateValidParams(params)
        params.id = direccionEmpresa.id
        params.version = -1
        controller.update()

        assert view == "/direccionEmpresa/edit"
        assert model.direccionEmpresaInstance != null
        assert model.direccionEmpresaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/direccionEmpresa/list'

        response.reset()

        populateValidParams(params)
        def direccionEmpresa = new DireccionEmpresa(params)

        assert direccionEmpresa.save() != null
        assert DireccionEmpresa.count() == 1

        params.id = direccionEmpresa.id

        controller.delete()

        assert DireccionEmpresa.count() == 0
        assert DireccionEmpresa.get(direccionEmpresa.id) == null
        assert response.redirectedUrl == '/direccionEmpresa/list'
    }
}
