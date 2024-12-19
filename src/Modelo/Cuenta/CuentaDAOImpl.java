package Modelo.Cuenta;

import Modelo.Cheque.ChequeDAOImpl;
import Modelo.Cliente.Cliente;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CuentaDAOImpl extends CuentaDAO {

    private static CuentaDAOImpl instancia;

    private final List<Cuenta> cuentas = new ArrayList<>();

    private CuentaDAOImpl() {
        super();
    }

    public static CuentaDAOImpl instanciar() {
        if (instancia == null) {
            instancia = new CuentaDAOImpl(); // REQ: PATRON SINGLETON
        }
        return instancia;
    }

    @Override
    protected void resetList() {
        cuentas.clear();
    }

    public void create(Integer id, Integer tipo, Double saldo) {
        try {
            PreparedStatement pst = conexionDB.prepareStatement(
                    "INSERT INTO clientes(id_cliente,tipo,saldo) VALUES(?,?,?);"
            );
            pst.setInt(1, id);
            pst.setInt(2, tipo);
            pst.setDouble(3, saldo);

            pst.execute();
            System.out.println("\nCuenta guardada con exito\n");
        } catch (SQLException e) {
            System.err.println("Error al ingresar el dato en la tabla cuentas: " + e.getMessage());
        }
        resetList();
    }

    @Override
    public Cuenta findById(String id) {
        return cuentas.stream()
                .filter(cuenta -> cuenta.getNumeroCuenta().equals(id))
                .findFirst()
                .orElse(null);
    }

    @Override
    public List<Cuenta> findAll() {
        return new ArrayList<>(cuentas);
    }


    @Override
    public void delete(String id) {
        cuentas.removeIf(cuenta -> cuenta.getNumeroCuenta().equals(id));
    }

    @Override
    public List<Cuenta> findByCliente(String clienteId) {
        return cuentas.stream()
                .filter(cuenta -> cuenta.getCliente().getId().equals(clienteId))
                .toList();
    }

    @Override
    public void setEstadoCuentasPorCliente(String clienteId) {
        cuentas.stream()
                .filter(cuenta -> cuenta.getCliente().getId().equals(clienteId))
                .forEach(cuenta -> cuenta.setEstado(true)); // REQ: STREAM API
    }
}