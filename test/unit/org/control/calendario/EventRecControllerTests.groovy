package org.control.calendario


import org.junit.*
import grails.test.mixin.*

/**
 * EventRecControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(EventRecController)
@Mock(EventRec)
class EventRecControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/eventRec/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.eventRecInstanceList.size() == 0
        assert model.eventRecInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.eventRecInstance != null
    }

    void testSave() {
        controller.save()

        assert model.eventRecInstance != null
        assert view == '/eventRec/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/eventRec/show/1'
        assert controller.flash.message != null
        assert EventRec.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/eventRec/list'


        populateValidParams(params)
        def eventRec = new EventRec(params)

        assert eventRec.save() != null

        params.id = eventRec.id

        def model = controller.show()

        assert model.eventRecInstance == eventRec
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/eventRec/list'


        populateValidParams(params)
        def eventRec = new EventRec(params)

        assert eventRec.save() != null

        params.id = eventRec.id

        def model = controller.edit()

        assert model.eventRecInstance == eventRec
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/eventRec/list'

        response.reset()


        populateValidParams(params)
        def eventRec = new EventRec(params)

        assert eventRec.save() != null

        // test invalid parameters in update
        params.id = eventRec.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/eventRec/edit"
        assert model.eventRecInstance != null

        eventRec.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/eventRec/show/$eventRec.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        eventRec.clearErrors()

        populateValidParams(params)
        params.id = eventRec.id
        params.version = -1
        controller.update()

        assert view == "/eventRec/edit"
        assert model.eventRecInstance != null
        assert model.eventRecInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/eventRec/list'

        response.reset()

        populateValidParams(params)
        def eventRec = new EventRec(params)

        assert eventRec.save() != null
        assert EventRec.count() == 1

        params.id = eventRec.id

        controller.delete()

        assert EventRec.count() == 0
        assert EventRec.get(eventRec.id) == null
        assert response.redirectedUrl == '/eventRec/list'
    }
}
