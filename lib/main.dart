import 'package:flutter/material.dart';
import 'temas/tema_app.dart';
import 'vistas/pantallas/login_pantalla.dart';
import 'vistas/pantallas/registro_consumo_pantalla.dart';
import 'vistas/pantallas/detalle_pago_pantalla.dart';

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
        '/principal': (context) => const RegistroConsumoPantalla(),
        '/detalle': (context) => const DetallePagoPantalla(),
      },
    );
  }
}
