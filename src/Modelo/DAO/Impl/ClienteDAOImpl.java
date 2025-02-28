package Modelo.DAO.Impl;

import Modelo.DAO.ClienteDAO;
import Modelo.Entities.Cliente;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class ClienteDAOImpl extends ClienteDAO {
    private static ClienteDAOImpl instancia;

    private ClienteDAOImpl() {
        super();
    }

    public static ClienteDAOImpl instanciar() {
        if (instancia == null) {
            instancia = new ClienteDAOImpl(); // REQ: PATRON SINGLETON
        }
        return instancia;
    }

    public void create(String id,String nombre,String apellido, String direccion,String telefono,String correo) {
        try {
            PreparedStatement pst = conexionDB.prepareStatement(
                    "INSERT INTO clientes(identificacion,nombre,apellido,direccion,telefono,correo) VALUES(?,?,?,?,?,?);"
            );
            pst.setString(1, id);
            pst.setString(2, nombre);
            pst.setString(3, apellido);
            pst.setString(4, direccion);
            pst.setString(5, telefono);
            pst.setString(6, correo);

            pst.execute();
            System.out.println("\nCliente guardado con exito\n");
        } catch (SQLException e) {
            System.err.println("Error al ingresar el dato en la tabla clientes: " + e.getMessage());
        }
        resetList();
    }

    @Override
    public Cliente findById(String id) {
        return dataList.stream() // REQ: STREAM API
                .filter(cliente -> cliente.getId().equals(id))
                .findFirst()
                .orElse(null);
    }

    @Override
    public List<Cliente> findAll() {
        if (dataList.size() < 1) {
            try {
                ResultSet res = conexionDB.createStatement().executeQuery("SELECT identificacion, nombre, apellido, direccion, telefono, correo, estado, fecha_registro, ultima_actividad FROM clientes;");
                while (res.next()) {
                    dataList.add(
                            new Cliente(
                                    res.getString("identificacion"),
                                    res.getString("nombre"),
                                    res.getString("apellido"),
                                    res.getString("direccion"),
                                    res.getString("telefono"),
                                    res.getString("correo"),
                                    res.getString("estado"),
                                    res.getTimestamp("fecha_registro"),
                                    res.getTimestamp("ultima_actividad")
                            )
                    );
                }
            } catch (SQLException e) {
                System.err.println("Error al recuperar los datos de la tabla controlaccesospersonal: " + e.getMessage());
            }
        }
        return dataList;
    }

    @Override
    public void delete(String id) {
        dataList.removeIf(cliente -> cliente.getId().equals(id)); // REQ: FUNCION LAMBDA
    }

    @Override
    public List<Cliente> findByEstado(String activo) {
        return dataList.stream() // REQ: STREAM API
                .filter(cliente -> cliente.getEstado().equals(activo))
                .toList();
    }
}