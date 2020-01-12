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
//            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
//            url = "jdbc:mysql://192.168.1.51:3306/control?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull"
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
//            dbCreate = "update"
//            url = "jdbc:mysql://50.62.188.65:3306/control_test?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull"
            url = "jdbc:mysql://localhost:3306/control?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull"
            properties {
                // See http://grails.org/doc/latest/guide/conf.html#dataSource for documentation
                jmxEnabled = true
                initialSize = 5
                maxActive = 50
                minIdle = 5
                maxIdle = 25
                maxWait = 10000
                maxAge = 10 * 60000
                timeBetweenEvictionRunsMillis = 5000
                minEvictableIdleTimeMillis = 60000
                validationQuery = "SELECT 1"
                validationQueryTimeout = 3
                validationInterval = 15000
                testOnBorrow = true
                testWhileIdle = true
                testOnReturn = false
                jdbcInterceptors = "ConnectionState"
                defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_COMMITTED
            }
        }
    }
    production {
        dataSource {
//            dbCreate = "update"
            url = "jdbc:mysql://50.62.188.65:3306/control?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull"
            properties {
                // See http://grails.org/doc/latest/guide/conf.html#dataSource for documentation
                jmxEnabled = true
                initialSize = 5
                maxActive = 50
                minIdle = 5
                maxIdle = 25
                maxWait = 10000
                maxAge = 10 * 60000
                timeBetweenEvictionRunsMillis = 5000
                minEvictableIdleTimeMillis = 60000
                validationQuery = "SELECT 1"
                validationQueryTimeout = 3
                validationInterval = 15000
                testOnBorrow = true
                testWhileIdle = true
                testOnReturn = false
                jdbcInterceptors = "ConnectionState"
                defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_COMMITTED
            }
        }
    }
}
