package org.calendario

import org.control.calendario.Event
import org.control.calendario.EventMap

import java.util.List;
import java.util.HashMap;

import com.dhtmlx.planner.DHXEv
import com.dhtmlx.planner.DHXEventsManager
import com.dhtmlx.planner.DHXStatus


class CustomMapEventsManager extends DHXEventsManager {

	def CustomMapEventsManager(request) {
		super(request);
	}

	@Override
	def Iterable<Event> getEvents() {
		return EventMap.list();
	}

	@Override
	def DHXStatus saveEvent(DHXEv event, DHXStatus status) {
		def ev = (EventMap) event;
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
			return new EventMap();
		else
			return EventMap.get(id);
	}

}

