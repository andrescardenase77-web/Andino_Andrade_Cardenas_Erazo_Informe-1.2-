import 'package:flutter/material.dart';
import '../moleculas/campos_consumo.dart';
import '../moleculas/botones_operacion.dart';

// Organismo: tarjeta que agrupa el titulo, los campos de consumo y los botones de accion
class FormularioConsumo extends StatelessWidget {
  final TextEditingController cuentaController;
  final TextEditingController clienteController;
  final TextEditingController lecturaAnteriorController;
  final TextEditingController lecturaActualController;
  final String tipoConsumidor;
  final ValueChanged<String?> onTipoConsumidorChanged;
  final VoidCallback onCalcular;
  final VoidCallback onLimpiar;

  const FormularioConsumo({
    super.key,
    required this.cuentaController,
    required this.clienteController,
    required this.lecturaAnteriorController,
    required this.lecturaActualController,
    required this.tipoConsumidor,
    required this.onTipoConsumidorChanged,
    required this.onCalcular,
    required this.onLimpiar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.water_drop,
                  color: Color(0xFF0288D1),
                  size: 28,
                ),
                SizedBox(width: 8),
                Text(
                  'Registro de Consumo',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF263238),
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            CamposConsumo(
              cuentaController: cuentaController,
              clienteController: clienteController,
              lecturaAnteriorController: lecturaAnteriorController,
              lecturaActualController: lecturaActualController,
              tipoConsumidor: tipoConsumidor,
              onTipoConsumidorChanged: onTipoConsumidorChanged,
            ),
            const SizedBox(height: 24),
            BotonesOperacion(
              onCalcular: onCalcular,
              onLimpiar: onLimpiar,
            ),
          ],
        ),
      ),
    );
  }
}
