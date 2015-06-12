package org.control.calendario

import com.dhtmlx.planner.DHXEventRec

class EventRec extends DHXEventRec {

    String  color
    String  textColor
    Integer dayOfWeek

    static belongsTo	= [horario: Horario]

    static constraints = {
        color       blank: true, nullable: true
        textColor   blank: true, nullable: true
        dayOfWeek   blank: true, nullable: true
    }

	static mapping = {
		table 'events_rec'
		id column: 'event_id'
        textColor column: 'textColor'
	}

    /*
 * Methods of the Domain Class
 */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${text}";
	}
}
