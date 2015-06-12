package org.control.calendario

import com.dhtmlx.planner.DHXPlanner
import com.dhtmlx.planner.DHXSkin
import com.dhtmlx.planner.controls.DHXFilter;
import com.dhtmlx.planner.controls.DHXRule;
import com.dhtmlx.planner.controls.DHXRule.DHXOperator;
import com.dhtmlx.planner.data.DHXDataFormat;
import com.dhtmlx.planner.extensions.DHXExtension
import org.calendario.CustomEventsManager

class FilteringController {

    def filtering_14() {
		DHXPlanner s = new DHXPlanner('./codebase/', DHXSkin.TERRACE);
		s.setInitialDate(2013, 1, 7);
    	s.config.setScrollHour(8);
    	s.setWidth(900);
		s.load("13_events", DHXDataFormat.JSON);
		s.data.dataprocessor.setURL("14_events");

		DHXFilter filter = new DHXFilter("month");
		filter.addRule(new DHXRule("start_date", DHXOperator.Greater, Calendar.getInstance()));
		s.views.getView(0).setFilter(filter);

		def map = [
			planner: s.render(),
			sample_name: "Events filtering",
			sample_dsc: "You may filter events by one or several criteria, using different filtering rules for different views. Filtering can be applied initially or invoked on some action."
		]
		render(view: "/calendario/shared/article", model: map)
	}

	def events_14() {
		def evs = new CustomEventsManager(request);
		render evs.run();
	}
}
