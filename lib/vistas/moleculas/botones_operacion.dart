import 'package:flutter/material.dart';
import '../atomos/boton_primario.dart';
import '../atomos/boton_secundario.dart';

// Molecula: botones de accion para procesar el calculo o limpiar el formulario
class BotonesOperacion extends StatelessWidget {
  final VoidCallback onCalcular;
  final VoidCallback onLimpiar;

  const BotonesOperacion({
    super.key,
    required this.onCalcular,
    required this.onLimpiar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BotonPrimario(
          texto: 'Calcular Valor a Pagar',
          onPressed: onCalcular,
        ),
        const SizedBox(height: 10),
        BotonSecundario(
          texto: 'Limpiar Campos',
          onPressed: onLimpiar,
        ),
      ],
    );
  }
}
