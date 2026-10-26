import '../modelos/consumo_modelo.dart';

// Controlador para gestionar las validaciones y los calculos de consumo de agua potable
class ConsumoControlador {
  // Constantes de tarifas segun rango de consumo y tipo de consumidor
  // Rango 1: 0 a 15 m3 (Tarifa basica)
  static const double tarifaResidencialBasica = 0.35;
  static const double tarifaComercialBasica = 0.50;

  // Rango 2: 16 a 30 m3 (Tarifa intermedia)
  static const double tarifaResidencialIntermedia = 0.60;
  static const double tarifaComercialIntermedia = 0.85;

  // Rango 3: mas de 30 m3 (Tarifa superior)
  static const double tarifaResidencialSuperior = 0.95;
  static const double tarifaComercialSuperior = 1.30;

  // Cargos fijos por infraestructura segun tipo de consumidor
  static const double cargoFijoResidencial = 1.50;
  static const double cargoFijoComercial = 3.00;

  // Porcentajes de recargo
  static const double recargoComercial = 0.05; // 5% por tarifa comercial
  static const double recargoExcesoConsumo = 0.03; // 3% adicional si supera 30 m3

  // Metodo para validar los datos ingresados en el formulario
  String? validarEntradas({
    required String numeroCuenta,
    required String nombreCliente,
    required String lecturaAnteriorStr,
    required String lecturaActualStr,
    required String tipoConsumidor,
  }) {
    if (numeroCuenta.trim().isEmpty) {
      return 'El número de cuenta es obligatorio.';
    }

    if (nombreCliente.trim().isEmpty) {
      return 'El nombre del cliente es obligatorio.';
    }

    if (lecturaAnteriorStr.trim().isEmpty) {
      return 'Ingrese la lectura anterior del medidor.';
    }

    if (lecturaActualStr.trim().isEmpty) {
      return 'Ingrese la lectura actual del medidor.';
    }

    final double? anterior = double.tryParse(lecturaAnteriorStr.trim());
    final double? actual = double.tryParse(lecturaActualStr.trim());

    if (anterior == null || anterior < 0) {
      return 'La lectura anterior debe ser un número válido mayor o igual a 0.';
    }

    if (actual == null || actual < 0) {
      return 'La lectura actual debe ser un número válido mayor o igual a 0.';
    }

    if (actual < anterior) {
      return 'La lectura actual no puede ser menor a la lectura anterior.';
    }

    if (tipoConsumidor != 'Residencial' && tipoConsumidor != 'Comercial') {
      return 'Seleccione un tipo de consumidor válido.';
    }

    return null;
  }

  // Metodo para determinar la tarifa por m3 segun rango y tipo
  double obtenerTarifaPorM3(double consumo, String tipoConsumidor) {
    final bool esComercial = tipoConsumidor.toLowerCase() == 'comercial';

    if (consumo <= 15.0) {
      return esComercial ? tarifaComercialBasica : tarifaResidencialBasica;
    } else if (consumo <= 30.0) {
      return esComercial ? tarifaComercialIntermedia : tarifaResidencialIntermedia;
    } else {
      return esComercial ? tarifaComercialSuperior : tarifaResidencialSuperior;
    }
  }

  // Metodo para obtener el nombre descriptivo del rango tarifario
  String obtenerRangoTarifario(double consumo) {
    if (consumo <= 15.0) {
      return 'Básica (0 a 15 m³)';
    } else if (consumo <= 30.0) {
      return 'Intermedia (16 a 30 m³)';
    } else {
      return 'Superior (más de 30 m³)';
    }
  }

  // Metodo para obtener el cargo fijo correspondiente
  double obtenerCargoFijo(String tipoConsumidor) {
    return tipoConsumidor.toLowerCase() == 'comercial'
        ? cargoFijoComercial
        : cargoFijoResidencial;
  }

  // Metodo para calcular el porcentaje de recargo acumulado
  double calcularPorcentajeRecargo(double consumo, String tipoConsumidor) {
    double porcentaje = 0.0;

    // Recargo comercial
    if (tipoConsumidor.toLowerCase() == 'comercial') {
      porcentaje += recargoComercial;
    }

    // Recargo por exceso de consumo (>30 m3)
    if (consumo > 30.0) {
      porcentaje += recargoExcesoConsumo;
    }

    return porcentaje;
  }

  // Metodo principal para procesar y calcular los valores de la planilla
  ConsumoModelo procesarConsumo({
    required String numeroCuenta,
    required String nombreCliente,
    required double lecturaAnterior,
    required double lecturaActual,
    required String tipoConsumidor,
  }) {
    // 1. Calculo principal: Consumo = Lectura actual - Lectura anterior
    final double consumoM3 = lecturaActual - lecturaAnterior;

    // 2. Determinar tarifa por m3 y rango
    final double tarifaM3 = obtenerTarifaPorM3(consumoM3, tipoConsumidor);
    final String rango = obtenerRangoTarifario(consumoM3);

    // 3. Valor consumo = Consumo * tarifa por m3
    final double valorConsumo = consumoM3 * tarifaM3;

    // 4. Cargo fijo
    final double cargoFijo = obtenerCargoFijo(tipoConsumidor);

    // 5. Subtotal = Valor consumo + Cargo fijo
    final double subtotal = valorConsumo + cargoFijo;

    // 6. Recargo = Subtotal * porcentaje de recargo
    final double porcentajeRecargo = calcularPorcentajeRecargo(consumoM3, tipoConsumidor);
    final double recargo = subtotal * porcentajeRecargo;

    // 7. Total a pagar = Subtotal + Recargo
    final double totalPagar = subtotal + recargo;

    return ConsumoModelo(
      numeroCuenta: numeroCuenta.trim(),
      nombreCliente: nombreCliente.trim(),
      lecturaAnterior: lecturaAnterior,
      lecturaActual: lecturaActual,
      tipoConsumidor: tipoConsumidor,
      consumoM3: consumoM3,
      rangoTarifario: rango,
      tarifaPorM3: tarifaM3,
      valorConsumo: valorConsumo,
      cargoFijo: cargoFijo,
      subtotal: subtotal,
      porcentajeRecargo: porcentajeRecargo,
      recargo: recargo,
      totalPagar: totalPagar,
    );
  }
}
