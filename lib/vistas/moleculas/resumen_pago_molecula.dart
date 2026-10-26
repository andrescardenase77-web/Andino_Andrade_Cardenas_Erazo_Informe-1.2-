import 'package:flutter/material.dart';
import '../../modelos/consumo_modelo.dart';
import '../atomos/fila_detalle.dart';

// Molecula: seccion con el desglose del consumo, rubros y total a pagar
class ResumenPagoMolecula extends StatelessWidget {
  final ConsumoModelo modelo;

  const ResumenPagoMolecula({
    super.key,
    required this.modelo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Desglose del Consumo',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0288D1),
          ),
        ),
        const SizedBox(height: 6),
        FilaDetalle(
          titulo: 'Lectura anterior:',
          valor: '${modelo.lecturaAnterior.toStringAsFixed(2)} m³',
        ),
        FilaDetalle(
          titulo: 'Lectura actual:',
          valor: '${modelo.lecturaActual.toStringAsFixed(2)} m³',
        ),
        FilaDetalle(
          titulo: 'Consumo total:',
          valor: '${modelo.consumo.toStringAsFixed(2)} m³',
          esDestacado: true,
        ),
        FilaDetalle(
          titulo: 'Rango de tarifa:',
          valor: modelo.rangoConsumo,
        ),
        const Divider(height: 20),
        const Text(
          'Valores y Cargos',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0288D1),
          ),
        ),
        const SizedBox(height: 6),
        FilaDetalle(
          titulo: 'Tarifa aplicada:',
          valor: '\$${modelo.tarifaM3.toStringAsFixed(2)} / m³',
        ),
        FilaDetalle(
          titulo: 'Valor del consumo:',
          valor: '\$${modelo.valorConsumo.toStringAsFixed(2)}',
        ),
        FilaDetalle(
          titulo: 'Cargo fijo:',
          valor: '\$${modelo.cargoFijo.toStringAsFixed(2)}',
        ),
        FilaDetalle(
          titulo: 'Subtotal:',
          valor: '\$${modelo.subtotal.toStringAsFixed(2)}',
        ),
        FilaDetalle(
          titulo: 'Recargo (${modelo.porcentajeRecargo.toStringAsFixed(0)}%):',
          valor: '\$${modelo.recargo.toStringAsFixed(2)}',
        ),
        const Divider(height: 24, thickness: 1.5),
        FilaDetalle(
          titulo: 'TOTAL A PAGAR:',
          valor: '\$${modelo.totalPagar.toStringAsFixed(2)}',
          esDestacado: true,
          colorValor: const Color(0xFF2E7D32),
        ),
      ],
    );
  }
}
