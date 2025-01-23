package Modelo.Threads;

import Modelo.Entities.Cheque;
import Utils.Validador;

import java.util.List;

public class ThreadChequesPendientes extends Thread {
    private List<Cheque> chequesPendientes;

    public ThreadChequesPendientes(List<Cheque> chequesPendientes) {
        this.chequesPendientes = chequesPendientes;
    }

    @Override
    public void run() {
        System.out.println("Procesando cheques pendientes...");
        for (Cheque cheque : chequesPendientes) {
            if (!cheque.isProcesado()) {
                if (Validador.validarClienteActivo(cheque.getEmisor())) {
                    cheque.setProcesado(true);
                    System.out.println("Cheque ID: " + cheque.getId() + " procesado con éxito.");
                } else {
                    System.out.println("Cheque ID: " + cheque.getId() + " rechazado: Cliente inactivo.");
                }
            }
        }
        System.out.println("Procesamiento completado.");
    }
}