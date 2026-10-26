import 'package:flutter/material.dart';
import '../atomos/logo_app.dart';
import '../atomos/texto_titulo.dart';

// Molecula: encabezado visual que incluye el logo y el titulo
class EncabezadoLogin extends StatelessWidget {
  const EncabezadoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LogoApp(),
        SizedBox(height: 14),
        TextoTitulo(texto: 'Agua Potable'),
        SizedBox(height: 4),
        Text(
          'Consulta y pago de consumo',
          style: TextStyle(
            color: Color(0xFF546E7A),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
