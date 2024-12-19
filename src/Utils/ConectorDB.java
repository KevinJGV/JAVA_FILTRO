package Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConectorDB {
    protected static Connection conexion_DB;

    public static Connection getConexion_DB() {
        return conexion_DB;
    }

    public static void conectar(String HOST, String USUARIO, String CONTRA) {
        try (
                Connection conexion = DriverManager.getConnection(HOST, USUARIO, CONTRA);
        ) {
            conexion_DB = conexion;
            System.out.println("Conectado a BancoUnion\nCargando Sistema...");
        } catch (SQLException e) {
            System.err.println("Error al conectarse con BancoUnion: " + e.getMessage());
        }
    }
}