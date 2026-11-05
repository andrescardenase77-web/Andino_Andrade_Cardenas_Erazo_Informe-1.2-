class ConsumoModelo {
  final String numeroCuenta;
  final String nombreCliente;
  final double lecturaAnterior;
  final double lecturaActual;
  final String tipoConsumidor;
  final double consumo;
  final double tarifaM3;
  final String rangoConsumo;
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
    required this.consumo,
    required this.tarifaM3,
    required this.rangoConsumo,
    required this.valorConsumo,
    required this.cargoFijo,
    required this.subtotal,
    required this.porcentajeRecargo,
    required this.recargo,
    required this.totalPagar,
  });

  double get consumoM3 => consumo;
  String get rangoTarifario => rangoConsumo;
  double get tarifaPorM3 => tarifaM3;

  Map<String, dynamic> toMap() {
    return {
      'numeroCuenta': numeroCuenta,
      'nombreCliente': nombreCliente,
      'lecturaAnterior': lecturaAnterior,
      'lecturaActual': lecturaActual,
      'tipoConsumidor': tipoConsumidor,
      'consumo': consumo,
      'tarifaM3': tarifaM3,
      'rangoConsumo': rangoConsumo,
      'valorConsumo': valorConsumo,
      'cargoFijo': cargoFijo,
      'subtotal': subtotal,
      'porcentajeRecargo': porcentajeRecargo,
      'recargo': recargo,
      'totalPagar': totalPagar,
    };
  }

  factory ConsumoModelo.fromMap(Map<String, dynamic> map) {
    final consumoVal = (map['consumo'] as num?)?.toDouble() ??
        (map['consumoM3'] as num?)?.toDouble() ??
        0.0;
    final tarifaVal = (map['tarifaM3'] as num?)?.toDouble() ??
        (map['tarifaPorM3'] as num?)?.toDouble() ??
        0.0;
    final rangoVal = (map['rangoConsumo'] as String?) ??
        (map['rangoTarifario'] as String?) ??
        '';

    return ConsumoModelo(
      numeroCuenta: map['numeroCuenta'] ?? '',
      nombreCliente: map['nombreCliente'] ?? '',
      lecturaAnterior: (map['lecturaAnterior'] as num?)?.toDouble() ?? 0.0,
      lecturaActual: (map['lecturaActual'] as num?)?.toDouble() ?? 0.0,
      tipoConsumidor: map['tipoConsumidor'] ?? 'Residencial',
      consumo: consumoVal,
      tarifaM3: tarifaVal,
      rangoConsumo: rangoVal,
      valorConsumo: (map['valorConsumo'] as num?)?.toDouble() ?? 0.0,
      cargoFijo: (map['cargoFijo'] as num?)?.toDouble() ?? 0.0,
      subtotal: (map['subtotal'] as num?)?.toDouble() ?? 0.0,
      porcentajeRecargo: (map['porcentajeRecargo'] as num?)?.toDouble() ?? 0.0,
      recargo: (map['recargo'] as num?)?.toDouble() ?? 0.0,
      totalPagar: (map['totalPagar'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
