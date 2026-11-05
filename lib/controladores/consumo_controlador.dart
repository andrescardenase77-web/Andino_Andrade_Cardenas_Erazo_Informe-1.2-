import '../modelos/consumo_modelo.dart';

class ConsumoControlador {
  static const double tarifaResidencialBasica = 0.50;
  static const double tarifaComercialBasica = 0.80;

  static const double tarifaResidencialIntermedia = 0.75;
  static const double tarifaComercialIntermedia = 1.20;

  static const double tarifaResidencialSuperior = 1.10;
  static const double tarifaComercialSuperior = 1.80;

  static const double cargoFijoResidencial = 1.50;
  static const double cargoFijoComercial = 3.00;

  static const double recargoComercial = 10.0;
  static const double recargoResidencial = 5.0;

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

  String? validarLecturas(double anterior, double actual) {
    if (actual < anterior) {
      return 'La lectura actual no puede ser menor que la lectura anterior.';
    }
    return null;
  }

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

  String obtenerRangoTarifario(double consumo) {
    if (consumo <= 15.0) {
      return 'Básica (0 - 15 m³)';
    } else if (consumo <= 30.0) {
      return 'Intermedia (16 - 30 m³)';
    } else {
      return 'Superior (> 30 m³)';
    }
  }

  double obtenerCargoFijo(String tipoConsumidor) {
    return tipoConsumidor.toLowerCase() == 'comercial'
        ? cargoFijoComercial
        : cargoFijoResidencial;
  }

  double calcularPorcentajeRecargo(double consumo, String tipoConsumidor) {
    return tipoConsumidor.toLowerCase() == 'comercial'
        ? recargoComercial
        : recargoResidencial;
  }

  ConsumoModelo calcularPago({
    required String numeroCuenta,
    required String nombreCliente,
    required double lecturaAnterior,
    required double lecturaActual,
    required String tipoConsumidor,
  }) {
    final double consumo = lecturaActual - lecturaAnterior;
    final double tarifaM3 = obtenerTarifaPorM3(consumo, tipoConsumidor);
    final String rangoConsumo = obtenerRangoTarifario(consumo);
    final double cargoFijo = obtenerCargoFijo(tipoConsumidor);
    final double porcentajeRecargo = calcularPorcentajeRecargo(consumo, tipoConsumidor);

    final double valorConsumo = consumo * tarifaM3;
    final double subtotal = valorConsumo + cargoFijo;
    final double recargo = subtotal * (porcentajeRecargo / 100);
    final double totalPagar = subtotal + recargo;

    return ConsumoModelo(
      numeroCuenta: numeroCuenta.trim(),
      nombreCliente: nombreCliente.trim(),
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

  ConsumoModelo procesarConsumo({
    required String numeroCuenta,
    required String nombreCliente,
    required double lecturaAnterior,
    required double lecturaActual,
    required String tipoConsumidor,
  }) {
    return calcularPago(
      numeroCuenta: numeroCuenta,
      nombreCliente: nombreCliente,
      lecturaAnterior: lecturaAnterior,
      lecturaActual: lecturaActual,
      tipoConsumidor: tipoConsumidor,
    );
  }
}
