import 'package:flutter/material.dart';

import '../widgets/large_text_box.dart';

class MotivationScreen extends StatelessWidget {
  const MotivationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LargeTextBox(
      text: 'Small consistent steps create big results. Keep going.',
    );
  }
}
