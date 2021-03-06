grails.servlet.version = "2.5" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
//grails.project.war.file = "target/${appName}-${appVersion}.war"

// uncomment (and adjust settings) to fork the JVM to isolate classpaths
//grails.project.fork = [
//   run: [maxMemory:1024, minMemory:64, debug:false, maxPerm:256]
//]

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve
    legacyResolve true // whether to do a secondary resolve on plugin installation, not advised and here for backwards compatibility

    repositories {
        inherits true // Whether to inherit repository definitions from plugins

        grailsPlugins()
        grailsHome()
        grailsCentral()

        mavenLocal()
        mavenCentral()

        // uncomment these (or add new ones) to enable remote dependency resolution from public Maven repositories
        //mavenRepo "http://snapshots.repository.codehaus.org"
        //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
        mavenRepo "https://repo.grails.org/grails/plugins"

    }

    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes e.g.

        // runtime 'mysql:mysql-connector-java:5.1.22'
    }

    plugins {
        runtime ":hibernate:$grailsVersion"
    //    runtime ":jquery:1.8.3"
//        runtime ":resources:1.2.8"
        runtime ":resources:1.1.6"
        runtime ":database-migration:1.3.2"
//        runtime ":handlebars-resources:1.3.0"

        build ":tomcat:$grailsVersion"

        compile ':cache:1.0.1'
        compile ':tooltip:0.8'
        compile ':export:1.5'
        compile ":spring-security-core:1.2.7.3"
        compile ":spring-security-eventlog:0.3"
//        compile ":raphael:2.1.2"
//        compile ":twitter-typeahead:0.9.3.2"
//        compile ":grails-melody:1.55.0"
        /*runtime ':profiler:0.5'
        runtime ':miniprofiler:0.4.1'*/
//        compile ":kickstart-with-bootstrap:0.9.9.1"
        //compile ":spring-security-core:2.0-RC4"

    }
}
