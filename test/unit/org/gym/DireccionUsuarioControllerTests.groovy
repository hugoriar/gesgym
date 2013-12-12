package org.gym



import org.junit.*
import grails.test.mixin.*

/**
 * DireccionUsuarioControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(DireccionUsuarioController)
@Mock(DireccionUsuario)
class DireccionUsuarioControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/direccionUsuario/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.direccionUsuarioInstanceList.size() == 0
        assert model.direccionUsuarioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.direccionUsuarioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.direccionUsuarioInstance != null
        assert view == '/direccionUsuario/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/direccionUsuario/show/1'
        assert controller.flash.message != null
        assert DireccionUsuario.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/direccionUsuario/list'


        populateValidParams(params)
        def direccionUsuario = new DireccionUsuario(params)

        assert direccionUsuario.save() != null

        params.id = direccionUsuario.id

        def model = controller.show()

        assert model.direccionUsuarioInstance == direccionUsuario
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/direccionUsuario/list'


        populateValidParams(params)
        def direccionUsuario = new DireccionUsuario(params)

        assert direccionUsuario.save() != null

        params.id = direccionUsuario.id

        def model = controller.edit()

        assert model.direccionUsuarioInstance == direccionUsuario
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/direccionUsuario/list'

        response.reset()


        populateValidParams(params)
        def direccionUsuario = new DireccionUsuario(params)

        assert direccionUsuario.save() != null

        // test invalid parameters in update
        params.id = direccionUsuario.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/direccionUsuario/edit"
        assert model.direccionUsuarioInstance != null

        direccionUsuario.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/direccionUsuario/show/$direccionUsuario.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        direccionUsuario.clearErrors()

        populateValidParams(params)
        params.id = direccionUsuario.id
        params.version = -1
        controller.update()

        assert view == "/direccionUsuario/edit"
        assert model.direccionUsuarioInstance != null
        assert model.direccionUsuarioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/direccionUsuario/list'

        response.reset()

        populateValidParams(params)
        def direccionUsuario = new DireccionUsuario(params)

        assert direccionUsuario.save() != null
        assert DireccionUsuario.count() == 1

        params.id = direccionUsuario.id

        controller.delete()

        assert DireccionUsuario.count() == 0
        assert DireccionUsuario.get(direccionUsuario.id) == null
        assert response.redirectedUrl == '/direccionUsuario/list'
    }
}
