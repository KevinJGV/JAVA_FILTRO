package Modelo.DAO;

import Modelo.Entities.Cliente;

import java.util.List;

public abstract class ClienteDAO extends DAO<Cliente, String> {
    protected abstract List<T> findByEstado(String activo);
}
