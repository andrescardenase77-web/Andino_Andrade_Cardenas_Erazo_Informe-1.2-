import '../modelos/consumo_modelo.dart';

// Controlador para gestionar la logica del calculo de consumo de agua potable
class ConsumoControlador {
  // Metodo para realizar los calculos segun lecturas, tipo y rangos de consumo
  ConsumoModelo calcularPago({
    required String numeroCuenta,
    required String nombreCliente,
    required double lecturaAnterior,
    required double lecturaActual,
    required String tipoConsumidor,
  }) {
    // Calculo del consumo principal
    final double consumo = lecturaActual - lecturaAnterior;

    double tarifaM3;
    String rangoConsumo;
    double cargoFijo;

    // Asignacion de tarifas y cargos fijos segun rangos de consumo y tipo
    if (consumo <= 15) {
      rangoConsumo = 'Básica (0 - 15 m³)';
      tarifaM3 = tipoConsumidor == 'Comercial' ? 0.80 : 0.50;
      cargoFijo = tipoConsumidor == 'Comercial' ? 3.00 : 1.50;
    } else if (consumo <= 30) {
      rangoConsumo = 'Intermedia (16 - 30 m³)';
      tarifaM3 = tipoConsumidor == 'Comercial' ? 1.20 : 0.75;
      cargoFijo = tipoConsumidor == 'Comercial' ? 4.00 : 2.00;
    } else {
      rangoConsumo = 'Superior (> 30 m³)';
      tarifaM3 = tipoConsumidor == 'Comercial' ? 1.80 : 1.10;
      cargoFijo = tipoConsumidor == 'Comercial' ? 5.00 : 2.50;
    }

    // Porcentaje de recargo (por ejemplo alcantarillado o tasa administrativa)
    final double porcentajeRecargo = tipoConsumidor == 'Comercial' ? 10.0 : 5.0;

    // Calculos de rubros
    final double valorConsumo = consumo * tarifaM3;
    final double subtotal = valorConsumo + cargoFijo;
    final double recargo = subtotal * (porcentajeRecargo / 100);
    final double totalPagar = subtotal + recargo;

    return ConsumoModelo(
      numeroCuenta: numeroCuenta,
      nombreCliente: nombreCliente,
      lecturaAnterior: lecturaAnterior,
      lecturaActual: lecturaActual,
      tipoConsumidor: tipoConsumidor,
      consumo: consumo,
      tarifaM3: tarifaM3,
      rangoConsumo: rangoConsumo,
      valorConsumo: valorConsumo,
      cargoFijo: cargoFijo,
      subtotal: subtotal,
      porcentajeRecargo: porcentajeRecargo,
      recargo: recargo,
      totalPagar: totalPagar,
    );
  }

  // Metodo para validar la coherencia de las lecturas ingresadas
  String? validarLecturas(double anterior, double actual) {
    if (actual < anterior) {
      return 'La lectura actual no puede ser menor que la lectura anterior.';
    }
    return null;
  }
}
