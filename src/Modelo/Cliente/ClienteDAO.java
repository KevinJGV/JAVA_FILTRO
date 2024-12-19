package Modelo.Cliente;

import Modelo.DAO;

import java.util.List;

public abstract class ClienteDAO extends DAO<Cliente, String> {
    abstract List<Cliente> findByEstado(boolean activo);
}
