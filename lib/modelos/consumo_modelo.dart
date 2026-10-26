// Modelo que representa los datos de consumo de agua potable y su calculo detallado
class ConsumoModelo {
  final String numeroCuenta;
  final String nombreCliente;
  final double lecturaAnterior;
  final double lecturaActual;
  final String tipoConsumidor; // 'Residencial' o 'Comercial'
  final double consumoM3;
  final String rangoTarifario;
  final double tarifaPorM3;
  final double valorConsumo;
  final double cargoFijo;
  final double subtotal;
  final double porcentajeRecargo;
  final double recargo;
  final double totalPagar;

  const ConsumoModelo({
    required this.numeroCuenta,
    required this.nombreCliente,
    required this.lecturaAnterior,
    required this.lecturaActual,
    required this.tipoConsumidor,
    required this.consumoM3,
    required this.rangoTarifario,
    required this.tarifaPorM3,
    required this.valorConsumo,
    required this.cargoFijo,
    required this.subtotal,
    required this.porcentajeRecargo,
    required this.recargo,
    required this.totalPagar,
  });

  // Metodo para transformar el modelo a un Map (util para navegacion con argumentos)
  Map<String, dynamic> toMap() {
    return {
      'numeroCuenta': numeroCuenta,
      'nombreCliente': nombreCliente,
      'lecturaAnterior': lecturaAnterior,
      'lecturaActual': lecturaActual,
      'tipoConsumidor': tipoConsumidor,
      'consumoM3': consumoM3,
      'rangoTarifario': rangoTarifario,
      'tarifaPorM3': tarifaPorM3,
      'valorConsumo': valorConsumo,
      'cargoFijo': cargoFijo,
      'subtotal': subtotal,
      'porcentajeRecargo': porcentajeRecargo,
      'recargo': recargo,
      'totalPagar': totalPagar,
    };
  }

  // Factory para reconstruir el modelo a partir de un Map
  factory ConsumoModelo.fromMap(Map<String, dynamic> map) {
    return ConsumoModelo(
      numeroCuenta: map['numeroCuenta'] ?? '',
      nombreCliente: map['nombreCliente'] ?? '',
      lecturaAnterior: (map['lecturaAnterior'] as num?)?.toDouble() ?? 0.0,
      lecturaActual: (map['lecturaActual'] as num?)?.toDouble() ?? 0.0,
      tipoConsumidor: map['tipoConsumidor'] ?? 'Residencial',
      consumoM3: (map['consumoM3'] as num?)?.toDouble() ?? 0.0,
      rangoTarifario: map['rangoTarifario'] ?? '',
      tarifaPorM3: (map['tarifaPorM3'] as num?)?.toDouble() ?? 0.0,
      valorConsumo: (map['valorConsumo'] as num?)?.toDouble() ?? 0.0,
      cargoFijo: (map['cargoFijo'] as num?)?.toDouble() ?? 0.0,
      subtotal: (map['subtotal'] as num?)?.toDouble() ?? 0.0,
      porcentajeRecargo: (map['porcentajeRecargo'] as num?)?.toDouble() ?? 0.0,
      recargo: (map['recargo'] as num?)?.toDouble() ?? 0.0,
      totalPagar: (map['totalPagar'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
