package org.control.calendario

import com.dhtmlx.planner.DHXPlanner
import com.dhtmlx.planner.DHXSkin
import com.dhtmlx.planner.controls.DHXLightboxText;
import com.dhtmlx.planner.controls.DHXMapView;
import com.dhtmlx.planner.data.DHXDataFormat;
import com.dhtmlx.planner.extensions.DHXExtension
import org.calendario.CustomMapEventsManager

class MapController {

    def map_06() {
		DHXPlanner s = new DHXPlanner('./codebase/', DHXSkin.TERRACE);
		s.setInitialDate(2013, 1, 7);
    	s.config.setScrollHour(8);
    	s.setWidth(900);
    	s.xy.setMapDateWidth(160);
    	s.xy.setMapDescriptionWidth(300);
		s.load("06_events", DHXDataFormat.JSON);
		s.data.dataprocessor.setURL("06_events");
    	s.views.add(new DHXMapView());
		DHXMapView m = (DHXMapView) s.views.getView(3);
		m.setStartDate(2013, 1, 1);
    	s.setInitialView("map");

		// adds section in lightbox
		DHXLightboxText loc = new DHXLightboxText("event_location", "Location");
		loc.setHeight(40);
		s.lightbox.add(loc);

		def map = [
			planner: s.render(),
			sample_name: "Map view",
			sample_dsc: "Map view integrates Agenda view with Google Maps that allows you to display locations associated with the calendar events on the map. You can specify the event location in 2 ways: to specify the address in the event description or to set the point right on Google Maps."
		]
		render(view: "/calendario/shared/article", model: map)
	}

	def events_06() {
		def evs = new CustomMapEventsManager(request);
		render evs.run();
	}

}
