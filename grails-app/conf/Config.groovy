import org.apache.log4j.Level

// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }
grails.war.destFile = "control.war"

grails.project.groupId = 'org.control' // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [
    all:           '*/*',
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    xml:           ['text/xml', 'application/xml'],
    pdf:            'application/pdf',
    rtf:            'application/rtf',
    excel:          'application/vnd.ms-excel',
    ods:            'application/vnd.oasis.opendocument.spreadsheet',

]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']
grails.resources.processing.enabled = true

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
// En el futuro probar:
//grails.views.default.codec = "html/utf8" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

grails.views.javascript.library="jquery"

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
}

// log4j configuration
log4j = {
    def catalinaBase = System.properties.getProperty('catalina.base')
    def logDirectory = !catalinaBase? '/tmp': "${catalinaBase}/logs"

    appenders {
        console     name:'stdout', layout: pattern(conversionPattern: '%d{yyyy-MM-dd HH:mm:ss} %-5p [%c{2}] %m%n')
        rollingFile name:'infoLog', file:"${logDirectory}/info.log", append: true, layout: pattern(conversionPattern: '%d{yyyy-MM-dd HH:mm:ss} %-5p [%c{2}] %m%n'), threshold: Level.INFO
        rollingFile name:'warnLog', file:"${logDirectory}/warn.log", append: true, layout: pattern(conversionPattern: '%d{yyyy-MM-dd HH:mm:ss} %-5p [%c{2}] %m%n'), threshold: Level.WARN
        rollingFile name:'errorLog', file:"${logDirectory}/error.log", append: true, layout: pattern(conversionPattern: '%d{yyyy-MM-dd HH:mm:ss} %-5p [%c{2}] %m%n'), threshold: Level.ERROR
        rollingFile name:'debugLog', file:"${logDirectory}/debug.log", append: true, layout: pattern(conversionPattern: '%d{yyyy-MM-dd HH:mm:ss} %-5p [%c{2}] %m%n'), threshold: Level.DEBUG
    }
    root {
//        info 'infoLog', 'errorLog', 'warnLog', 'debugLog', 'stdout'
//        info 'infoLog'
        error 'errorLog', 'stdout'
        warn 'warnLog', 'stdout'
//        debug 'debugLog'
    }

    info 'grails.app'
    error  'org.codehaus.groovy.grails.web.servlet',  //  controllers
            'org.codehaus.groovy.grails.web.pages', //  GSP
            'org.codehaus.groovy.grails.web.sitemesh', //  layouts
            'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
            'org.codehaus.groovy.grails.web.mapping', // URL mapping
            'org.codehaus.groovy.grails.commons', // core / classloading
            'org.codehaus.groovy.grails.plugins', // plugins
            'org.codehaus.groovy.grails.orm.hibernate', // hibernate integration
            'org.springframework',
            'org.hibernate',
            'net.sf.ehcache.hibernate',
            'grails.app.services.org.grails.plugin.resource',
            'grails.app.taglib.org.grails.plugin.resource',
            'grails.app.resourceMappers.org.grails.plugin.resource'

    warn   'org.mortbay.log'
    debug 'grails.app'
}

grails {
    mail {
        host = "cpanel78.gzo.com"
        port = 465
        username = "comunicaciones@spafitnessclub.cl"
        password = "comspa1234"
        props = ["mail.smtp.auth":"true",
                "mail.smtp.socketFactory.port":"465",
                "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
                "mail.smtp.socketFactory.fallback":"false"]
    }
}

company {
    name = "Spa Fitness Club Marcos Cafena."
    address = "5 Oriente Nº356"
    phone = "+56 032 2685340 / 2694084"
    city = "Viña del Mar"
    region = "V Región de Valparaíso"
    country = "Chile"
}

grails.config.defaults.locations = [KickstartResources]

// Added by the Spring Security Core plugin:
//grails.plugins.springsecurity.fii.rejectPublicInvocations = false
//grails.plugins.springsecurity.rejectIfNoRule = false
grails.plugins.springsecurity.securityConfigType = "Annotation"
grails.plugins.springsecurity.successHandler.defaultTargetUrl = '/home'
grails.plugins.springsecurity.userLookup.userDomainClassName = 'org.control.User'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'org.control.UserRole'
grails.plugins.springsecurity.authority.className = 'org.control.Role'
grails.plugins.springsecurity.controllerAnnotations.staticRules = [
//        '/**':                                ['permitAll'],
        '/**':                                ['ROLE_ADMIN'],
//	    '/home':                          ['permitAll'],
//        '/index':                         ['permitAll'],
//        '/index.gsp':                     ['permitAll'],
        '/assets/**':                     ['permitAll'],
        '/**/js/**':                      ['permitAll'],
        '/**/css/**':                     ['permitAll'],
        '/**/images/**':                  ['permitAll'],
        '/**/favicon.ico':                ['permitAll'],
        '/login/**':                      ['permitAll'],
        '/logout/**':                     ['permitAll']
//        '/monitoring/**':                 ['permitAll']
]
//ROLE_ADMIN

grails.plugins.springsecurity.failureHandler.exceptionMappings = [
//        'org.springframework.security.authentication.LockedException':             '/user/accountLocked',
//        'org.springframework.security.authentication.DisabledException':           '/user/accountDisabled',
//        'org.springframework.security.authentication.AccountExpiredException':     '/user/accountExpired',
        'org.springframework.security.authentication.CredentialsExpiredException':   '/userSocio/cambiarPassword'
]

