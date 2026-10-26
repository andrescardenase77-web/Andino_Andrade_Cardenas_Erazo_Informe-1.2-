import 'package:flutter/material.dart';

// Atomo: campo de contrasena con icono para alternar visibilidad
class CampoContrasena extends StatelessWidget {
  final String etiqueta;
  final TextEditingController controller;
  final bool ocultar;
  final VoidCallback onToggle;

  const CampoContrasena({
    super.key,
    required this.etiqueta,
    required this.controller,
    required this.ocultar,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: ocultar,
      decoration: InputDecoration(
        labelText: etiqueta,
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(
            ocultar ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: onToggle,
        ),
      ),
    );
  }
}
