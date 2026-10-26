import 'package:flutter/material.dart';

// Definicion del tema visual de la aplicacion
class TemaApp {
  // Colores principales inspirados en el servicio de agua potable
  static const Color colorPrimario = Color(0xFF0288D1);
  static const Color colorPrimarioOscuro = Color(0xFF01579B);
  static const Color colorFondo = Color(0xFFF4F7F9);
  static const Color colorTexto = Color(0xFF263238);
  static const Color colorGrisBorde = Color(0xFFCFD8DC);

  // Metodo que retorna la configuracion completa de ThemeData
  static ThemeData obtenerTema() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: colorFondo,
      colorScheme: ColorScheme.fromSeed(
        seedColor: colorPrimario,
        primary: colorPrimario,
        surface: Colors.white,
      ),

      // Tipografia general
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: colorTexto,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: colorTexto,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: colorTexto,
        ),
      ),

      // Estilo de la barra superior AppBar
      appBarTheme: const AppBarTheme(
        backgroundColor: colorPrimario,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 2,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),

      // Estilo de los campos de entrada de texto
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: colorGrisBorde),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: colorGrisBorde),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: colorPrimario, width: 2),
        ),
        labelStyle: const TextStyle(color: colorTexto),
        prefixIconColor: colorPrimario,
      ),

      // Estilo para botones principales
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorPrimario,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // Estilo para botones secundarios
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorPrimario,
          side: const BorderSide(color: colorPrimario, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
