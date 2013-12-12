package org.hibernate.dialect;
/**
 * Sets the default charset to UTF-8.
 */
/*public class MySQLUTF8InnoDBDialect extends MySQLInnoDBDialect {
    @Override
    public String getTableTypeString() {
        return " ENGINE=InnoDB DEFAULT CHARSET=utf8";
    }


}*/

/**
 * Extends MySQL5InnoDBDialect and sets the default charset to be UTF-8
 * @author Sorin Postelnicu
 * @since Aug 13, 2007
 */
public class MySQL5UTF8InnoDBDialect extends MySQL5InnoDBDialect {
    public String getTableTypeString() {
        return " ENGINE=InnoDB DEFAULT CHARSET=utf8";
    }
}