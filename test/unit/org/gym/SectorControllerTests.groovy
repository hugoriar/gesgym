package org.gym

import org.gym.ubicacion.Sector
import org.junit.*
import grails.test.mixin.*

/**
 * SectorControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(SectorController)
@Mock(Sector)
class SectorControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/sector/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.sectorInstanceList.size() == 0
        assert model.sectorInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.sectorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.sectorInstance != null
        assert view == '/sector/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/sector/show/1'
        assert controller.flash.message != null
        assert Sector.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/sector/list'


        populateValidParams(params)
        def sector = new Sector(params)

        assert sector.save() != null

        params.id = sector.id

        def model = controller.show()

        assert model.sectorInstance == sector
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/sector/list'


        populateValidParams(params)
        def sector = new Sector(params)

        assert sector.save() != null

        params.id = sector.id

        def model = controller.edit()

        assert model.sectorInstance == sector
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/sector/list'

        response.reset()


        populateValidParams(params)
        def sector = new Sector(params)

        assert sector.save() != null

        // test invalid parameters in update
        params.id = sector.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/sector/edit"
        assert model.sectorInstance != null

        sector.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/sector/show/$sector.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        sector.clearErrors()

        populateValidParams(params)
        params.id = sector.id
        params.version = -1
        controller.update()

        assert view == "/sector/edit"
        assert model.sectorInstance != null
        assert model.sectorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/sector/list'

        response.reset()

        populateValidParams(params)
        def sector = new Sector(params)

        assert sector.save() != null
        assert Sector.count() == 1

        params.id = sector.id

        controller.delete()

        assert Sector.count() == 0
        assert Sector.get(sector.id) == null
        assert response.redirectedUrl == '/sector/list'
    }
}
