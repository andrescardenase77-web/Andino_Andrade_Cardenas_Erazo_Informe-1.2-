// Modelo que representa la informacion del consumo de agua y el calculo de valores
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
}
