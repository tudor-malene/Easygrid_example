grails.servlet.version = "3.0" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.work.dir = "target/work"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
//grails.project.war.file = "target/${appName}-${appVersion}.war"

grails.project.fork = false

grails.project.dependency.resolver = "maven" // or ivy
// Useful to test plugins you are developing.
//grails.plugin.location.easygrid ="../Easygrid"
//grails.plugin.location.ajaxify ="../ajaxify-tag"

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
        mavenRepo "http://repo.spring.io/milestone/"
    }
    dependencies {

        // runtime 'mysql:mysql-connector-java:5.1.16'
        compile('com.google.visualization:visualization-datasource:1.1.1') {
            exclude (group: 'commons-logging', name: 'commons-logging')
            exclude (group: 'commons-lang', name: 'commons-lang')
        }
    }

    plugins {
        build ":tomcat:7.0.52.1"

        // plugins for the compile step
        compile ":scaffolding:2.0.2"
        compile ':cache:1.1.1'

        // plugins needed at runtime but not for compilation
        runtime ":hibernate:3.6.10.9" // or ":hibernate4:4.3.4"
        runtime ":database-migration:1.3.8"
        runtime ":jquery:1.11.0.2"
        runtime ":resources:1.2.7"

//        compile ":spring-security-core:1.2.7.3"
        compile ':spring-security-core:2.0-RC2'
        runtime(':google-visualization:0.6.2')
//
//        //only for 2.2.0
        compile ":easygrid:1.5.0"

        compile ":markdown:1.1.1"
    }
} 