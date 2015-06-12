package org.control.tag



import org.junit.*
import grails.test.mixin.*

/**
 * ReporteEscaneoTagControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(ReporteEscaneoTagController)
@Mock(ReporteEscaneoTag)
class ReporteEscaneoTagControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/reporteEscaneoTag/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.reporteEscaneoTagInstanceList.size() == 0
        assert model.reporteEscaneoTagInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.reporteEscaneoTagInstance != null
    }

    void testSave() {
        controller.save()

        assert model.reporteEscaneoTagInstance != null
        assert view == '/reporteEscaneoTag/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/reporteEscaneoTag/show/1'
        assert controller.flash.message != null
        assert ReporteEscaneoTag.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/reporteEscaneoTag/list'


        populateValidParams(params)
        def reporteEscaneoTag = new ReporteEscaneoTag(params)

        assert reporteEscaneoTag.save() != null

        params.id = reporteEscaneoTag.id

        def model = controller.show()

        assert model.reporteEscaneoTagInstance == reporteEscaneoTag
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/reporteEscaneoTag/list'


        populateValidParams(params)
        def reporteEscaneoTag = new ReporteEscaneoTag(params)

        assert reporteEscaneoTag.save() != null

        params.id = reporteEscaneoTag.id

        def model = controller.edit()

        assert model.reporteEscaneoTagInstance == reporteEscaneoTag
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/reporteEscaneoTag/list'

        response.reset()


        populateValidParams(params)
        def reporteEscaneoTag = new ReporteEscaneoTag(params)

        assert reporteEscaneoTag.save() != null

        // test invalid parameters in update
        params.id = reporteEscaneoTag.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/reporteEscaneoTag/edit"
        assert model.reporteEscaneoTagInstance != null

        reporteEscaneoTag.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/reporteEscaneoTag/show/$reporteEscaneoTag.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        reporteEscaneoTag.clearErrors()

        populateValidParams(params)
        params.id = reporteEscaneoTag.id
        params.version = -1
        controller.update()

        assert view == "/reporteEscaneoTag/edit"
        assert model.reporteEscaneoTagInstance != null
        assert model.reporteEscaneoTagInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/reporteEscaneoTag/list'

        response.reset()

        populateValidParams(params)
        def reporteEscaneoTag = new ReporteEscaneoTag(params)

        assert reporteEscaneoTag.save() != null
        assert ReporteEscaneoTag.count() == 1

        params.id = reporteEscaneoTag.id

        controller.delete()

        assert ReporteEscaneoTag.count() == 0
        assert ReporteEscaneoTag.get(reporteEscaneoTag.id) == null
        assert response.redirectedUrl == '/reporteEscaneoTag/list'
    }
}
