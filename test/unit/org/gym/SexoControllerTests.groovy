package org.gym



import org.junit.*
import grails.test.mixin.*

@TestFor(SexoController)
@Mock(Sexo)
class SexoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/sexo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.sexoInstanceList.size() == 0
        assert model.sexoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.sexoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.sexoInstance != null
        assert view == '/sexo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/sexo/show/1'
        assert controller.flash.message != null
        assert Sexo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/sexo/list'

        populateValidParams(params)
        def sexo = new Sexo(params)

        assert sexo.save() != null

        params.id = sexo.id

        def model = controller.show()

        assert model.sexoInstance == sexo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/sexo/list'

        populateValidParams(params)
        def sexo = new Sexo(params)

        assert sexo.save() != null

        params.id = sexo.id

        def model = controller.edit()

        assert model.sexoInstance == sexo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/sexo/list'

        response.reset()

        populateValidParams(params)
        def sexo = new Sexo(params)

        assert sexo.save() != null

        // test invalid parameters in update
        params.id = sexo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/sexo/edit"
        assert model.sexoInstance != null

        sexo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/sexo/show/$sexo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        sexo.clearErrors()

        populateValidParams(params)
        params.id = sexo.id
        params.version = -1
        controller.update()

        assert view == "/sexo/edit"
        assert model.sexoInstance != null
        assert model.sexoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/sexo/list'

        response.reset()

        populateValidParams(params)
        def sexo = new Sexo(params)

        assert sexo.save() != null
        assert Sexo.count() == 1

        params.id = sexo.id

        controller.delete()

        assert Sexo.count() == 0
        assert Sexo.get(sexo.id) == null
        assert response.redirectedUrl == '/sexo/list'
    }
}
