import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors; // REQ: STREAM API

public class GestorCheques {
    private List<Cheque> cheques;

    public GestorCheques() {
        this.cheques = new ArrayList<>();
    }

    // Emitir cheque
    public void emitirCheque(Cuenta cuenta, String beneficiario, double monto, String prioridad) {

        Cheque cheque = new Cheque(generarIdCheque(), cuenta.getCliente(), beneficiario, monto, firmaDigital, prioridad);
        cheques.add(cheque);

        // Actualizar saldo de la cuenta
        cuenta.setSaldo(cuenta.getSaldo() - monto);
        System.out.println("Cheque emitido exitosamente:");
        imprimirCheque(cheque);
    }

    // Generar firma digital (simulación)
    private String generarFirmaDigital(String numeroCuenta, double monto) {
        return numeroCuenta.substring(0, 4) + "-" + String.valueOf(monto).replace(".", "");
    }

    // Generar ID único para cheque (simulación)
    private String generarIdCheque() {
        return "CH-" + (cheques.size() + 1);
    }

    // Imprimir cheque
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

    // Listar cheques por cliente
    public List<Cheque> listarChequesPorCliente(String clienteId) {
        return cheques.stream() // REQ: STREAM API
                .filter(cheque -> cheque.getEmisor().getId().equals(clienteId))
                .collect(Collectors.toList());
    }
}