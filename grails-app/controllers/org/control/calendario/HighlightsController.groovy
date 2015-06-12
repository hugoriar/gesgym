package org.control.calendario

import com.dhtmlx.planner.DHXPlanner
import com.dhtmlx.planner.DHXSkin
import com.dhtmlx.planner.api.DHXBlockTime;
import com.dhtmlx.planner.api.DHXMarkTime;
import com.dhtmlx.planner.api.DHXZone;
import com.dhtmlx.planner.api.DHXTimeSpan.DHXDayOfWeek;
import com.dhtmlx.planner.data.DHXDataFormat;
import com.dhtmlx.planner.extensions.DHXExtension
import org.calendario.CustomEventsManager

class HighlightsController {

    def highlights_13() {
		DHXPlanner s = new DHXPlanner('./codebase/', DHXSkin.TERRACE);
		s.setInitialDate(2013, 1, 7);
    	s.config.setScrollHour(8);
    	s.setWidth(900);
		s.load("13_events", DHXDataFormat.JSON);
		s.data.dataprocessor.setURL("13_events");

		// sets block on Sunday
		DHXBlockTime block = new DHXBlockTime();
		block.setDay(DHXDayOfWeek.SUNDAY);
		s.timespans.add(block);

		// sets timespan on today from 8 to 20
		DHXMarkTime m1 = new DHXMarkTime();
		m1.setStartDate(8, 0);
		m1.setEndDate(20, 0);
		m1.setCssClass("blue_section");
		s.timespans.add(m1);

		// sets timespan on Monday and Driday from 10 to 15
		DHXMarkTime m2 = new DHXMarkTime();
		m2.setDays(DHXDayOfWeek.MONDAY, DHXDayOfWeek.FRIDAY);
		m2.addZone(new DHXZone(900, 1140));
		m2.setCssClass("red_section");
		s.timespans.add(m2);

		// enables highlight
		s.highlight.enable("highlight_section", 30);

		// adding custom styles
		String css = "<style>.blue_section { background-color: #2babf5; opacity: 0.27; filter:alpha(opacity=27); }</style>";
		css += "<style>.red_section { background-color: red; opacity: 0.27; filter:alpha(opacity=27); }</style>";
		css += "<style>.highlight_section { opacity: 0.25; z-index:0; filter:alpha(opacity=25); }  .highlight_section:hover { background-color: #90ee90;}</style>";

		def map = [
			planner: css + s.render(),
			sample_name: "Highlights",
			sample_dsc: "You may highlight specific blocks in the scheduler (periods of particular importance) with any CSS style. Also, there is the possibility to highlight the area under the mouse pointer."
		]
		render(view: "/calendario/shared/article", model: map)
	}

	def events_13() {
		def evs = new CustomEventsManager(request);
		render evs.run();
	}
}
