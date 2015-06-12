package org.control.calendario

import com.dhtmlx.planner.DHXPlanner
import com.dhtmlx.planner.DHXSkin
import com.dhtmlx.planner.controls.DHXExternalLightboxForm;
import com.dhtmlx.planner.data.DHXDataFormat;
import com.dhtmlx.planner.extensions.DHXExtension
import org.calendario.CustomEventsManager

class CustomLightboxController {

    def custom_lightbox_11() {
		DHXPlanner s = new DHXPlanner('./codebase/', DHXSkin.TERRACE);
		s.setWidth(900);
    	s.setInitialDate(2013, 1, 7);
    	s.config.setScrollHour(8);
    	s.config.setDetailsOnCreate(true);
    	s.config.setDblClickCreate(true);
    	s.config.setDetailsOnDblClick(true);

		s.load("11_events", DHXDataFormat.JSON);
		s.data.dataprocessor.setURL("11_events");

		DHXExternalLightboxForm box = s.lightbox.setExternalLightboxForm("./11_custom_editor.html", 296, 140);
		box.setClassName("custom_lightbox");

		def map = [
			planner: s.render(),
			sample_name: "Custom lightbox",
			sample_dsc: "There is the possibility to create a fully custom lightbox. Double click on any empty cell or event in the planner and open lightbox that is fully custom and contains regular HTML inputs."
		]
		render(view: "/calendario/shared/article", model: map)
	}

	def custom_editor_11() {
		render(view: "/shared/custom_editor")
	}

	def events_11() {
		def evs = new CustomEventsManager(request);
		render evs.run();
	}
}
