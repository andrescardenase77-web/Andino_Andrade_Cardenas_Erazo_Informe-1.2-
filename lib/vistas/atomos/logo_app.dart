import 'package:flutter/material.dart';

// Atomo: icono representativo del servicio de agua
class LogoApp extends StatelessWidget {
  const LogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).colorScheme.primary;

    return Container(
      width: 72,
      height: 72,
      decoration: const BoxDecoration(
        color: Color(0xFFE1F5FE),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.water_drop,
        size: 40,
        color: color,
      ),
    );
  }
}
