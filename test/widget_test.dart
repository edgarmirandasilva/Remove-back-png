import 'package:flutter_test/flutter_test.dart';
import 'package:remove_background_app/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const RemoveBackgroundApp());

    // Verify that the app title is displayed
    expect(find.text('Background Remover'), findsOneWidget);

    // Verify that the main action buttons are present
    expect(find.text('Gallery'), findsOneWidget);
    expect(find.text('Camera'), findsOneWidget);
    expect(find.text('Remove Background'), findsOneWidget);
  });
}
