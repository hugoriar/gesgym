package org.control.calendario

import com.dhtmlx.planner.DHXEvent

class Event extends DHXEvent{

    String color
    String textColor

    static belongsTo	= [horario: Horario]

    static constraints = {
        color       blank: true, nullable: true
        textColor   blank: true, nullable: true
    }

	static mapping = {
		table 'events'
		id column: 'event_id'
		text column: 'event_name'
        textColor column: 'textColor'
	}

    //	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${text}";
	}
}
