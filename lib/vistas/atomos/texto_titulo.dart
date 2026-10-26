import 'package:flutter/material.dart';

// Atomo: texto con estilo de titulo
class TextoTitulo extends StatelessWidget {
  final String texto;

  const TextoTitulo({
    super.key,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
