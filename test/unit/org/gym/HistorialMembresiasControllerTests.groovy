package org.gym



import org.junit.*
import grails.test.mixin.*

@TestFor(HistorialMembresiasController)
@Mock(HistorialMembresias)
class HistorialMembresiasControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/historialMembresias/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.historialMembresiasInstanceList.size() == 0
        assert model.historialMembresiasInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.historialMembresiasInstance != null
    }

    void testSave() {
        controller.save()

        assert model.historialMembresiasInstance != null
        assert view == '/historialMembresias/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/historialMembresias/show/1'
        assert controller.flash.message != null
        assert HistorialMembresias.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/historialMembresias/list'

        populateValidParams(params)
        def historialMembresias = new HistorialMembresias(params)

        assert historialMembresias.save() != null

        params.id = historialMembresias.id

        def model = controller.show()

        assert model.historialMembresiasInstance == historialMembresias
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/historialMembresias/list'

        populateValidParams(params)
        def historialMembresias = new HistorialMembresias(params)

        assert historialMembresias.save() != null

        params.id = historialMembresias.id

        def model = controller.edit()

        assert model.historialMembresiasInstance == historialMembresias
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/historialMembresias/list'

        response.reset()

        populateValidParams(params)
        def historialMembresias = new HistorialMembresias(params)

        assert historialMembresias.save() != null

        // test invalid parameters in update
        params.id = historialMembresias.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/historialMembresias/edit"
        assert model.historialMembresiasInstance != null

        historialMembresias.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/historialMembresias/show/$historialMembresias.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        historialMembresias.clearErrors()

        populateValidParams(params)
        params.id = historialMembresias.id
        params.version = -1
        controller.update()

        assert view == "/historialMembresias/edit"
        assert model.historialMembresiasInstance != null
        assert model.historialMembresiasInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/historialMembresias/list'

        response.reset()

        populateValidParams(params)
        def historialMembresias = new HistorialMembresias(params)

        assert historialMembresias.save() != null
        assert HistorialMembresias.count() == 1

        params.id = historialMembresias.id

        controller.delete()

        assert HistorialMembresias.count() == 0
        assert HistorialMembresias.get(historialMembresias.id) == null
        assert response.redirectedUrl == '/historialMembresias/list'
    }
}
