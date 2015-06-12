package org.control.fichaMedica

import org.control.fichaMedica.FichaMedicaController
import grails.test.mixin.*

@TestFor(FichaMedicaController)
@Mock(FichaMedica)
class FichaMedicaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/fichaMedica/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.fichaMedicaInstanceList.size() == 0
        assert model.fichaMedicaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.fichaMedicaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.fichaMedicaInstance != null
        assert view == '/fichaMedica/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/fichaMedica/show/1'
        assert controller.flash.message != null
        assert FichaMedica.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/fichaMedica/list'

        populateValidParams(params)
        def fichaMedica = new FichaMedica(params)

        assert fichaMedica.save() != null

        params.id = fichaMedica.id

        def model = controller.show()

        assert model.fichaMedicaInstance == fichaMedica
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/fichaMedica/list'

        populateValidParams(params)
        def fichaMedica = new FichaMedica(params)

        assert fichaMedica.save() != null

        params.id = fichaMedica.id

        def model = controller.edit()

        assert model.fichaMedicaInstance == fichaMedica
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/fichaMedica/list'

        response.reset()

        populateValidParams(params)
        def fichaMedica = new FichaMedica(params)

        assert fichaMedica.save() != null

        // test invalid parameters in update
        params.id = fichaMedica.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/fichaMedica/edit"
        assert model.fichaMedicaInstance != null

        fichaMedica.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/fichaMedica/show/$fichaMedica.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        fichaMedica.clearErrors()

        populateValidParams(params)
        params.id = fichaMedica.id
        params.version = -1
        controller.update()

        assert view == "/fichaMedica/edit"
        assert model.fichaMedicaInstance != null
        assert model.fichaMedicaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/fichaMedica/list'

        response.reset()

        populateValidParams(params)
        def fichaMedica = new FichaMedica(params)

        assert fichaMedica.save() != null
        assert FichaMedica.count() == 1

        params.id = fichaMedica.id

        controller.delete()

        assert FichaMedica.count() == 0
        assert FichaMedica.get(fichaMedica.id) == null
        assert response.redirectedUrl == '/fichaMedica/list'
    }
}
