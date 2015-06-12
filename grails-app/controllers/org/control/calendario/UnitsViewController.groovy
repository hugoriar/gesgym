package org.control.calendario

import com.dhtmlx.planner.DHXPlanner
import com.dhtmlx.planner.DHXSkin
import com.dhtmlx.planner.controls.DHXLightboxSelect;
import com.dhtmlx.planner.controls.DHXUnitsView;
import com.dhtmlx.planner.data.DHXDataFormat;
import com.dhtmlx.planner.extensions.DHXExtension
import org.calendario.CustomUnitsEventsManager

class UnitsViewController {

    def unitsview_08() {
		DHXPlanner s = new DHXPlanner("./codebase/", DHXSkin.TERRACE);
    	s.setInitialDate(2013, 1, 7);
    	s.config.setScrollHour(8);
    	s.setWidth(900);
    	s.load("08_events", DHXDataFormat.JSON);
    	s.data.dataprocessor.setURL("08_events");
    	s.setInitialView("topic");

    	// creates units view
    	DHXUnitsView view = new DHXUnitsView("topic", "event_topic", "Topic");
    	view.setServerListLink("event_topic");
    	s.views.add(view);

    	// adds section in lightbox
    	DHXLightboxSelect sel = new DHXLightboxSelect("event_topic", "Topic");
    	sel.setServerList("event_topic");
    	s.lightbox.add(sel);

		def map = [
			planner: s.render(),
			sample_name: "Units view",
			sample_dsc: "Units View lets you display several calendars for multiple resources simultaneously (e.g. human resources, rooms, etc.). The calendars are arranged in columns, so you can see all of them on one page."
		]
		render(view: "/calendario/shared/article", model: map)
	}

	def events_08() {
		def evs = new CustomUnitsEventsManager(request);
		render evs.run();
	}
	
}
