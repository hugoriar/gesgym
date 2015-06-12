package org.control.calendario

import com.dhtmlx.planner.DHXPlanner
import com.dhtmlx.planner.DHXSkin
import com.dhtmlx.planner.data.DHXDataFormat;
import com.dhtmlx.planner.extensions.DHXExtension
import org.calendario.CustomEventsManager

class ExportController {

    def export_16() {
		DHXPlanner s = new DHXPlanner('./codebase/', DHXSkin.TERRACE);
		s.setInitialDate(2013, 1, 7);
    	s.config.setScrollHour(8);
    	s.setWidth(900);
    	s.load("16_events", DHXDataFormat.JSON);
    	s.data.dataprocessor.setURL("16_events");
    	s.toPDF();
    	s.toICal("16_ical");

		def map = [
			planner: s.render(),
			sample_name: "Export to PDF and iCal",
			sample_dsc: "To provide printing capabilities, JavaPlanner supports export to a PDF document. Also, there is support for data export to the iCal format that allows you to share the planner data across different apps and devices."
		]
		render(view: "/calendario/shared/article", model: map)
	}

	def events_16() {
		def evs = new CustomEventsManager(request);
		render evs.run();
	}

	def ical_16() {
		render "";
		String filename = "javaplanner.ics";
		String ical = request.getParameter("ical");
		if (ical==null)
			return "";
		response.reset();
		response.setContentType("calendar/ical");
		response.setHeader("Content-disposition", "attachment; filename=\"" +filename +"\"");
		try {
			response.getOutputStream().print(ical);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}
}
