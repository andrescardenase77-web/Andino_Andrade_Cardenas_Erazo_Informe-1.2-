import 'package:flutter/material.dart';
import '../atomos/boton_primario.dart';
import '../atomos/boton_secundario.dart';

// Molecula: conjunto de botones para procesar o limpiar el formulario
class BotonesLogin extends StatelessWidget {
  final VoidCallback onIniciarSesion;
  final VoidCallback onLimpiar;

  const BotonesLogin({
    super.key,
    required this.onIniciarSesion,
    required this.onLimpiar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BotonPrimario(
          texto: 'Iniciar Sesión',
          onPressed: onIniciarSesion,
        ),
        const SizedBox(height: 10),
        BotonSecundario(
          texto: 'Limpiar',
          onPressed: onLimpiar,
        ),
      ],
    );
  }
}
