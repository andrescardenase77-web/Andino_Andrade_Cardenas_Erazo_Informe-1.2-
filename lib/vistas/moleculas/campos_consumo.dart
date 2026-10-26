import 'package:flutter/material.dart';
import '../atomos/campo_texto.dart';
import '../atomos/campo_desplegable.dart';

// Molecula: conjunto de campos de entrada para el registro del consumo de agua
class CamposConsumo extends StatelessWidget {
  final TextEditingController cuentaController;
  final TextEditingController clienteController;
  final TextEditingController lecturaAnteriorController;
  final TextEditingController lecturaActualController;
  final String tipoConsumidor;
  final ValueChanged<String?> onTipoConsumidorChanged;

  const CamposConsumo({
    super.key,
    required this.cuentaController,
    required this.clienteController,
    required this.lecturaAnteriorController,
    required this.lecturaActualController,
    required this.tipoConsumidor,
    required this.onTipoConsumidorChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CampoTexto(
          etiqueta: 'Número de cuenta / Medidor',
          controller: cuentaController,
          icono: Icons.numbers,
          tipoTeclado: TextInputType.number,
        ),
        const SizedBox(height: 14),
        CampoTexto(
          etiqueta: 'Nombre del cliente',
          controller: clienteController,
          icono: Icons.person_outline,
        ),
        const SizedBox(height: 14),
        CampoDesplegable(
          etiqueta: 'Tipo de consumidor',
          valorActual: tipoConsumidor,
          opciones: const ['Residencial', 'Comercial'],
          icono: Icons.category_outlined,
          onChanged: onTipoConsumidorChanged,
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: CampoTexto(
                etiqueta: 'Lectura anterior (m³)',
                controller: lecturaAnteriorController,
                icono: Icons.history,
                tipoTeclado: const TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: CampoTexto(
                etiqueta: 'Lectura actual (m³)',
                controller: lecturaActualController,
                icono: Icons.speed,
                tipoTeclado: const TextInputType.numberWithOptions(decimal: true),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
