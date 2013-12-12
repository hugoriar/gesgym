package org.gym



import org.junit.*
import grails.test.mixin.*

/**
 * UserPersonalControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(UserPersonalController)
@Mock(UserPersonal)
class UserPersonalControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/userPersonal/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.userPersonalInstanceList.size() == 0
        assert model.userPersonalInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.userPersonalInstance != null
    }

    void testSave() {
        controller.save()

        assert model.userPersonalInstance != null
        assert view == '/userPersonal/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/userPersonal/show/1'
        assert controller.flash.message != null
        assert UserPersonal.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/userPersonal/list'


        populateValidParams(params)
        def userPersonal = new UserPersonal(params)

        assert userPersonal.save() != null

        params.id = userPersonal.id

        def model = controller.show()

        assert model.userPersonalInstance == userPersonal
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/userPersonal/list'


        populateValidParams(params)
        def userPersonal = new UserPersonal(params)

        assert userPersonal.save() != null

        params.id = userPersonal.id

        def model = controller.edit()

        assert model.userPersonalInstance == userPersonal
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/userPersonal/list'

        response.reset()


        populateValidParams(params)
        def userPersonal = new UserPersonal(params)

        assert userPersonal.save() != null

        // test invalid parameters in update
        params.id = userPersonal.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/userPersonal/edit"
        assert model.userPersonalInstance != null

        userPersonal.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/userPersonal/show/$userPersonal.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        userPersonal.clearErrors()

        populateValidParams(params)
        params.id = userPersonal.id
        params.version = -1
        controller.update()

        assert view == "/userPersonal/edit"
        assert model.userPersonalInstance != null
        assert model.userPersonalInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/userPersonal/list'

        response.reset()

        populateValidParams(params)
        def userPersonal = new UserPersonal(params)

        assert userPersonal.save() != null
        assert UserPersonal.count() == 1

        params.id = userPersonal.id

        controller.delete()

        assert UserPersonal.count() == 0
        assert UserPersonal.get(userPersonal.id) == null
        assert response.redirectedUrl == '/userPersonal/list'
    }
}
