package org.gym



import org.junit.*
import grails.test.mixin.*

/**
 * UserPersonalInstructorControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(UserPersonalInstructorController)
@Mock(UserPersonalInstructor)
class UserPersonalInstructorControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/userPersonalInstructor/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.userPersonalInstructorInstanceList.size() == 0
        assert model.userPersonalInstructorInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.userPersonalInstructorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.userPersonalInstructorInstance != null
        assert view == '/userPersonalInstructor/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/userPersonalInstructor/show/1'
        assert controller.flash.message != null
        assert UserPersonalInstructor.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/userPersonalInstructor/list'


        populateValidParams(params)
        def userPersonalInstructor = new UserPersonalInstructor(params)

        assert userPersonalInstructor.save() != null

        params.id = userPersonalInstructor.id

        def model = controller.show()

        assert model.userPersonalInstructorInstance == userPersonalInstructor
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/userPersonalInstructor/list'


        populateValidParams(params)
        def userPersonalInstructor = new UserPersonalInstructor(params)

        assert userPersonalInstructor.save() != null

        params.id = userPersonalInstructor.id

        def model = controller.edit()

        assert model.userPersonalInstructorInstance == userPersonalInstructor
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/userPersonalInstructor/list'

        response.reset()


        populateValidParams(params)
        def userPersonalInstructor = new UserPersonalInstructor(params)

        assert userPersonalInstructor.save() != null

        // test invalid parameters in update
        params.id = userPersonalInstructor.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/userPersonalInstructor/edit"
        assert model.userPersonalInstructorInstance != null

        userPersonalInstructor.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/userPersonalInstructor/show/$userPersonalInstructor.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        userPersonalInstructor.clearErrors()

        populateValidParams(params)
        params.id = userPersonalInstructor.id
        params.version = -1
        controller.update()

        assert view == "/userPersonalInstructor/edit"
        assert model.userPersonalInstructorInstance != null
        assert model.userPersonalInstructorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/userPersonalInstructor/list'

        response.reset()

        populateValidParams(params)
        def userPersonalInstructor = new UserPersonalInstructor(params)

        assert userPersonalInstructor.save() != null
        assert UserPersonalInstructor.count() == 1

        params.id = userPersonalInstructor.id

        controller.delete()

        assert UserPersonalInstructor.count() == 0
        assert UserPersonalInstructor.get(userPersonalInstructor.id) == null
        assert response.redirectedUrl == '/userPersonalInstructor/list'
    }
}
