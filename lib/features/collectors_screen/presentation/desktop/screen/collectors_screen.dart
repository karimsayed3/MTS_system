import 'package:flutter/material.dart';
import 'package:system/features/collectors_screen/presentation/desktop/widgets/collectors_screen_details.dart';

class CollectorsScreen extends StatelessWidget {
  const CollectorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 10,
          child: CollectorsScreenDetails(),
        ),
      ],
    );
  }
}
