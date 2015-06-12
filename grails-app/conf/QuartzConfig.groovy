quartz {
    autoStartup = false
    jdbcStore = false
    waitForJobsToCompleteOnShutdown = true
    exposeSchedulerInRepository = false

    props {
        scheduler.skipUpdateCheck = true
    }
}

environments {
    test {
        quartz {
            autoStartup = false
        }
    }
    development {
        quartz {
            autoStartup = false
        }
    }
    production {
        quartz {
            autoStartup = true
        }
    }
}
