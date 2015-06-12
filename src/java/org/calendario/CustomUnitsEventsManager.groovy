package org.calendario

import org.control.calendario.Event
import org.control.calendario.EventUnit

import java.util.ArrayList;
import java.util.HashMap;

import com.dhtmlx.planner.DHXEv;
import com.dhtmlx.planner.DHXEventsManager;
import com.dhtmlx.planner.DHXStatus;
import com.dhtmlx.planner.data.DHXCollection;



class CustomUnitsEventsManager extends DHXEventsManager {

	def CustomUnitsEventsManager(request) {
		super(request);
	}

	@Override
	def Iterable<Event> getEvents() {
		return EventUnit.list();
	}

	@Override
	def DHXStatus saveEvent(DHXEv event, DHXStatus status) {
		def ev = (EventUnit) event;
		if (status == DHXStatus.UPDATE)
			event.save();
		else if (status == DHXStatus.DELETE)
			event.delete();
		else if (status == DHXStatus.INSERT)
			event.save();

		return status;
	}

	@Override
	def DHXEv createEvent(String id, DHXStatus status) {
		if (status == DHXStatus.INSERT)
			return new EventUnit();
		else
			return EventUnit.get(id);
	}


	@Override
	def HashMap<String, Iterable<DHXCollection>> getCollections() {
		ArrayList<DHXCollection> event_type = new ArrayList<DHXCollection>();
		event_type.add(new DHXCollection("mobile", "Mobile"));
		event_type.add(new DHXCollection("web", "Web design"));
		event_type.add(new DHXCollection("marketing", "Marketing"));

		HashMap<String,Iterable<DHXCollection>> c = new HashMap<String,Iterable<DHXCollection>>();
		c.put("event_topic", event_type);
		return c;
	}

}
