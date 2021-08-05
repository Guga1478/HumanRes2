package ar.com.java.humanRes.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Operaciones {
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/ingreso";
    private String user = "root";
    private String pass = "Amelia2015";

    public Operaciones() {
    }

    public int loguear(String us, String pasw) throws SQLException {
        int nivel = 0;
        String sql = "select nivel from login where usuario='" + us + "'and contra='" + pasw + "'";

        try {
            Class.forName(this.driver);
            Connection cnx = DriverManager.getConnection(this.url, this.user, this.pass);
            PreparedStatement ps = cnx.prepareStatement(sql);

            for(ResultSet rs = ps.executeQuery(); rs.next(); nivel = rs.getInt(1)) {
            }

            cnx.close();
        } catch (ClassNotFoundException | SQLException e) {
        }

        return nivel;
    }
}
