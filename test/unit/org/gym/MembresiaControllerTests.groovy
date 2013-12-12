package org.gym



import org.junit.*
import grails.test.mixin.*

@TestFor(MembresiaController)
@Mock(Plan)
class MembresiaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/plan/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.membresiaInstanceList.size() == 0
        assert model.membresiaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.membresiaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.membresiaInstance != null
        assert view == '/plan/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/plan/show/1'
        assert controller.flash.message != null
        assert Plan.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/plan/list'

        populateValidParams(params)
        def membresia = new Plan(params)

        assert membresia.save() != null

        params.id = membresia.id

        def model = controller.show()

        assert model.membresiaInstance == membresia
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/plan/list'

        populateValidParams(params)
        def membresia = new Plan(params)

        assert membresia.save() != null

        params.id = membresia.id

        def model = controller.edit()

        assert model.membresiaInstance == membresia
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/plan/list'

        response.reset()

        populateValidParams(params)
        def membresia = new Plan(params)

        assert membresia.save() != null

        // test invalid parameters in update
        params.id = membresia.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/plan/edit"
        assert model.membresiaInstance != null

        membresia.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/plan/show/$membresia.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        membresia.clearErrors()

        populateValidParams(params)
        params.id = membresia.id
        params.version = -1
        controller.update()

        assert view == "/plan/edit"
        assert model.membresiaInstance != null
        assert model.membresiaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/plan/list'

        response.reset()

        populateValidParams(params)
        def membresia = new Plan(params)

        assert membresia.save() != null
        assert Plan.count() == 1

        params.id = membresia.id

        controller.delete()

        assert Membresia.count() == 0
        assert Plan.get(membresia.id) == null
        assert response.redirectedUrl == '/plan/list'
    }
}
