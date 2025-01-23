package Modelo.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConectorDB {
    protected static ConectorDB instancia;
    protected static Connection conexion_DB;

    private ConectorDB(String HOST, String USUARIO, String CONTRA) {
        try (
                Connection conexion = DriverManager.getConnection(HOST, USUARIO, CONTRA);
        ) {
            conexion_DB = conexion;
            System.out.println("Conectado a BancoUnion\nCargando Sistema...");
        } catch (SQLException e) {
            System.err.println("Error al conectarse con BancoUnion: " + e.getMessage());
        }
    }

    public static Connection getConexion_DB() {
        return conexion_DB;
    }

    public static ConectorDB conectar(String HOST, String USUARIO, String CONTRA) {
        if (instancia == null) {
            instancia = new ConectorDB(HOST, USUARIO, CONTRA);
        }
        return instancia;
    }
}