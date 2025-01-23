package Modelo.DAO;

import Modelo.DAO.DAO;
import Modelo.Entities.Cuenta.Cuenta;

import java.util.List;

public abstract class CuentaDAO extends DAO<Cuenta, String> {
    protected abstract List<Cuenta> findByCliente(String clienteId);
    protected abstract void setEstadoCuentasPorCliente(String clienteId);
}