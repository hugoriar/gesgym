package org.gym



import org.junit.*
import grails.test.mixin.*

/**
 * EspecializacionControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(EspecializacionController)
@Mock(Especializacion)
class EspecializacionControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/especializacion/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.especializacionInstanceList.size() == 0
        assert model.especializacionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.especializacionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.especializacionInstance != null
        assert view == '/especializacion/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/especializacion/show/1'
        assert controller.flash.message != null
        assert Especializacion.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/especializacion/list'


        populateValidParams(params)
        def especializacion = new Especializacion(params)

        assert especializacion.save() != null

        params.id = especializacion.id

        def model = controller.show()

        assert model.especializacionInstance == especializacion
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/especializacion/list'


        populateValidParams(params)
        def especializacion = new Especializacion(params)

        assert especializacion.save() != null

        params.id = especializacion.id

        def model = controller.edit()

        assert model.especializacionInstance == especializacion
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/especializacion/list'

        response.reset()


        populateValidParams(params)
        def especializacion = new Especializacion(params)

        assert especializacion.save() != null

        // test invalid parameters in update
        params.id = especializacion.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/especializacion/edit"
        assert model.especializacionInstance != null

        especializacion.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/especializacion/show/$especializacion.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        especializacion.clearErrors()

        populateValidParams(params)
        params.id = especializacion.id
        params.version = -1
        controller.update()

        assert view == "/especializacion/edit"
        assert model.especializacionInstance != null
        assert model.especializacionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/especializacion/list'

        response.reset()

        populateValidParams(params)
        def especializacion = new Especializacion(params)

        assert especializacion.save() != null
        assert Especializacion.count() == 1

        params.id = especializacion.id

        controller.delete()

        assert Especializacion.count() == 0
        assert Especializacion.get(especializacion.id) == null
        assert response.redirectedUrl == '/especializacion/list'
    }
}
