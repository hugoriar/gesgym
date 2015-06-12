package org.control.calendario

import com.dhtmlx.planner.DHXPlanner
import com.dhtmlx.planner.DHXSkin
import com.dhtmlx.planner.controls.DHXLightboxMiniCalendar;
import com.dhtmlx.planner.data.DHXDataFormat;
import com.dhtmlx.planner.extensions.DHXExtension
import org.calendario.CustomEventsManager

class MiniCalendarsController {

    def mini_calendars_12() {
		DHXPlanner s = new DHXPlanner('./codebase/', DHXSkin.TERRACE);
		s.setInitialDate(2013, 1, 7);
    	s.config.setScrollHour(8);
    	s.setWidth(900);
		s.load("12_events", DHXDataFormat.JSON);
		s.data.dataprocessor.setURL("12_events");

		s.calendars.attachMiniCalendar();
		s.lightbox.add(new DHXLightboxMiniCalendar("cal", "Time period"));

		def map = [
			planner: s.render(),
			sample_name: "Mini calendars",
			sample_dsc: "To simplify navigation, you can display a small date picker on the left side of the scheduler header. Also, you can put a date picker in the lightbox or any HTML container outside the scheduler."
		]
		render(view: "/calendario/shared/article", model: map)
	}

	def events_12() {
		def evs = new CustomEventsManager(request);
		render evs.run();
	}
}
