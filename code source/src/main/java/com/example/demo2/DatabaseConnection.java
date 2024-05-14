package com.example.demo2;
import java.sql.Connection;
import java.sql.DriverManager;

class DatabaseConnection {
    public static Connection dbConnect() {
        return null;
    }

    public Connection getConnection(String dbname, String user, String pass) {
        Connection conn = null;
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/" + dbname, user, pass);

        } catch (Exception e) {
            System.out.println("Connection Pb");
            System.out.println(e);
        }
        return conn;
    }
}
