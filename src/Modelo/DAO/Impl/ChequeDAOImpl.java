package Modelo.DAO.Impl;

import Modelo.DAO.ChequeDAO;
import Modelo.Entities.Cuenta.Cuenta;
import Modelo.Entities.Cheque;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ChequeDAOImpl extends ChequeDAO {
    private static ChequeDAOImpl instancia;

    private ChequeDAOImpl() {
        super();
    }

    public static ChequeDAOImpl instanciar() {
        if (instancia == null) {
            instancia = new ChequeDAOImpl(); // REQ: PATRON SINGLETON
        }
        return instancia;
    }


    public void create(Cuenta cuenta, String beneficiario, double monto, String prioridad) {
        if (cuenta.getCliente().getEstado().equals("Inactivo")) {
            System.out.println("El cliente está inactivo. No se puede emitir el cheque.");
            return;
        }

        if (cuenta.getSaldo() < monto) {
            System.out.println("Saldo insuficiente para emitir el cheque.");
            return;
        }

        String firmaDigital = generarFirmaDigital(cuenta.getNumeroCuenta(), monto);

        String Id_Cheque = generarIdCheque();

        Cheque cheque = new Cheque(Id_Cheque, cuenta.getCliente(), beneficiario, monto, firmaDigital, prioridad);


        try {
            PreparedStatement pst = conexionDB.prepareStatement(
                    "INSERT INTO cheques(numero_cheque,id_cuenta,beneficiario,monto,monto_letras,firma_digital, fecha_emision) VALUES (?,?,?,?,?,?,?,?);"
            );
            pst.setString(1, Id_Cheque);
            pst.setString(2, cuenta.getNumeroCuenta());
            pst.setString(3, beneficiario);
            pst.setDouble(4, monto);
            pst.setString(5, "TROCHENTOS");
            pst.setString(6, firmaDigital);

            pst.execute();
            System.out.println("\nCheque emitido con exito\n");
        } catch (SQLException e) {
            System.err.println("Error al ingresar el dato en la tabla cheques: " + e.getMessage());
        }
        cuenta.setSaldo(cuenta.getSaldo() - monto);
        System.out.println("Cheque emitido exitosamente:");
        imprimirCheque(cheque);
        resetList();
    }

    @Override
    public Cheque findById(Integer id) {
        return dataList.stream()
                .filter(cheque -> cheque.getId().equals(id))
                .findFirst()
                .orElse(null);
    }

    @Override
    public List<Cheque> findAll() {
        return new ArrayList<>(dataList);
    }


    @Override
    public void delete(Integer id) {
        dataList.removeIf(cheque -> cheque.getId().equals(id));
    }

    @Override
    public List<Cheque> findByCliente(String clienteId) {
        return dataList.stream()
                .filter(cheque -> cheque.getCuenta().getCliente().getId().equals(clienteId))
                .toList();
    }

    @Override
    public List<Cheque> findPendientes() {
        return dataList.stream()
                .filter(cheque -> !cheque.isProcesado())
                .toList();
    }

    private String generarIdCheque() {
        return "CH-" + (dataList.size() + 1);
    }

    private String generarFirmaDigital(String numeroCuenta, double monto) {
        return numeroCuenta.substring(0, 4) + "-" + String.valueOf(monto).replace(".", "");
    }

    private void imprimirCheque(Cheque cheque) {
        System.out.println("---------------------------------");
        System.out.println("BANCO UNIÓN S.A.");
        System.out.println("Cheque No: " + cheque.getId());
        System.out.println("Fecha: " + LocalDate.now());
        System.out.println("PÁGUESE A: " + cheque.getBeneficiario());
        System.out.println("LA SUMA DE: $" + cheque.getMonto());
        System.out.println("FIRMA DIGITAL: " + cheque.getFirmaDigital());
        System.out.println("Prioridad: " + cheque.getPrioridad());
        System.out.println("---------------------------------");
    }
}