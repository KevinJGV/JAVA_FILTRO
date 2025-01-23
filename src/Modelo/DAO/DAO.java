package Modelo.DAO;

import Modelo.Database.ConectorDB;
import Modelo.Entities.Cuenta.Cuenta;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
// REQ: PATRON Modelo.DAO.DAO GENÉRICA
public abstract class DAO<T, K> {
    protected static Connection conexionDB;
    protected final List<T> dataList = new ArrayList<>();


    protected DAO() {
        actualizarConexion();
    }

    public static void actualizarConexion() {
        conexionDB = ConectorDB.getConexion_DB();
    }

    protected void resetList() {
        dataList.clear();
    };
    protected abstract T findById(K id);
    protected abstract List<T> findAll();
    protected abstract void delete(K id);
}