package Modelo.Entities.Cuenta;

import Modelo.Entities.Cliente;

public class CuentaEmpresarial extends Cuenta {
    public CuentaEmpresarial(String numeroCuenta, Cliente cliente, double saldo) {
        super(numeroCuenta, cliente, saldo);
    }

    @Override
    public void depositar(double monto) {
        setSaldo(getSaldo() + monto);
        System.out.println("Depósito exitoso. Nuevo saldo: $" + getSaldo());
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