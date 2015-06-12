package org.control.calendario

import com.dhtmlx.planner.DHXPlanner
import com.dhtmlx.planner.DHXSkin
import com.dhtmlx.planner.controls.DHXLocalization
import com.dhtmlx.planner.extensions.DHXExtension
import com.dhtmlx.planner.data.DHXDataFormat
import org.calendario.CustomEventsManager

class LoadingController {

	def loading_02() {
		DHXPlanner s = new DHXPlanner('./codebase/', DHXSkin.TERRACE);
		s.setInitialDate(2013, 1, 7);
    	s.config.setScrollHour(8);
    	s.setWidth(900);
		s.extensions.add(DHXExtension.RECURRING);
		s.load("./02_events", DHXDataFormat.JSON);

		def map = [
			planner: s.render(),
			sample_name: "Loading",
			sample_dsc: "Scheduler can load data of ICal, JSON, XML formats from a file or object. There is support for static and dynamic loading modes."
		]
		render(view: "/calendario/shared/article", model: map)
	}

	def events_02() {
		def evs = new CustomEventsManager(request);
		render evs.run();
	}



        def initializing() {
            DHXPlanner p = new DHXPlanner('./codebase/', DHXSkin.TERRACE);
            p.localizations.set(DHXLocalization.Spanish);
            p.setWidth(900);
            p.setHeight(700);
            p.setInitialDate(2013, 1, 7);
            p.load("events", DHXDataFormat.JSON);//sets the function that will provide loading data to the planner in the specified format.

            def map = [
                    planner: p.render(),
            ]
            render(view: "/event/calendario", model: map)
//            render(view: "/calendario/shared/article", model: map)
        }

        def events() {
            def evs = new CustomEventsManager(request);
            render evs.run();
        }
}
