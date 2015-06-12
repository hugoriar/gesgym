package org.control.calendario

import com.dhtmlx.planner.DHXPlanner
import com.dhtmlx.planner.DHXSkin
import com.dhtmlx.planner.controls.DHXLightboxSelect;
import com.dhtmlx.planner.controls.DHXTimelineView;
import com.dhtmlx.planner.controls.DHXTimelineView.RenderModes;
import com.dhtmlx.planner.controls.DHXTimelineView.XScaleUnits;
import com.dhtmlx.planner.data.DHXDataFormat;
import com.dhtmlx.planner.extensions.DHXExtension
import org.calendario.CustomUnitsEventsManager
import org.json.simple.JSONValue

class TimelineController {

	def timeline_09() {
		DHXPlanner s = new DHXPlanner("./codebase/", DHXSkin.TERRACE);
		s.setInitialDate(2013, 1, 7);
		s.setWidth(900);
		s.setInitialView("topic");
		s.load("09_events", DHXDataFormat.JSON);
		s.data.dataprocessor.setURL("09_events");

		DHXTimelineView view = new DHXTimelineView("topic", "event_topic", "Topic");
		view.setRenderMode(RenderModes.BAR);
		view.setXScaleUnit(XScaleUnits.MINUTE);
		view.setXStep(30);
		view.setXSize(10);
		view.setXStart(16);
		view.setXLength(48);
		view.setServerList("event_topic");
		s.views.add(view);

		DHXLightboxSelect sel = new DHXLightboxSelect("event_topic", "Topic");
		sel.setServerList("event_topic");
		s.lightbox.add(sel);
		
		def map = [
			planner: s.render(),
			sample_name: "Timeline view",
			sample_dsc: "Timeline View can be used to visualize and monitor the progress of ongoing tasks or projects. The vertical scale in the view presents event holders, while the horizontal scale is a configurable time-scale. There is the possibility to enable the hierarchical structure and show the resources in expandable groups."
		]
		render(view: "/calendario/shared/article", model: map)
	}

	def events_09() {
		def evs = new CustomUnitsEventsManager(request);
		render evs.run();
	}
}
