
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Database {
    public static Connection getConnection(){
        Connection conn=null;
        try {
            //loading driver
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            //creating connection string
            conn=DriverManager.getConnection("jdbc:derby://localhost:1527/eChannelNew", "app", "app");
            return conn;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
            
       return conn;
    }
            
}
