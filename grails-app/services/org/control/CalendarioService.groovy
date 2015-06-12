package org.control

import com.dhtmlx.planner.DHXPlanner
import com.dhtmlx.planner.DHXSkin
import com.dhtmlx.planner.controls.DHXLocalization
import com.dhtmlx.planner.data.DHXDataFormat
import com.dhtmlx.planner.extensions.DHXExtension
import grails.converters.JSON
import org.calendario.CustomRecEventsManager
import org.json.simple.JSONArray
import org.json.simple.JSONObject

import java.text.SimpleDateFormat

/**
 * CalendarioService
 * A service class encapsulates the core business logic of a Grails application
 */
class CalendarioService {

    static transactional = true

    def calendario() {
        def date = Calendar.getInstance()
        DHXPlanner s = new DHXPlanner('./codebase/', DHXSkin.TERRACE);
        s.localizations.set(DHXLocalization.Spanish);
        s.setWidth(900);
        s.setHeight(700);
        s.setInitialDate(date.get(Calendar.YEAR), date.get(Calendar.MONTH), date.get(Calendar.DAY_OF_MONTH));
        s.config.setFirstHour(7);
        s.config.setLastHour(23);
        s.config.setFullDay(true);
        s.config.setMultiDay(true);
        s.load("04_events", DHXDataFormat.JSON);
        s.data.dataprocessor.setURL("04_events");
        s.extensions.add(DHXExtension.RECURRING);

        /*def map = [
                planner: s.render(),
                sample_name: "Recurring events",
                sample_dsc: "Recurring events are events that repeat in series, for example, the birthday of your friend, a monthly salary or a weekly staff meeting. Create a recurring event and try to edit it: you may change all occurrences in the series at once or edit just a single instance."
        ]

        return map*/
        return s.render()
    }

    def getEventos(CustomRecEventsManager evs) {
//        def evs = new CustomRecEventsManager(request);
        JSONArray ja = new JSONArray();
        evs.getEventRec().each { evento ->
            JSONObject jo = new JSONObject();
            jo.put('id',            evento.id)
            jo.put('text',          evento.text)
            jo.put('end_date',      new SimpleDateFormat("dd/MM/yyyy HH:mm").format(evento.end_date))
            jo.put('start_date',    new SimpleDateFormat("dd/MM/yyyy HH:mm").format(evento.start_date))
            jo.put('event_length',  evento.event_length)
            jo.put('event_pid',     evento.event_pid)
            jo.put('horario',       evento.horario)
            jo.put('rec_type',      evento.rec_type)
            jo.put('color',         evento.color)
            jo.put('textColor',     evento.textColor)

            ja.add(jo);
        }
        ja as JSON
    }
}
