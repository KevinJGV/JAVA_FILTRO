package Modelo.Cheque;

import Modelo.DAO;

import java.util.List;

public abstract class ChequeDAO extends DAO<Cheque, Integer> {
    protected abstract List<Cheque> findByCliente(String clienteId);
    protected abstract List<Cheque> findPendientes();
}