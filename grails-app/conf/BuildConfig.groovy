grails.servlet.version = "2.5" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
//grails.project.war.file = "target/${appName}-${appVersion}.war"

// Useful to test plugins you are developing.
//grails.plugin.location.easygrid ="../Easygrid"

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // uncomment to disable ehcache
        // excludes 'ehcache'
    }
    log "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve

    repositories {
        inherits true // Whether to inherit repository definitions from plugins
        grailsPlugins()
        grailsHome()
        grailsCentral()
        mavenCentral()
    }
    dependencies {

        // runtime 'mysql:mysql-connector-java:5.1.16'
        compile('com.google.visualization:visualization-datasource:1.1.1') {
            exclude (group: 'commons-logging', name: 'commons-logging')
            exclude (group: 'commons-lang', name: 'commons-lang')
        }
    }

    plugins {
        runtime ":hibernate:$grailsVersion"

        compile ":spring-security-core:1.2.7.3"
        compile ":webxml:1.4.1"
        runtime ":jquery:1.8.0", ":jquery-ui:1.8.24"
        runtime(':google-visualization:0.5.6')
//
//        //only for 2.2.0
        runtime ":resources:1.2"
        build ":tomcat:$grailsVersion"
        compile ":easygrid:1.4.1"
    }
} 