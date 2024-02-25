import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/core/di/dependency_injection.dart';
import 'package:system/features/collectors_screen/data/models/get_users_request_body.dart';
import 'package:system/features/collectors_screen/presentation/desktop/widgets/collectors_nav_bar_widget.dart';
import 'package:system/features/collectors_screen/presentation/desktop/widgets/collectors_screen_details.dart';

import '../../../../resellers_requests_screen/presentation/desktop/screen/resellers_requests_screen_desktop.dart';
import '../../../business_logic/collectors_cubit.dart';

class CollectorsScreen extends StatefulWidget {
  CollectorsScreen({super.key});

  @override
  State<CollectorsScreen> createState() => _CollectorsScreenState();
}

class _CollectorsScreenState extends State<CollectorsScreen> {
  int index = 0;

  List<Widget> body = [
    BlocProvider.value(
      value: getIt<CollectorsCubit>()
        ..getUsers(
          getUsersRequestBody: GetUsersRequestBody(
            username: '',
          ),
        ),
      child: const CollectorsScreenDetails(),
    ),
    const ResellersRequestsScreenDesktop(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CollectorsNavBarWidget(
          index: index,
          onTapCompanies: () {
            setState(() {
              index = 0;
            });
          },
          onTapBunch: () {
            setState(() {
              index = 1;
            });
          },
        ),
        Expanded(
          flex: 10,
          child: body[index],
        ),
      ],
    );
  }
}
