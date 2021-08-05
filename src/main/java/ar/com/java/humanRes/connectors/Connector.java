package ar.com.java.humanRes.connectors;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connector {
    private static String driver = "com.mysql.cj.jdbc.Driver";
    private static String url = "jdbc:mysql://localhost:3306/HumanResources";
    private static String user = "root";
    private static String pass = "Amelia2015";
    private static Connection conn = null;

    private Connector() {
    }

    public static synchronized Connection getConnection() {
        try {
            if (conn == null || conn.isClosed()) {
                Class.forName(driver);
                conn = DriverManager.getConnection(url, user, pass);
            }
        } catch (Exception var1) {
            System.out.println(var1);
        }

        return conn;
    }
}
