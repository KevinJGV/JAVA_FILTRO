package Modelo.Entities.Cuenta;

import Modelo.Entities.Cliente;

public class CuentaPersonal extends Cuenta {
    private static final double Limite = 10000000;

    public CuentaPersonal(String numeroCuenta, Cliente cliente, double saldo) {
        super(numeroCuenta, cliente, saldo);
    }

    @Override
    public void depositar(double monto) {
        if (getSaldo() + monto > Limite) {
            System.out.println("Depósito rechazado: excede el límite de saldo permitido.");
        } else {
            setSaldo(getSaldo() + monto);
            System.out.println("Depósito exitoso. Nuevo saldo: $" + getSaldo());
        }
    }

    @Override
    public boolean retirar(double monto) {
        if (getSaldo() >= monto) {
            setSaldo(getSaldo() - monto);
            System.out.println("Retiro exitoso. Nuevo saldo: $" + getSaldo());
            return true;
        } else {
            System.out.println("Retiro rechazado: saldo insuficiente.");
            return false;
        }
    }
}
