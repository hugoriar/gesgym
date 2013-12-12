package org.gym.fichaMedica



import org.junit.*
import grails.test.mixin.*

@TestFor(CondicionMedicaController)
@Mock(CondicionMedica)
class CondicionMedicaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/condicionMedica/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.condicionMedicaInstanceList.size() == 0
        assert model.condicionMedicaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.condicionMedicaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.condicionMedicaInstance != null
        assert view == '/condicionMedica/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/condicionMedica/show/1'
        assert controller.flash.message != null
        assert CondicionMedica.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/condicionMedica/list'

        populateValidParams(params)
        def condicionMedica = new CondicionMedica(params)

        assert condicionMedica.save() != null

        params.id = condicionMedica.id

        def model = controller.show()

        assert model.condicionMedicaInstance == condicionMedica
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/condicionMedica/list'

        populateValidParams(params)
        def condicionMedica = new CondicionMedica(params)

        assert condicionMedica.save() != null

        params.id = condicionMedica.id

        def model = controller.edit()

        assert model.condicionMedicaInstance == condicionMedica
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/condicionMedica/list'

        response.reset()

        populateValidParams(params)
        def condicionMedica = new CondicionMedica(params)

        assert condicionMedica.save() != null

        // test invalid parameters in update
        params.id = condicionMedica.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/condicionMedica/edit"
        assert model.condicionMedicaInstance != null

        condicionMedica.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/condicionMedica/show/$condicionMedica.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        condicionMedica.clearErrors()

        populateValidParams(params)
        params.id = condicionMedica.id
        params.version = -1
        controller.update()

        assert view == "/condicionMedica/edit"
        assert model.condicionMedicaInstance != null
        assert model.condicionMedicaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/condicionMedica/list'

        response.reset()

        populateValidParams(params)
        def condicionMedica = new CondicionMedica(params)

        assert condicionMedica.save() != null
        assert CondicionMedica.count() == 1

        params.id = condicionMedica.id

        controller.delete()

        assert CondicionMedica.count() == 0
        assert CondicionMedica.get(condicionMedica.id) == null
        assert response.redirectedUrl == '/condicionMedica/list'
    }
}
