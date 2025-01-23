package View;

import Modelo.Entities.Cheque;
import Modelo.DAO.Impl.ChequeDAOImpl;
import Modelo.Entities.Cliente;
import Modelo.DAO.Impl.ClienteDAOImpl;
import Modelo.Entities.Cuenta.Cuenta;
import Modelo.DAO.Impl.CuentaDAOImpl;
import Modelo.Threads.ThreadChequesPendientes;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Collectors;

public class Menu {
    private static ClienteDAOImpl gestorClientes = ClienteDAOImpl.instanciar();
    private static CuentaDAOImpl gestorCuentas = CuentaDAOImpl.instanciar();
    private static ChequeDAOImpl gestorCheques = ChequeDAOImpl.instanciar();

    public void ejecutar() {

        Scanner scanner = new Scanner(System.in);
        boolean salir = false;

        while (!salir) {
            System.out.println("\n--- BANCO UNIÓN ---");
            System.out.println("1. Registrar cliente");
            System.out.println("2. Crear cuenta");
            System.out.println("3. Emitir cheque");
            System.out.println("4. Listar cheques de un cliente");
            System.out.println("5. Procesar cheques pendientes");
            System.out.println("6. Bloquear cuentas de cliente inactivo");
            System.out.println("7. Salir");
            System.out.print("Seleccione una opción: ");

            int opcion = scanner.nextInt();
            scanner.nextLine();

            switch (opcion) {
                case 1 -> registrarCliente(scanner);
                case 2 -> crearCuenta(scanner);
                case 3 -> emitirCheque(scanner);
                case 4 -> listarChequesDeCliente(scanner);
                case 5 -> procesarChequesPendientes();
                case 6 -> bloquearCuentasDeCliente(scanner);
                case 7 -> {
                    System.out.println("Saliendo del sistema...");
                    salir = true;
                }
                default -> System.out.println("Opción inválida. Intente de nuevo.");
            }
        }

        scanner.close();
    }

    private static void registrarCliente(Scanner scanner) {
        System.out.print("Ingrese el ID del cliente: ");
        String id = scanner.nextLine();

        System.out.print("Ingrese el nombre del cliente: ");
        String nombre = scanner.nextLine();

        System.out.print("Ingrese el apellido del cliente: ");
        String apellido = scanner.nextLine();

        System.out.print("Ingrese la dirección del cliente: ");
        String direccion = scanner.nextLine();

        System.out.print("Ingrese el teléfono del cliente: ");
        String telefono = scanner.nextLine();

        System.out.print("Ingrese el correo del cliente: ");
        String correo = scanner.nextLine();

        gestorClientes.create(id,nombre,apellido,direccion,telefono,correo);
    }

    private static void crearCuenta(Scanner scanner) {
        System.out.print("Ingrese el ID del cliente: ");
        int clienteId = scanner.nextInt();

        Cliente cliente = gestorClientes.findById(String.valueOf(clienteId));
        if (cliente == null || !cliente.isEstado()) {
            System.out.println("Cliente no encontrado o inactivo.");
            return;
        }

        System.out.print("Seleccione el tipo de cuenta (1. Personal, 2. Empresarial): ");
        int tipoCuenta = scanner.nextInt();
        scanner.nextLine(); 

        System.out.print("Ingrese el saldo inicial de la cuenta: ");
        double saldo = scanner.nextDouble();
        scanner.nextLine();

        gestorCuentas.create(clienteId,tipoCuenta,saldo);
    }

    private static void emitirCheque(Scanner scanner) {
        System.out.print("Ingrese el ID del cliente: ");
        String clienteId = scanner.nextLine();

        List<Cuenta> cuentas = gestorCuentas.findByCliente(clienteId);
        if (cuentas.isEmpty()) {
            System.out.println("No se encontraron cuentas asociadas al cliente.");
            return;
        }

        System.out.println("Cuentas disponibles:");
        for (int i = 0; i < cuentas.size(); i++) {
            Cuenta cuenta = cuentas.get(i);
            System.out.println((i + 1) + ". Número de cuenta: " + cuenta.getNumeroCuenta() + ", Saldo: $" + cuenta.getSaldo());
        }

        System.out.print("Seleccione una cuenta: ");
        int seleccionCuenta = scanner.nextInt();
        scanner.nextLine(); 

        if (seleccionCuenta < 1 || seleccionCuenta > cuentas.size()) {
            System.out.println("Selección inválida.");
            return;
        }

        Cuenta cuentaSeleccionada = cuentas.get(seleccionCuenta - 1);

        System.out.print("Ingrese el nombre del beneficiario: ");
        String beneficiario = scanner.nextLine();

        System.out.print("Ingrese el monto del cheque: ");
        double monto = scanner.nextDouble();
        scanner.nextLine(); 

        System.out.print("Seleccione la prioridad del cheque (Alta, Media, Baja): ");
        String prioridad = scanner.nextLine();

        gestorCheques.emitirCheque(cuentaSeleccionada, beneficiario, monto, prioridad);
    }

    private static void listarChequesDeCliente(Scanner scanner) {
        System.out.print("Ingrese el ID del cliente: ");
        String clienteId = scanner.nextLine();

        List<Cheque> cheques = gestorCheques.listarChequesPorCliente(clienteId);
        if (cheques.isEmpty()) {
            System.out.println("No se encontraron cheques asociados al cliente.");
        } else {
            System.out.println("Cheques emitidos por el cliente:");
            cheques.forEach(System.out::println); // REQ: FUNCION LAMBDA
        }
    }

    private static void procesarChequesPendientes() {
        List<Cheque> chequesPendientes = gestorCheques.listarChequesPorCliente(null).stream() // REQ: STREAM API
                .filter(cheque -> !cheque.isProcesado())
                .collect(Collectors.toList());

        ThreadChequesPendientes procesador = new ThreadChequesPendientes(chequesPendientes);
        procesador.start();
    }

    private static void bloquearCuentasDeCliente(Scanner scanner) {
        System.out.print("Ingrese el ID del cliente: ");
        String clienteId = scanner.nextLine();

        gestorClientes.cambiarEstadoCliente(clienteId, false);
        gestorCuentas.bloquearCuentasPorCliente(clienteId);
    }

    private static String generarNumeroCuenta() {
        return "CUENTA-" + System.currentTimeMillis(); 
    }
}