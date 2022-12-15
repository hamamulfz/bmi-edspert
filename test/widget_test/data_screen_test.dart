import 'package:bmi/main.dart';
import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("BMI Data Screen Test Widget", (tester) async {
    tester.binding.window.physicalSizeTestValue = Size(1200, 2296);
    await tester.pumpWidget(const DataScreenTest());

    final findMaleIcon = find.byIcon(Icons.male);
    final findFemaleText = find.text("Female");
    final findChecksIcon = find.byIcon(Icons.check_circle);

    expect(findMaleIcon, findsOneWidget);
    expect(findFemaleText, findsOneWidget);
    expect(findChecksIcon, findsNWidgets(2));
    
    final findHasilByText =find.text("Hasil Perhitungan");
    expect(findHasilByText, findsNothing);


    final findHitung = find.text("Hitung BMI");
    expect(findHitung, findsOneWidget);
    await tester.tap(findHitung);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(findMaleIcon, findsNothing);
    // sudah pindah halaman
    final findHasilByKey =find.byKey(const Key("calculate"));
    expect(findHasilByText, findsOneWidget);
    expect(findHasilByKey, findsOneWidget);
  });
}

class DataScreenTest extends StatelessWidget {
  const DataScreenTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BmiDataScreen(),
    );
  }
}
