import 'package:flutter/material.dart';
import 'temas/tema_app.dart';
import 'vistas/pantallas/login_pantalla.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pago de Agua Potable',
      theme: TemaApp.obtenerTema(),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPantalla(),
        // Ruta para la pantalla principal que realizaran los companeros de equipo
        '/principal': (context) => const PantallaPrincipalTemporal(),
      },
    );
  }
}

// Pantalla temporal para probar la navegacion del inicio de sesion
class PantallaPrincipalTemporal extends StatelessWidget {
  const PantallaPrincipalTemporal({super.key});

  @override
  Widget build(BuildContext context) {
    final argumentos =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String nombre = argumentos?['nombre'] ?? 'Usuario';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla Principal'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 70,
                color: Colors.green,
              ),
              const SizedBox(height: 16),
              Text(
                'Bienvenido, $nombre',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Espacio para las siguientes pantallas del equipo.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF546E7A),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: const Text('Cerrar sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
