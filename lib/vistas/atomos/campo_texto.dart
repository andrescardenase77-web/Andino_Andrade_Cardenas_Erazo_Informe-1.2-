import 'package:flutter/material.dart';

// Atomo: campo de texto simple para ingreso de usuario o correo
class CampoTexto extends StatelessWidget {
  final String etiqueta;
  final TextEditingController controller;
  final IconData? icono;
  final TextInputType tipoTeclado;

  const CampoTexto({
    super.key,
    required this.etiqueta,
    required this.controller,
    this.icono,
    this.tipoTeclado = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: tipoTeclado,
      decoration: InputDecoration(
        labelText: etiqueta,
        prefixIcon: icono != null ? Icon(icono) : null,
      ),
    );
  }
}
