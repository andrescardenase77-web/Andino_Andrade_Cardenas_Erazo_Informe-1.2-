import 'package:flutter/material.dart';

class CampoDesplegable extends StatelessWidget {
  final String etiqueta;
  final String valorActual;
  final List<String> opciones;
  final ValueChanged<String?> onChanged;
  final IconData? icono;

  const CampoDesplegable({
    super.key,
    required this.etiqueta,
    required this.valorActual,
    required this.opciones,
    required this.onChanged,
    this.icono,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: valorActual,
      decoration: InputDecoration(
        labelText: etiqueta,
        prefixIcon: icono != null ? Icon(icono) : null,
      ),
      items: opciones.map((String opcion) {
        return DropdownMenuItem<String>(
          value: opcion,
          child: Text(opcion),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
