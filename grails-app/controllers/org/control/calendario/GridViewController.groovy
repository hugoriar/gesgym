package org.control.calendario

import com.dhtmlx.planner.DHXPlanner
import com.dhtmlx.planner.DHXSkin
import com.dhtmlx.planner.controls.DHXGridView;
import com.dhtmlx.planner.controls.DHXGridViewColumn;
import com.dhtmlx.planner.data.DHXDataFormat;
import com.dhtmlx.planner.extensions.DHXExtension
import org.calendario.CustomEventsManager

class GridViewController {

    def gridview_07() {
		DHXPlanner s = new DHXPlanner('./codebase/', DHXSkin.TERRACE);
		s.setInitialDate(2013, 1, 7);
    	s.setWidth(900);
    	s.load("07_events", DHXDataFormat.JSON);
    	s.data.dataprocessor.setURL("07_events");
    	s.extensions.add(DHXExtension.RECURRING);
    	DHXGridView view = new DHXGridView();
    	view.addOption(new DHXGridViewColumn("text", "Text"));
    	view.addOption(new DHXGridViewColumn("start_date", "Start date", 150));
    	view.addOption(new DHXGridViewColumn("end_date", "End date", 150));
    	view.setFrom(2013, 0, 1);
    	s.views.add(view);
    	s.setInitialView("grid");

		def map = [
			planner: s.render(),
			sample_name: "Grid view",
			sample_dsc: "Grid view presents a list of upcoming events and unlike the Agenda view, it allows you to configure the number of columns and choose what data to display. It also supports sorting (including custom) and data templates."
		]
		render(view: "/calendario/shared/article", model: map)
	}

	def events_07() {
		def evs = new CustomEventsManager(request);
		render evs.run();
	}
}
