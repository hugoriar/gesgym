package org.control

import com.dhtmlx.planner.DHXPlanner
import com.dhtmlx.planner.DHXSkin
import com.dhtmlx.planner.controls.DHXLocalization
import com.dhtmlx.planner.data.DHXDataFormat
import com.dhtmlx.planner.extensions.DHXExtension
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.joda.time.DateTime

import java.text.SimpleDateFormat

@Secured(['permitAll'])
class HomeController {
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm")
    def pagoService

    def index = {
        if (SpringSecurityUtils.ifAllGranted('ROLE_ADMIN')) {

            def date = Calendar.getInstance()
            DHXPlanner s = new DHXPlanner('./codebase/', DHXSkin.TERRACE);
            s.localizations.set(DHXLocalization.Spanish);
            s.setWidth(1170);
            s.setHeight(800);
            s.setInitialDate(date.get(Calendar.YEAR), date.get(Calendar.MONTH), date.get(Calendar.DAY_OF_MONTH));
            s.config.setFirstHour(7);
            s.config.setLastHour(23);
            s.config.setFullDay(true);
            s.config.setMultiDay(true);
            s.load("04_events", DHXDataFormat.JSON);
            s.data.dataprocessor.setURL("04_events");
            s.extensions.add(DHXExtension.RECURRING);

            def map = [
                    planner: s.render(),
                    sample_name: "Recurring events",
                    sample_dsc: "Recurring events are events that repeat in series, for example, the birthday of your friend, a monthly salary or a weekly staff meeting. Create a recurring event and try to edit it: you may change all occurrences in the series at once or edit just a single instance."
            ]

            def result = pagoService.busca([
                    usarFechas: true,
                    desde     : sdf.format(new DateTime().withTimeAtStartOfDay().toDate()),
                    hasta     : sdf.format(new DateTime().plusDays(1).withTimeAtStartOfDay().minusSeconds(1).toDate())
            ])

            def resultMensual = pagoService.busca([
                    usarFechas: true,
                    desde     : sdf.format(new DateTime().withDayOfMonth(1).withTimeAtStartOfDay().toDate()),
                    hasta     : sdf.format(new DateTime().withDayOfMonth(1).withTimeAtStartOfDay().plusMonths(1).minusSeconds(1).toDate())
            ])

            render(view:"index", model:[
                    planner        : map?.planner,
                    pagoMapList    : result.pagoMapList,
                    pagoMapSuma    : result.pagoMapSuma,
                    pagoMapListMes : resultMensual.pagoMapList,
                    pagoMapSumaMes : resultMensual.pagoMapSuma/*,
                    contMem     : result.contMem,
                    contMat     : result.contMat,
                    contRen     : result.contRen,
                    contNuevos  : result.contNuevos*/
            ])
        }
        else if (SpringSecurityUtils.ifAllGranted('ROLE_USER')) {
            redirect(controller: 'userSocio', action: 'show', id: sec.loggedInUserInfo(field: 'id'))
        }
        else {
            redirect(controller: 'login', action: 'auth')
        }

//        session['logoEmpresa'] = ConfiguracionBytes.findByNombre('logoEmpresa', [cache: true])?.valor
        // sets events set
//        CustomRecEventsManager evs = new CustomRecEventsManager(request);
//        s.parse(evs.getEventRec());


        /*CustomRecEventsManager evs = new CustomRecEventsManager(request);
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
//        s.parse(ja)*/



        /*def configuracionInstance = Configuracion.findByNombre("AdaptadorIPServidor")
        def prefijoIp = params.prefijoIp?:(Configuracion.findByNombre("prefijoIp")?.valor)?:"192.168."
        List<String> ips = new ArrayList<>()
        Enumeration ne = NetworkInterface.getNetworkInterfaces();
        while (ne.hasMoreElements()) {
            NetworkInterface netFace = (NetworkInterface) ne.nextElement();
            if ((netFace.getDisplayName()+" "+netFace.getName()).equalsIgnoreCase(configuracionInstance?.valor)) {
                Enumeration ae = netFace.getInetAddresses();
                while (ae.hasMoreElements()) {
                    InetAddress address = (InetAddress) ae.nextElement();
                    if (address.getHostAddress().startsWith(prefijoIp)){
//                        log.debug("IP del servidor: ${address.getHostAddress()}");
                        ips.add(address.getHostAddress())
                    }
                }
            }
        }

        if (!ips.toString().equalsIgnoreCase(Configuracion.findByNombre("IPServidor")?.valor)){
            if (Configuracion.findByNombre("emailsAvisoCambioIp")?.valor){
                String destinatarios = Configuracion.findByNombre("emailsAvisoCambioIp")?.valor
                log.debug("La IP del servidor ha cambiado, de ${Configuracion.findByNombre("IPServidor")?.valor} a ${ips.toString()}")
                mailService.sendMail {
                    to destinatarios
                    from grailsApplication.config.grails.mail.username
                    subject "IP de servidor ha cambiado"
                    body """Hola, se informa que la IP del servidor del sistema de gestión ha cambiado, de ${Configuracion.findByNombre("IPServidor").valor?.substring(1,Configuracion.findByNombre("IPServidor").valor?.size()-1)} a ${ips.toString().substring(1,ips.toString().size()-1)}.\n
Por lo tanto debe actualizar a la nueva IP, en su navegador y en sus favoritos.""".toString()
                }
            }
        }

        configuracionService.nuevaConfiguracion("IPServidor", ips.toString())
        render(view:"index", model:[ ipsServidor: ips ])*/
//        render(view:"index")
    }

}
