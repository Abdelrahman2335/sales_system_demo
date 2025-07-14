import 'package:flutter/material.dart';
import 'package:sales_system_demo/app/admin/features/search/presentation/widgets/custom_search_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [CustomTextField()]));
  }
}
