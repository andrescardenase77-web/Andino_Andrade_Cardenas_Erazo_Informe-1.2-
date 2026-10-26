import 'package:flutter/material.dart';
import '../../controladores/consumo_controlador.dart';
import '../organismos/formulario_consumo.dart';

// Pantalla 2: Formulario principal para registrar el consumo de agua
class RegistroConsumoPantalla extends StatefulWidget {
  const RegistroConsumoPantalla({super.key});

  @override
  State<RegistroConsumoPantalla> createState() => _RegistroConsumoPantallaState();
}

class _RegistroConsumoPantallaState extends State<RegistroConsumoPantalla> {
  final TextEditingController cuentaController = TextEditingController();
  final TextEditingController clienteController = TextEditingController();
  final TextEditingController lecturaAnteriorController = TextEditingController();
  final TextEditingController lecturaActualController = TextEditingController();

  final ConsumoControlador controlador = ConsumoControlador();
  String tipoConsumidor = 'Residencial';
  bool fueInicializado = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!fueInicializado) {
      final argumentos = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      if (argumentos != null && argumentos['nombre'] != null) {
        clienteController.text = argumentos['nombre'].toString();
      }
      fueInicializado = true;
    }
  }

  @override
  void dispose() {
    cuentaController.dispose();
    clienteController.dispose();
    lecturaAnteriorController.dispose();
    lecturaActualController.dispose();
    super.dispose();
  }

  // Metodo para limpiar los datos del formulario
  void limpiar() {
    cuentaController.clear();
    lecturaAnteriorController.clear();
    lecturaActualController.clear();
    setState(() {
      tipoConsumidor = 'Residencial';
    });
  }

  // Metodo para validar los campos y calcular el valor a pagar
  void calcular() {
    final String cuenta = cuentaController.text.trim();
    final String cliente = clienteController.text.trim();
    final String anteriorTexto = lecturaAnteriorController.text.trim();
    final String actualTexto = lecturaActualController.text.trim();

    // Validacion de campos vacios
    if (cuenta.isEmpty || cliente.isEmpty || anteriorTexto.isEmpty || actualTexto.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, complete todos los campos obligatorios.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // Conversion numerica y validacion
    final double? anterior = double.tryParse(anteriorTexto);
    final double? actual = double.tryParse(actualTexto);

    if (anterior == null || actual == null || anterior < 0 || actual < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ingrese lecturas numéricas válidas y positivas.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // Validacion de coherencia de lecturas
    final String? errorLecturas = controlador.validarLecturas(anterior, actual);
    if (errorLecturas != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorLecturas),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    // Calculo mediante el controlador
    final resultado = controlador.calcularPago(
      numeroCuenta: cuenta,
      nombreCliente: cliente,
      lecturaAnterior: anterior,
      lecturaActual: actual,
      tipoConsumidor: tipoConsumidor,
    );

    // Navegacion hacia la pantalla de detalle de pago
    Navigator.pushNamed(
      context,
      '/detalle',
      arguments: resultado,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Consumo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Cerrar sesión',
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: FormularioConsumo(
          cuentaController: cuentaController,
          clienteController: clienteController,
          lecturaAnteriorController: lecturaAnteriorController,
          lecturaActualController: lecturaActualController,
          tipoConsumidor: tipoConsumidor,
          onTipoConsumidorChanged: (nuevoValor) {
            if (nuevoValor != null) {
              setState(() {
                tipoConsumidor = nuevoValor;
              });
            }
          },
          onCalcular: calcular,
          onLimpiar: limpiar,
        ),
      ),
    );
  }
}
