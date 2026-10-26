import 'package:flutter/material.dart';
import '../../temas/tema_app.dart';

// Atomo: selector interactivo para elegir entre consumidor Residencial y Comercial
class SelectorTipoConsumidor extends StatelessWidget {
  final String valorSeleccionado;
  final ValueChanged<String> alCambiar;

  const SelectorTipoConsumidor({
    super.key,
    required this.valorSeleccionado,
    required this.alCambiar,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<String>(
      segments: const [
        ButtonSegment<String>(
          value: 'Residencial',
          label: Text('Residencial'),
          icon: Icon(Icons.home_outlined),
        ),
        ButtonSegment<String>(
          value: 'Comercial',
          label: Text('Comercial'),
          icon: Icon(Icons.store_outlined),
        ),
      ],
      selected: {valorSeleccionado},
      onSelectionChanged: (Set<String> nuevaSeleccion) {
        if (nuevaSeleccion.isNotEmpty) {
          alCambiar(nuevaSeleccion.first);
        }
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return TemaApp.colorPrimario;
            }
            return Colors.white;
          },
        ),
        foregroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.white;
            }
            return TemaApp.colorTexto;
          },
        ),
        iconColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.white;
            }
            return TemaApp.colorPrimario;
          },
        ),
      ),
    );
  }
}
