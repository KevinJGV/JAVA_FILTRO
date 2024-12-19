package Modelo.Cheque;

import Modelo.Cliente.Cliente;
import Modelo.Cuenta.Cuenta;

public class Cheque {
    private String id;
    private Cliente emisor;
    private String beneficiario;
    private Cuenta cuenta;

    private double monto;
    private String firmaDigital;
    private String prioridad;
    private boolean procesado;

    public Cheque(String id, Cliente emisor, String beneficiario, double monto, String firmaDigital, String prioridad) {
        this.id = id;
        this.emisor = emisor;
        this.beneficiario = beneficiario;
        this.monto = monto;
        this.firmaDigital = firmaDigital;
        this.prioridad = prioridad;
        this.procesado = false;
    }

    public String getId() { return id; }
    public Cliente getEmisor() { return emisor; }
    public String getBeneficiario() { return beneficiario; }
    public Cuenta getCuenta() {
        return cuenta;
    }
    public double getMonto() { return monto; }
    public String getFirmaDigital() { return firmaDigital; }
    public String getPrioridad() { return prioridad; }
    public boolean isProcesado() { return procesado; }
    public void setProcesado(boolean procesado) { this.procesado = procesado; }
}