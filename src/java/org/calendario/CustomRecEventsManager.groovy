package org.calendario

import org.control.calendario.Event
import org.control.calendario.EventRec

import java.util.List;

import org.hibernate.criterion.Restrictions;

import com.dhtmlx.planner.DHXEv
import com.dhtmlx.planner.DHXEventsManager
import com.dhtmlx.planner.DHXStatus

class CustomRecEventsManager extends DHXEventsManager {

	def CustomRecEventsManager(request) {
		super(request);
	}

	@Override
	def Iterable<Event> getEvents() {
		return EventRec.list();
	}

	@Override
	def Iterable<EventRec> getEventRec() {
		return EventRec.list();
	}

	@Override
	def DHXStatus saveEvent(DHXEv event, DHXStatus status) {
		def ev = (EventRec) event;
		if (status == DHXStatus.UPDATE)
			event.save();
		else if (status == DHXStatus.DELETE) {
			event.delete();

			/** we should delete all sub-events from series
			 *  http://docs.dhtmlx.com/doku.php?id=dhtmlxscheduler:recurring_events#editing_deleting_a_certain_occurrence_in_the_series
			 */
			def c = EventRec.createCriteria()
			def evs = c {
				eq("event_pid", event.getId())
			}

			for (int i = 0; i < evs.size(); i++)
				evs[i].delete();
		} else if (status == DHXStatus.INSERT)
			event.save();

		return status;
	}

	@Override
	def DHXEv createEvent(String id, DHXStatus status) {
		if (status == DHXStatus.INSERT)
			return new EventRec();
		else
			return EventRec.get(id);
	}

}

