import 'package:flutter/material.dart';

// Atomo: etiqueta visual (badge) para representar el rango tarifario de consumo
class EtiquetaRango extends StatelessWidget {
  final String rango;

  const EtiquetaRango({
    super.key,
    required this.rango,
  });

  Color _obtenerColor() {
    final texto = rango.toLowerCase();
    if (texto.contains('básica') || texto.contains('basica')) {
      return Colors.teal;
    } else if (texto.contains('intermedia')) {
      return Colors.orange.shade800;
    } else {
      return Colors.red.shade700;
    }
  }

  IconData _obtenerIcono() {
    final texto = rango.toLowerCase();
    if (texto.contains('básica') || texto.contains('basica')) {
      return Icons.eco_outlined;
    } else if (texto.contains('intermedia')) {
      return Icons.water_drop_outlined;
    } else {
      return Icons.warning_amber_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _obtenerColor();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _obtenerIcono(),
            size: 16,
            color: color,
          ),
          const SizedBox(width: 6),
          Text(
            rango,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
