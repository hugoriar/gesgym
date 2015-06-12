package org.control.calendario

import com.dhtmlx.planner.DHXPlanner
import com.dhtmlx.planner.DHXSkin
import com.dhtmlx.planner.DHXStatus;
import com.dhtmlx.planner.data.DHXDataFormat
import org.calendario.CustomEventsManager;

class SecurityController {

    def security_15() {
		DHXPlanner s = new DHXPlanner('./codebase/', DHXSkin.TERRACE);
		s.setInitialDate(2013, 1, 7);
    	s.config.setScrollHour(8);
    	s.setWidth(900);
		s.load("15_events", DHXDataFormat.JSON);
		s.data.dataprocessor.setURL("15_events");

		def map = [
			planner: s.render(),
			sample_name: "Security",
			sample_dsc: "By default, any user can edit data in the scheduler and the related changes will be saved in the database. Built-in security manager will let you limit access to 'read', 'insert', 'update' and 'delete' operations for specific groups of users."
		]
		render(view: "/calendario/shared/article", model: map)
	}

	def events_15() {
		def evs = new CustomEventsManager(request);
		evs.security.deny(DHXStatus.UPDATE);
		render evs.run();
	}
}
