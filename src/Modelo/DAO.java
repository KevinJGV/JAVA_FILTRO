package Modelo;

import Utils.ConectorDB;

import java.sql.Connection;
import java.util.List;
// REQ: PATRON DAO GENÉRICA
public abstract class DAO<T, K> {
    protected static Connection conexionDB;

    protected DAO() {
        actualizarConexion();
    }

    public static void actualizarConexion() {
        conexionDB = ConectorDB.getConexion_DB();
    }

    protected abstract void resetList();
    protected abstract T findById(K id);
    protected abstract List<T> findAll();
    protected abstract void delete(K id);
}