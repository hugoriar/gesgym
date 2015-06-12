package org.control.calendario

import com.dhtmlx.planner.DHXEvent

class EventMap extends DHXEvent {

	static mapping = {
		table 'events_map'
		id column: 'event_id'
	}

	public String event_location;
	public String getEvent_location() {
		return event_location;
	}
	public void setEvent_location(String event_location) {
		this.event_location = event_location;
	}

	public String lat = "";
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}

	public String lng = "";
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
}