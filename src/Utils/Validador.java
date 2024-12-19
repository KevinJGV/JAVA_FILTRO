package Utils;

import Modelo.Cliente.Cliente;
import Modelo.Cuenta.Cuenta;

public class Validador {
    public static boolean validarSaldoSuficiente(Cuenta cuenta, double monto) {
        return cuenta.getSaldo() >= monto;
    }

    public static boolean validarClienteActivo(Cliente cliente) {
        return cliente.isEstado();
    }
}