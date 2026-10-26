import 'package:flutter/material.dart';
import '../moleculas/encabezado_login.dart';
import '../moleculas/campos_login.dart';
import '../moleculas/botones_login.dart';

// Organismo: tarjeta completa que reune el encabezado, campos y botones
class FormularioLogin extends StatelessWidget {
  final TextEditingController usuarioController;
  final TextEditingController contrasenaController;
  final bool ocultarContrasena;
  final VoidCallback onToggleOcultar;
  final VoidCallback onIniciarSesion;
  final VoidCallback onLimpiar;

  const FormularioLogin({
    super.key,
    required this.usuarioController,
    required this.contrasenaController,
    required this.ocultarContrasena,
    required this.onToggleOcultar,
    required this.onIniciarSesion,
    required this.onLimpiar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const EncabezadoLogin(),
            const SizedBox(height: 24),
            CamposLogin(
              usuarioController: usuarioController,
              contrasenaController: contrasenaController,
              ocultarContrasena: ocultarContrasena,
              onToggleOcultar: onToggleOcultar,
            ),
            const SizedBox(height: 24),
            BotonesLogin(
              onIniciarSesion: onIniciarSesion,
              onLimpiar: onLimpiar,
            ),
          ],
        ),
      ),
    );
  }
}
