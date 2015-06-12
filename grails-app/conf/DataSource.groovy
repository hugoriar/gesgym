dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    dbCreate = "update"
//    logSql = true
//    username = "agrosmart"
    username = "control"
    password = "gym1234"
//    password = "Agro.Smart"
    dialect  = "org.hibernate.dialect.MySQL5UTF8InnoDBDialect"
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
//    format_sql = true
    generate_statistics=true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
environments {
    development {
        dataSource {
//            url = "jdbc:mysql://192.168.0.3:3306/control?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull"
            url = "jdbc:mysql://localhost:3306/control?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull"
            properties {
                /** The maximum number of active connections that can be allocated from
                 * this pool at the same time, or zero for no limit.
                 * Make it '-1' to prevent performance problems with idle connections
                 */
                maxActive = -1
                /**
                 * The maximum number of active connections that can remain idle in the
                 * pool, without extra ones being released, or zero for no limit.
                 */
                maxIdle = 8
                /**
                 * The minimum number of active connections that can remain idle in the
                 * pool, without extra ones being created, or 0 to create none.
                 */
                minIdle = 0
                /**
                 * The maximum number of milliseconds that the pool will wait (when there
                 * are no available connections) for a connection to be returned before
                 * throwing an exception, or -1 to wait indefinitely.
                 */
                maxWait = 180000

                minEvictableIdleTimeMillis = 1000 * 60 * 15
                timeBetweenEvictionRunsMillis = 1000 * 60 * 15
                numTestsPerEvictionRun = 3

                testOnBorrow = true
                testWhileIdle = true
                testOnReturn = false

                validationQuery = "select 1"
            }
        }
    }
    test {
        dataSource {
            url = "jdbc:mysql://localhost:3306/control?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull"
        }
    }
    production {
        dataSource {
            url = "jdbc:mysql://localhost:3306/control?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull"
            properties {
                /** The maximum number of active connections that can be allocated from
                 * this pool at the same time, or zero for no limit.
                 * Make it '-1' to prevent performance problems with idle connections
                 */
                maxActive = -1
                /**
                 * The maximum number of active connections that can remain idle in the
                 * pool, without extra ones being released, or zero for no limit.
                 */
                maxIdle = 8
                /**
                 * The minimum number of active connections that can remain idle in the
                 * pool, without extra ones being created, or 0 to create none.
                 */
                minIdle = 0
                /**
                 * The maximum number of milliseconds that the pool will wait (when there
                 * are no available connections) for a connection to be returned before
                 * throwing an exception, or -1 to wait indefinitely.
                 */
                maxWait = 180000

                minEvictableIdleTimeMillis = 1000 * 60 * 15
                timeBetweenEvictionRunsMillis = 1000 * 60 * 15
                numTestsPerEvictionRun = 3

                testOnBorrow = true
                testWhileIdle = true
                testOnReturn = false

                validationQuery = "select 1"
            }
        }
    }
}

/*
dataSource {
    pooled = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
            pooled = true
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
        }
    }
}
*/
