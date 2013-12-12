package org.gym



import org.junit.*
import grails.test.mixin.*

/**
 * UserSocioControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(UserSocioController)
@Mock(UserSocio)
class UserSocioControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/userSocio/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.userSocioInstanceList.size() == 0
        assert model.userSocioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.userSocioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.userSocioInstance != null
        assert view == '/userSocio/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/userSocio/show/1'
        assert controller.flash.message != null
        assert UserSocio.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/userSocio/list'


        populateValidParams(params)
        def userSocio = new UserSocio(params)

        assert userSocio.save() != null

        params.id = userSocio.id

        def model = controller.show()

        assert model.userSocioInstance == userSocio
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/userSocio/list'


        populateValidParams(params)
        def userSocio = new UserSocio(params)

        assert userSocio.save() != null

        params.id = userSocio.id

        def model = controller.edit()

        assert model.userSocioInstance == userSocio
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/userSocio/list'

        response.reset()


        populateValidParams(params)
        def userSocio = new UserSocio(params)

        assert userSocio.save() != null

        // test invalid parameters in update
        params.id = userSocio.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/userSocio/edit"
        assert model.userSocioInstance != null

        userSocio.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/userSocio/show/$userSocio.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        userSocio.clearErrors()

        populateValidParams(params)
        params.id = userSocio.id
        params.version = -1
        controller.update()

        assert view == "/userSocio/edit"
        assert model.userSocioInstance != null
        assert model.userSocioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/userSocio/list'

        response.reset()

        populateValidParams(params)
        def userSocio = new UserSocio(params)

        assert userSocio.save() != null
        assert UserSocio.count() == 1

        params.id = userSocio.id

        controller.delete()

        assert UserSocio.count() == 0
        assert UserSocio.get(userSocio.id) == null
        assert response.redirectedUrl == '/userSocio/list'
    }
}
