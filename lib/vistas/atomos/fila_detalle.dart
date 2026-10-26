import 'package:flutter/material.dart';

// Atomo: fila para mostrar una etiqueta y su correspondiente valor
class FilaDetalle extends StatelessWidget {
  final String titulo;
  final String valor;
  final bool esDestacado;
  final Color? colorValor;

  const FilaDetalle({
    super.key,
    required this.titulo,
    required this.valor,
    this.esDestacado = false,
    this.colorValor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titulo,
            style: TextStyle(
              fontSize: esDestacado ? 15 : 14,
              fontWeight: esDestacado ? FontWeight.bold : FontWeight.normal,
              color: const Color(0xFF37474F),
            ),
          ),
          Text(
            valor,
            style: TextStyle(
              fontSize: esDestacado ? 17 : 14,
              fontWeight: esDestacado ? FontWeight.bold : FontWeight.w600,
              color: colorValor ??
                  (esDestacado
                      ? Theme.of(context).colorScheme.primary
                      : const Color(0xFF263238)),
            ),
          ),
        ],
      ),
    );
  }
}
