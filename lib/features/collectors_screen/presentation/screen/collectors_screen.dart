import 'package:flutter/material.dart';
import 'package:system/features/collectors_screen/presentation/widgets/collectors_screen_details.dart';

class CollectorsScreen extends StatefulWidget {
  const CollectorsScreen({super.key});

  @override
  State<CollectorsScreen> createState() => _CollectorsScreenState();
}

class _CollectorsScreenState extends State<CollectorsScreen> {

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // CompaniesNavBarWidget(
        //   index: index,
        //   onTapCompanies: () {
        //     setState(() {
        //       index = 0;
        //     });
        //   },
        //   onTapBunch: () {
        //     setState(() {
        //       index = 1;
        //     });
        //   },
        // ),
        Expanded(
          flex: 10,
          child: CollectorsScreenDetails(),
        ),
      ],
    );
  }
}
