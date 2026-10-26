import 'package:flutter/material.dart';
import '../../modelos/consumo_modelo.dart';
import '../organismos/tarjeta_detalle_pago.dart';

// Pantalla 3: Muestra el detalle completo de pago y resultado de la consulta
class DetallePagoPantalla extends StatelessWidget {
  const DetallePagoPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    final modelo = ModalRoute.of(context)?.settings.arguments as ConsumoModelo?;

    if (modelo == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Detalle de Pago'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('No se encontraron datos del cálculo.'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Volver'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de Pago'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: TarjetaDetallePago(
          modelo: modelo,
          onNuevaConsulta: () {
            Navigator.pop(context);
          },
          onCerrarSesion: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/',
              (route) => false,
            );
          },
        ),
      ),
    );
  }
}
