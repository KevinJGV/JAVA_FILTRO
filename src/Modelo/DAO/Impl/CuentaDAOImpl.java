package Modelo.DAO.Impl;

import Modelo.DAO.CuentaDAO;
import Modelo.Entities.Cuenta.Cuenta;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CuentaDAOImpl extends CuentaDAO {

    private static CuentaDAOImpl instancia;

    private CuentaDAOImpl() {
        super();
    }

    public static CuentaDAOImpl instanciar() {
        if (instancia == null) {
            instancia = new CuentaDAOImpl(); // REQ: PATRON SINGLETON
        }
        return instancia;
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
        return dataList.stream()
                .filter(cuenta -> cuenta.getNumeroCuenta().equals(id))
                .findFirst()
                .orElse(null);
    }

    @Override
    public List<Cuenta> findAll() {
        return new ArrayList<>(dataList);
    }


    @Override
    public void delete(String id) {
        dataList.removeIf(cuenta -> cuenta.getNumeroCuenta().equals(id));
    }

    @Override
    public List<Cuenta> findByCliente(String clienteId) {
        return dataList.stream()
                .filter(cuenta -> cuenta.getCliente().getId().equals(clienteId))
                .toList();
    }

    @Override
    public void setEstadoCuentasPorCliente(String clienteId) {
        dataList.stream()
                .filter(cuenta -> cuenta.getCliente().getId().equals(clienteId))
                .forEach(cuenta -> cuenta.setEstado(true)); // REQ: STREAM API
    }
}