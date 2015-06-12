modules = {
    application {
        dependsOn "jquery, jquery-ui"
        /*resource url:'js/bootstrap-notify.js'
        resource url:'js/bootstrap-notify.min.js'
        resource url:'js/application.js'*/
        resource url: 'css/kickstart.css'
    }

    jquery {
        resource url: 'js/jquery-1.11.2.js', disposition: 'head'
    }

    'jquery-ui' {
        dependsOn "jquery"
        resource url: 'js/jquery-ui.js', disposition: 'head'
        resource url: 'css/jquery-ui.css'
        resource url: 'css/jquery-ui.theme.css'
        resource url: 'css/jquery-ui.structure.css'
    }

    lightbox {
        dependsOn "jquery"
        resource url: 'js/lightbox.js', disposition: 'head'
        resource url: 'css/lightbox.css'
    }

    date {
        resource url: 'js/date.js', disposition: 'head'
    }

    'datepicker' {
        dependsOn "jquery, jquery-ui, date"
        resource url: '/datepicker/css/bootstrap-datepicker.css'
        resource url: '/datepicker/js/bootstrap-datepicker.js', disposition: 'head'
        resource url: '/datepicker/locales/bootstrap-datepicker.es.min.js', disposition: 'head'
    }

    'datetimepicker-bundle' {
        dependsOn "jquery, jquery-ui, date"
        resource url: 'css/jquery-ui-timepicker-addon.css'
        resource url: 'js/jquery-ui-timepicker-addon.js', disposition: 'head'
        resource url: 'js/jquery-ui-timepicker-es.js', disposition: 'head'
        resource url: 'js/common-datetimepicker.js'
    }

    'datetimepicker-futuro' {
        dependsOn "datetimepicker-bundle"
        resource url: 'js/common-datetimepicker-futuro.js'
    }

    'datetimepicker-pasado' {
        dependsOn "datetimepicker-bundle"
        resource url: 'js/common-datetimepicker-pasado.js'
    }

    'ajax-select-user' {
        dependsOn "jquery, jquery-ui"
        resource url: 'js/ajax-select-user.js'
    }

    'datetimepicker-full' {
        dependsOn "datetimepicker-bundle"
        resource url: 'js/common-datetimepicker-full.js'
    }

    timeago {
        dependsOn "jquery, jquery-ui"
        resource url: 'js/jquery.timeago.js'
    }

    fancybox {
        dependsOn "jquery"
        resource url: 'js/jquery.fancybox.js'
        resource url: 'css/jquery.fancybox.css'
    }

    highcharts {
        dependsOn "jquery, jquery-ui"
        resource url: 'js/hs/highstock.js', disposition: 'head'
//        resource url: 'js/hs/highcharts.js', disposition: 'head'
        resource url: 'js/hs/highcharts-3d.js', disposition: 'head'
        resource url: 'js/hs/value-in-legend.js'
        resource url: 'js/hs/modules/exporting.js'
//        resource url: 'js/hs/highchartsInicio.js'
    }

    colorPicker {
        resource url: 'js/jquery.minicolors.js', disposition: 'head'
        resource url: 'css/jquery.minicolors.css'
    }

    // Utility resources (must be loaded after bootstrap skin resources)
    // Duplication necessary as switching skins causes new skin to be loaded after utilities!
/*    'bootstrap_utils' {
        dependsOn 'jquery, bootstrap, font-awesome'
        resource url: [dir: 'js',			file: 'jquery-']
        // resource url: [dir: 'datepicker/js',			file: 'bootstrap-datepicker.js']
        resource url: [dir: 'kickstart/js',				file: 'kickstart.js']
        resource url: [dir: 'kickstart/js',				file: 'checkboxes.js']
        //	resource url: [dir: 'datepicker/css',			file: 'datepicker.css']
        resource url: [dir: 'kickstart/css',			file: 'docs.css']
        resource url: [dir: 'kickstart/css',			file: 'kickstart.css']
        resource url: "less/dummy.css" // empty css: see https://github.com/paulfairless/grails-lesscss-resources/issues/25
    }*/
}