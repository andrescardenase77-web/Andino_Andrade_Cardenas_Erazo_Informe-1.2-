import 'package:flutter_test/flutter_test.dart';
import 'package:tarea_3/controladores/consumo_controlador.dart';

void main() {
  group('Pruebas unitarias de ConsumoControlador', () {
    final controlador = ConsumoControlador();

    test('Validación de entradas correctas', () {
      final error = controlador.validarEntradas(
        numeroCuenta: 'CTA-100234',
        nombreCliente: 'Juan Pérez',
        lecturaAnteriorStr: '120.0',
        lecturaActualStr: '135.0',
        tipoConsumidor: 'Residencial',
      );
      expect(error, isNull);
    });

    test('Validación falla si la lectura actual es menor a la anterior', () {
      final error = controlador.validarEntradas(
        numeroCuenta: 'CTA-100234',
        nombreCliente: 'Juan Pérez',
        lecturaAnteriorStr: '150.0',
        lecturaActualStr: '120.0',
        tipoConsumidor: 'Residencial',
      );
      expect(error, equals('La lectura actual no puede ser menor a la lectura anterior.'));
    });

    test('Cálculo correcto de consumo en rango básico (0 a 15 m3) - Residencial', () {
      // 135 - 125 = 10 m3
      final resultado = controlador.procesarConsumo(
        numeroCuenta: 'CTA-001',
        nombreCliente: 'Carlos Ruiz',
        lecturaAnterior: 125.0,
        lecturaActual: 135.0,
        tipoConsumidor: 'Residencial',
      );

      expect(resultado.consumoM3, equals(10.0));
      expect(resultado.rangoTarifario, contains('Básica'));
      expect(resultado.tarifaPorM3, equals(0.35));
      expect(resultado.valorConsumo, closeTo(3.50, 0.01));
      expect(resultado.cargoFijo, equals(1.50));
      expect(resultado.subtotal, closeTo(5.00, 0.01));
      expect(resultado.recargo, equals(0.0));
      expect(resultado.totalPagar, closeTo(5.00, 0.01));
    });

    test('Cálculo correcto en rango superior (> 30 m3) con recargo comercial', () {
      // 240 - 200 = 40 m3
      final resultado = controlador.procesarConsumo(
        numeroCuenta: 'CTA-COM-99',
        nombreCliente: 'Restaurante Central',
        lecturaAnterior: 200.0,
        lecturaActual: 240.0,
        tipoConsumidor: 'Comercial',
      );

      expect(resultado.consumoM3, equals(40.0));
      expect(resultado.rangoTarifario, contains('Superior'));
      expect(resultado.tarifaPorM3, equals(1.30));
      // Valor consumo = 40 * 1.30 = 52.00
      expect(resultado.valorConsumo, closeTo(52.00, 0.01));
      // Cargo fijo comercial = 3.00
      expect(resultado.cargoFijo, equals(3.00));
      // Subtotal = 52.00 + 3.00 = 55.00
      expect(resultado.subtotal, closeTo(55.00, 0.01));
      // Recargo comercial (5%) + exceso (3%) = 8%
      expect(resultado.porcentajeRecargo, closeTo(0.08, 0.001));
      // Recargo = 55.00 * 0.08 = 4.40
      expect(resultado.recargo, closeTo(4.40, 0.01));
      // Total = 55.00 + 4.40 = 59.40
      expect(resultado.totalPagar, closeTo(59.40, 0.01));
    });
  });
}
