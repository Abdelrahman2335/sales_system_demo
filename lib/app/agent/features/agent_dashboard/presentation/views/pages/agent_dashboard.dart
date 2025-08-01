import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/presentation/views/widgets/agent_over_view.dart';
import 'package:sales_system_demo/app/agent/features/agent_dashboard/presentation/views/widgets/build_table.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/presentation/views/widgets/add_customer.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/presentation/manager/add_customer/add_customer_cubit.dart';
import 'package:sales_system_demo/app/agent/features/add_customer/data/repository/add_customer_repo_impl.dart';

class AgentDashboard extends StatefulWidget {
  const AgentDashboard({super.key});

  @override
  State<AgentDashboard> createState() => _AgentDashboardState();
}

class _AgentDashboardState extends State<AgentDashboard> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // final horizontalPadding = width > 1400 ? 280.0 : 16.0;
    // final verticalPadding = height > 800 ? 100.0 : 16.0;
    return Scaffold(
      appBar: buildAppBar(width, height),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [AgentOverView(), SizedBox(height: 50), BuildTable()],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget buildAppBar(double width, double height) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 12.0, top: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.only(right: 14, left: 14, top: 8),
            ),
            onPressed:
                () => showDialog(
                  context: context,
                  builder:
                      (_) => BlocProvider(
                        create:
                            (context) =>
                                AddCustomerCubit(AddCustomerRepoImpl()),
                        child: AddCustomer(),
                      ),
                ),
            child: Text("Add new customer"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 12.0, top: 8),
          child: CircleAvatar(radius: 21, child: Icon(Icons.person)),
        ),
      ],
    );
  }
}
