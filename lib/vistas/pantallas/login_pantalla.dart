import 'package:flutter/material.dart';
import '../../controladores/login_controlador.dart';
import '../organismos/formulario_login.dart';

class LoginPantalla extends StatefulWidget {
  const LoginPantalla({super.key});

  @override
  State<LoginPantalla> createState() => _LoginPantallaState();
}

class _LoginPantallaState extends State<LoginPantalla> {
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  final LoginControlador controlador = LoginControlador();
  bool ocultarContrasena = true;

  @override
  void dispose() {
    usuarioController.dispose();
    contrasenaController.dispose();
    super.dispose();
  }

  void alternarVisibilidad() {
    setState(() {
      ocultarContrasena = !ocultarContrasena;
    });
  }

  void limpiarCampos() {
    usuarioController.clear();
    contrasenaController.clear();
    setState(() {
      ocultarContrasena = true;
    });
  }

  void iniciarSesion() {
    final String usuario = usuarioController.text.trim();
    final String contrasena = contrasenaController.text.trim();

    if (usuario.isEmpty || contrasena.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, ingrese todos los campos.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final bool esValido = controlador.autenticar(usuario, contrasena);

    if (!esValido) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuario o contraseña incorrectos.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final usuarioDatos = controlador.obtenerUsuario(usuario, contrasena);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Inicio de sesión exitoso.'),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pushReplacementNamed(
      context,
      '/principal',
      arguments: {
        'usuario': usuarioDatos?.usuario ?? usuario,
        'nombre': usuarioDatos?.nombre ?? 'Usuario',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de Sesión'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: FormularioLogin(
            usuarioController: usuarioController,
            contrasenaController: contrasenaController,
            ocultarContrasena: ocultarContrasena,
            onToggleOcultar: alternarVisibilidad,
            onIniciarSesion: iniciarSesion,
            onLimpiar: limpiarCampos,
          ),
        ),
      ),
    );
  }
}
