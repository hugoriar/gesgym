package org.control.calendario

import com.dhtmlx.planner.DHXEvent

class EventUnit extends DHXEvent {

	static mapping = {
		table 'events_units'
		id column: 'event_id'
	}

	public String event_topic;
	public String getEvent_topic() {
		return event_topic;
	}
	public void setEvent_topic(String event_topic) {
		this.event_topic = event_topic;
	}
}