import Utils.ConectorDB;

import java.sql.Connection;

public class Main {
    protected static Connection conexion_DB;
    protected static BancoUnionApp app; // REQ: PATRON PROXY

    public static void main(String[] args) {
        ConectorDB.conectar("jdbc:mysql://localhost:3306/banco_union","campus2023","campus2023");
        if ((conexion_DB = ConectorDB.getConexion_DB()) != null) {
            app = new BancoUnionApp();
            app.ejecutar();
           return;
        }
        System.err.println("Conexion a BancoUnion Fallida. Revise los parametros de conexion.");
    }
}
