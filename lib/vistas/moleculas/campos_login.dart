import 'package:flutter/material.dart';
import '../atomos/campo_texto.dart';
import '../atomos/campo_contrasena.dart';

// Molecula: conjunto de campos de entrada para el inicio de sesion
class CamposLogin extends StatelessWidget {
  final TextEditingController usuarioController;
  final TextEditingController contrasenaController;
  final bool ocultarContrasena;
  final VoidCallback onToggleOcultar;

  const CamposLogin({
    super.key,
    required this.usuarioController,
    required this.contrasenaController,
    required this.ocultarContrasena,
    required this.onToggleOcultar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CampoTexto(
          etiqueta: 'Usuario o correo',
          controller: usuarioController,
          icono: Icons.person_outline,
          tipoTeclado: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        CampoContrasena(
          etiqueta: 'Contraseña',
          controller: contrasenaController,
          ocultar: ocultarContrasena,
          onToggle: onToggleOcultar,
        ),
      ],
    );
  }
}
