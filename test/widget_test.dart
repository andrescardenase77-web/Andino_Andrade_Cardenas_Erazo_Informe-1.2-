import 'package:flutter_test/flutter_test.dart';
import 'package:tarea_3/main.dart';

void main() {
  testWidgets('Carga inicial de la aplicación MyApp', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Inicio de Sesión'), findsOneWidget);
  });
}
