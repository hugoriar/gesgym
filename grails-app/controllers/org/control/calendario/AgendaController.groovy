package org.control.calendario

import com.dhtmlx.planner.DHXPlanner
import com.dhtmlx.planner.DHXSkin
import com.dhtmlx.planner.controls.DHXAgendaView;
import com.dhtmlx.planner.data.DHXDataFormat;
import com.dhtmlx.planner.extensions.DHXExtension
import org.calendario.CustomEventsManager

class AgendaController {

    def agenda_05() {
		DHXPlanner s = new DHXPlanner('./codebase/', DHXSkin.TERRACE);
		s.setWidth(900);
	    s.setInitialDate(2013, 1, 7);
		s.load("05_events", DHXDataFormat.JSON);
		s.data.dataprocessor.setURL("05_events");
		s.extensions.add(DHXExtension.RECURRING);
    	s.views.add(new DHXAgendaView());
    	s.setInitialView("agenda");
		DHXAgendaView agenda = (DHXAgendaView) s.views.getView(3);
		agenda.setStartDate(2012, 11, 20);
		agenda.setEndDate(2013, 02, 01);

		def map = [
			planner: s.render(),
			sample_name: "Agenda view",
			sample_dsc: "Agenda view presents a list of ongoing and upcoming events in the order that they are to be taken place. The view contains 2 columns: one for the event date and the other for description."
		]
		render(view: "/calendario/shared/article", model: map)
	}

	def events_05() {
		def evs = new CustomEventsManager(request);
		render evs.run();
	}

}
