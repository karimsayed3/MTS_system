import 'package:flutter/material.dart';
import 'package:system/features/companies_screen/presentation/widgets/bunch_screen_details.dart';
import '../widgets/collectors_screen_details.dart';

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
