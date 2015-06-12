package org.control.ventas

import org.control.ventas.SubCategoriaController
import grails.test.mixin.*

/**
 * SubCategoriaControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(SubCategoriaController)
@Mock(SubCategoria)
class SubCategoriaControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/subCategoria/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.subCategoriaInstanceList.size() == 0
        assert model.subCategoriaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.subCategoriaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.subCategoriaInstance != null
        assert view == '/subCategoria/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/subCategoria/show/1'
        assert controller.flash.message != null
        assert SubCategoria.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/subCategoria/list'


        populateValidParams(params)
        def subCategoria = new SubCategoria(params)

        assert subCategoria.save() != null

        params.id = subCategoria.id

        def model = controller.show()

        assert model.subCategoriaInstance == subCategoria
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/subCategoria/list'


        populateValidParams(params)
        def subCategoria = new SubCategoria(params)

        assert subCategoria.save() != null

        params.id = subCategoria.id

        def model = controller.edit()

        assert model.subCategoriaInstance == subCategoria
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/subCategoria/list'

        response.reset()


        populateValidParams(params)
        def subCategoria = new SubCategoria(params)

        assert subCategoria.save() != null

        // test invalid parameters in update
        params.id = subCategoria.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/subCategoria/edit"
        assert model.subCategoriaInstance != null

        subCategoria.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/subCategoria/show/$subCategoria.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        subCategoria.clearErrors()

        populateValidParams(params)
        params.id = subCategoria.id
        params.version = -1
        controller.update()

        assert view == "/subCategoria/edit"
        assert model.subCategoriaInstance != null
        assert model.subCategoriaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/subCategoria/list'

        response.reset()

        populateValidParams(params)
        def subCategoria = new SubCategoria(params)

        assert subCategoria.save() != null
        assert SubCategoria.count() == 1

        params.id = subCategoria.id

        controller.delete()

        assert SubCategoria.count() == 0
        assert SubCategoria.get(subCategoria.id) == null
        assert response.redirectedUrl == '/subCategoria/list'
    }
}
