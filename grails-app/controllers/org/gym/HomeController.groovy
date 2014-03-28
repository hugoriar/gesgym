package org.gym

class HomeController {

/*    def index() {
        render(view:"index")
//        redirect(action: "list", params: params)
    }*/

    def index = {
        def configuracionInstance = Configuracion.findByNombre("AdaptadorIPServidor")
        List<String> ips = new ArrayList<>()
        List<String> networkInterfaces = new ArrayList<>()
        NetworkInterface nface
        Enumeration ne = NetworkInterface.getNetworkInterfaces();
        while (ne.hasMoreElements()) {
            NetworkInterface netFace = (NetworkInterface) ne.nextElement();
            //log.debug("FOUND NetworkInterface: ${netFace.getDisplayName()}  ${netFace.getName()}")
//            networkInterfaces.add(netFace.getDisplayName()+" "+netFace.getName())
            if ((netFace.getDisplayName()+" "+netFace.getName()).equalsIgnoreCase(configuracionInstance?.valor)) {
                Enumeration ae = netFace.getInetAddresses();
                while (ae.hasMoreElements()) {
                    InetAddress address = (InetAddress) ae.nextElement();
                    if (address.getHostAddress().size()>6){
                        if ("192.168.".equalsIgnoreCase(address.getHostAddress().substring(0,8))){
                            log.debug("IP del servidor: ${address.getHostAddress()}");
                            ips.add(address.getHostAddress())
                        }
                    }
                }
            }

        }

        configuracionInstance = Configuracion.findByNombre("IPServidor")
        if (!configuracionInstance) {
            configuracionInstance = new Configuracion()
            configuracionInstance.nombre = "IPServidor"
        }
        configuracionInstance.valor = ips

        if (!configuracionInstance.save(flush: true)) {
//            render(view: "ip", model: [configuracionInstance: configuracionInstance])
//            return
        }

        render(view:"index", model:[ ipsServidor: ips ])
    }

}
