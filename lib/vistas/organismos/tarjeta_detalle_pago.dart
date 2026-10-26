import 'package:flutter/material.dart';
import '../../modelos/consumo_modelo.dart';
import '../moleculas/info_cliente_molecula.dart';
import '../moleculas/resumen_pago_molecula.dart';
import '../atomos/boton_primario.dart';
import '../atomos/boton_secundario.dart';

// Organismo: comprobante completo de la planilla de agua potable
class TarjetaDetallePago extends StatelessWidget {
  final ConsumoModelo modelo;
  final VoidCallback onNuevaConsulta;
  final VoidCallback onCerrarSesion;

  const TarjetaDetallePago({
    super.key,
    required this.modelo,
    required this.onNuevaConsulta,
    required this.onCerrarSesion,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.receipt_long,
                  color: Color(0xFF0288D1),
                  size: 28,
                ),
                SizedBox(width: 8),
                Text(
                  'Comprobante de Pago',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF263238),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            InfoClienteMolecula(modelo: modelo),
            const SizedBox(height: 16),
            ResumenPagoMolecula(modelo: modelo),
            const SizedBox(height: 24),
            BotonPrimario(
              texto: 'Realizar Nuevo Registro',
              onPressed: onNuevaConsulta,
            ),
            const SizedBox(height: 10),
            BotonSecundario(
              texto: 'Cerrar Sesión',
              onPressed: onCerrarSesion,
            ),
          ],
        ),
      ),
    );
  }
}
