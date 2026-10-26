import 'package:flutter/material.dart';
import '../../modelos/consumo_modelo.dart';
import '../atomos/fila_detalle.dart';

// Molecula: tarjeta contenedora con los datos generales del abonado/cliente
class InfoClienteMolecula extends StatelessWidget {
  final ConsumoModelo modelo;

  const InfoClienteMolecula({
    super.key,
    required this.modelo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE1F5FE),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          FilaDetalle(
            titulo: 'N° de Cuenta:',
            valor: modelo.numeroCuenta,
          ),
          FilaDetalle(
            titulo: 'Cliente:',
            valor: modelo.nombreCliente,
          ),
          FilaDetalle(
            titulo: 'Tipo de Consumidor:',
            valor: modelo.tipoConsumidor,
          ),
        ],
      ),
    );
  }
}
