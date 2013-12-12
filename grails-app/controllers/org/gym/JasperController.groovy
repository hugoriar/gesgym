/* Copyright 2006-2012 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 */

package org.gym

import net.sf.jasperreports.engine.JasperPrint
import org.codehaus.groovy.grails.plugins.jasper.JasperExportFormat
import org.codehaus.groovy.grails.plugins.jasper.JasperReportDef
import org.codehaus.groovy.grails.plugins.jasper.JasperService

import javax.servlet.http.HttpSession

/*
* @author mfpereira 2007
*/
class JasperController {
    JasperService jasperService

    @Deprecated
    def index = {
        def testModel = this.getProperties().containsKey('chainModel') ? chainModel : null
        addImagesURIIfHTMLReport(params, request.contextPath)
        JasperReportDef report = jasperService.buildReportDefinition(params, request.getLocale(), testModel)
        addJasperPrinterToSession(request.getSession(), report.jasperPrinter)
        generateResponse(report)
    }

    /**
     * Generate a html response.
     */
    def generateResponse = {reportDef ->
        if (!reportDef.fileFormat.inline && !reportDef.parameters._inline) {
            response.setHeader("Content-disposition", "attachment; filename=" + (reportDef.parameters._name ?: reportDef.name) + "." + reportDef.fileFormat.extension);
            response.contentType = reportDef.fileFormat.mimeTyp
            response.characterEncoding = "UTF-8"
            response.outputStream << reportDef.contentStream.toByteArray()
        } else {
            render(text: reportDef.contentStream, contentType: reportDef.fileFormat.mimeTyp, encoding: reportDef.parameters.encoding ? reportDef.parameters.encoding : 'UTF-8');
        }
    }

    private def addJasperPrinterToSession(HttpSession session, JasperPrint jasperPrinter) {
        session.setAttribute(
                net.sf.jasperreports.j2ee.servlets.ImageServlet.DEFAULT_JASPER_PRINT_SESSION_ATTRIBUTE,
                jasperPrinter)
    }

    private def addImagesURIIfHTMLReport(Map parameters, String contextPath) {
        if (JasperExportFormat.HTML_FORMAT == JasperExportFormat.determineFileFormat(parameters._format)) {
            parameters.put("IMAGES_URI", "${contextPath}/reports/image?image=")
        }
    }
}

