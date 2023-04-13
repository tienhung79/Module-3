package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Repository {


    private static String jdbcURL = "jdbc:mysql://localhost:3306/BDName";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "bebong1508";
    private static Connection connection;

    public static Connection getConnection() {
        if (connection == null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        return connection;
    }
}

