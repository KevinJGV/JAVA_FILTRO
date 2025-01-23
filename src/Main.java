import Modelo.Database.ConectorDB;
import View.Menu;

public class Main {
    protected static ConectorDB conexion_DB;
    protected static Menu app; // REQ: PATRON PROXY

    public static void main(String[] args) {
        if ((conexion_DB = ConectorDB.conectar("jdbc:mysql://localhost:3306/banco_union","campus2023","campus2023")) != null) {
            app = new Menu();
            app.ejecutar();
        } else {
            System.err.println("Conexion a BancoUnion Fallida. Revise los parametros de conexion.");
        }
    }
}
