package org.control

import org.control.ContactoEmergenciaController
import grails.test.mixin.*

@TestFor(ContactoEmergenciaController)
@Mock(ContactoEmergencia)
class ContactoEmergenciaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/contactoEmergencia/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.contactoEmergenciaInstanceList.size() == 0
        assert model.contactoEmergenciaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.contactoEmergenciaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.contactoEmergenciaInstance != null
        assert view == '/contactoEmergencia/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/contactoEmergencia/show/1'
        assert controller.flash.message != null
        assert ContactoEmergencia.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/contactoEmergencia/list'

        populateValidParams(params)
        def contactoEmergencia = new ContactoEmergencia(params)

        assert contactoEmergencia.save() != null

        params.id = contactoEmergencia.id

        def model = controller.show()

        assert model.contactoEmergenciaInstance == contactoEmergencia
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/contactoEmergencia/list'

        populateValidParams(params)
        def contactoEmergencia = new ContactoEmergencia(params)

        assert contactoEmergencia.save() != null

        params.id = contactoEmergencia.id

        def model = controller.edit()

        assert model.contactoEmergenciaInstance == contactoEmergencia
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/contactoEmergencia/list'

        response.reset()

        populateValidParams(params)
        def contactoEmergencia = new ContactoEmergencia(params)

        assert contactoEmergencia.save() != null

        // test invalid parameters in update
        params.id = contactoEmergencia.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/contactoEmergencia/edit"
        assert model.contactoEmergenciaInstance != null

        contactoEmergencia.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/contactoEmergencia/show/$contactoEmergencia.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        contactoEmergencia.clearErrors()

        populateValidParams(params)
        params.id = contactoEmergencia.id
        params.version = -1
        controller.update()

        assert view == "/contactoEmergencia/edit"
        assert model.contactoEmergenciaInstance != null
        assert model.contactoEmergenciaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/contactoEmergencia/list'

        response.reset()

        populateValidParams(params)
        def contactoEmergencia = new ContactoEmergencia(params)

        assert contactoEmergencia.save() != null
        assert ContactoEmergencia.count() == 1

        params.id = contactoEmergencia.id

        controller.delete()

        assert ContactoEmergencia.count() == 0
        assert ContactoEmergencia.get(contactoEmergencia.id) == null
        assert response.redirectedUrl == '/contactoEmergencia/list'
    }
}
