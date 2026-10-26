import 'package:flutter/material.dart';

// Atomo: boton principal con estilo elevado
class BotonPrimario extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;

  const BotonPrimario({
    super.key,
    required this.texto,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(texto),
    );
  }
}
