package org.control.calendario

import com.dhtmlx.planner.DHXPlanner
import com.dhtmlx.planner.DHXSkin
import com.dhtmlx.planner.controls.DHXLightboxMiniCalendar;
import com.dhtmlx.planner.controls.DHXLightboxSelect;
import com.dhtmlx.planner.data.DHXDataFormat;
import com.dhtmlx.planner.extensions.DHXExtension
import org.calendario.CustomUnitsEventsManager

class LightboxController {

    def lightbox_10() {
		DHXPlanner s = new DHXPlanner('./codebase/', DHXSkin.TERRACE);
		s.setInitialDate(2013, 1, 7);
    	s.config.setScrollHour(8);
    	s.setWidth(900);
		s.load("10_events", DHXDataFormat.JSON);
		s.data.dataprocessor.setURL("10_events");
		s.config.setDetailsOnCreate(true);
		s.config.setDetailsOnDblClick(true);

		// lightbox configuring
		s.lightbox.get("description").setHeight(30);
    	DHXLightboxSelect sel = new DHXLightboxSelect("event_topic", "Topic");
    	sel.setServerList("event_topic");
    	s.lightbox.add(sel,1);

		def map = [
			planner: s.render(),
			sample_name: "Lightbox",
			sample_dsc: "Lightbox is an editor of planner's events. To open lightbox, double click on any cell in the planner. Lighbox can contain any number of controls (by default, a text field for the event description and selects for setting the event duration)."
		]
		render(view: "/calendario/shared/article", model: map)
	}

	def events_10() {
		def evs = new CustomUnitsEventsManager(request);
		render evs.run();
	}
}
