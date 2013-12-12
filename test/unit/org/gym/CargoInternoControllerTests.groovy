package org.gym



import org.junit.*
import grails.test.mixin.*

/**
 * CargoInternoControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(CargoInternoController)
@Mock(CargoInterno)
class CargoInternoControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cargoInterno/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cargoInternoInstanceList.size() == 0
        assert model.cargoInternoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.cargoInternoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cargoInternoInstance != null
        assert view == '/cargoInterno/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cargoInterno/show/1'
        assert controller.flash.message != null
        assert CargoInterno.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cargoInterno/list'


        populateValidParams(params)
        def cargoInterno = new CargoInterno(params)

        assert cargoInterno.save() != null

        params.id = cargoInterno.id

        def model = controller.show()

        assert model.cargoInternoInstance == cargoInterno
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cargoInterno/list'


        populateValidParams(params)
        def cargoInterno = new CargoInterno(params)

        assert cargoInterno.save() != null

        params.id = cargoInterno.id

        def model = controller.edit()

        assert model.cargoInternoInstance == cargoInterno
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cargoInterno/list'

        response.reset()


        populateValidParams(params)
        def cargoInterno = new CargoInterno(params)

        assert cargoInterno.save() != null

        // test invalid parameters in update
        params.id = cargoInterno.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cargoInterno/edit"
        assert model.cargoInternoInstance != null

        cargoInterno.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cargoInterno/show/$cargoInterno.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cargoInterno.clearErrors()

        populateValidParams(params)
        params.id = cargoInterno.id
        params.version = -1
        controller.update()

        assert view == "/cargoInterno/edit"
        assert model.cargoInternoInstance != null
        assert model.cargoInternoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cargoInterno/list'

        response.reset()

        populateValidParams(params)
        def cargoInterno = new CargoInterno(params)

        assert cargoInterno.save() != null
        assert CargoInterno.count() == 1

        params.id = cargoInterno.id

        controller.delete()

        assert CargoInterno.count() == 0
        assert CargoInterno.get(cargoInterno.id) == null
        assert response.redirectedUrl == '/cargoInterno/list'
    }
}
