package Modelo.DAO;

import Modelo.DAO.DAO;
import Modelo.Entities.Cheque;

import java.util.List;

public abstract class ChequeDAO extends DAO<Cheque, Integer> {
    protected abstract List<Cheque> findByCliente(String clienteId);
    protected abstract List<Cheque> findPendientes();
}