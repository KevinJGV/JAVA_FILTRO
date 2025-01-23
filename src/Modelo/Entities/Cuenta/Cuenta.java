package Modelo.Entities.Cuenta;

import Modelo.Entities.Cliente;

public abstract class Cuenta {
    private String numeroCuenta;
    private Cliente cliente;
    private double saldo;
    private boolean estado;

    public Cuenta(String numeroCuenta, Cliente cliente, double saldo) {
        this.numeroCuenta = numeroCuenta;
        this.cliente = cliente;
        this.saldo = saldo;
    }

    public abstract void depositar(double monto);
    public abstract boolean retirar(double monto);

    public String getNumeroCuenta() { return numeroCuenta; }
    public Cliente getCliente() { return cliente; }
    public double getSaldo() { return saldo; }
    public void setSaldo(double saldo) { this.saldo = saldo; }
    public void setEstado(boolean estado) {
        this.estado = estado;
    }
}